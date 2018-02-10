package com.tian.order.service.impl;

import com.tian.common.pojo.AdminOrders;
import com.tian.common.pojo.Result;
import com.tian.common.util.DateUtils;
import com.tian.common.util.SessionUtil;
import com.tian.common.util.ShiroUtil;
import com.tian.common.util.StringUtil;
import com.tian.order.mapper.CategoryMapper;
import com.tian.order.mapper.OrderMapper;
import com.tian.order.mapper.UserMapper;
import com.tian.order.pojo.*;
import com.tian.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {


    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public List<AdminOrders> getOrders(Long userId, Long categoryId) {
        List<AdminOrders> adminOrders = new ArrayList<>();
        AdminOrders adminOrder = null;
        // 如果是admin用户返回所有账单信息,并获取对应账单用户名称
        if (ShiroUtil.isAdmin(userId)) {
            List<Order> orders = orderMapper.getOrders(null, categoryId);
            for (Order order : orders) {
                String userName = userMapper.selectByPrimaryKey(order.getUserId()).getUserName();
                adminOrder = new AdminOrders(userName, order);
                adminOrders.add(adminOrder);
            }
        } else {
            List<Order> orders = orderMapper.getOrders(userId, categoryId);
            for (Order order : orders) {
                adminOrder = new AdminOrders(null, order);
                adminOrders.add(adminOrder);
            }
        }
        return adminOrders;
    }

    @Override
    public Result save(Order order) {
        // 补全信息
        order.setCreatetime(new Date());
        order.setUpdatetime(new Date());
        User user = (User) SessionUtil.getSessionAttribute("user");
        order.setUserId(user.getUserId());
        int i = orderMapper.insert(order);
        if (i > 0) {
            return Result.ok();
        }
        return Result.build(400, "添加失败");
    }

    @Override
    public Order slectOrderById(Long orderId) {
        return orderMapper.selectByPrimaryKey(orderId);
    }

    @Override
    public Result updateOrder(Order order) {
        OrderExample example = new OrderExample();
        OrderExample.Criteria criteria = example.createCriteria();
        criteria.andOrderIdEqualTo(order.getOrderId());
        order.setUpdatetime(new Date());
        int i = orderMapper.updateByExampleSelective(order, example);
        if (i > 0) {
            return Result.ok();
        }
        return Result.build(400, "修改失败");
    }

    @Override
    public Result deleteOrder(Long orderId) {
        Long orderType = orderMapper.selectByPrimaryKey(orderId).getOrderType();
        int i = orderMapper.deleteByPrimaryKey(orderId);
        if (i > 0) {
            // 返回当前分类
            return Result.build(200, orderType + "");
        }
        return Result.build(400, "删除失败");
    }

    @Override
    public List<Order> searchOrderByName(String orderName) {
        OrderExample example = new OrderExample();
        example.setOrderByClause("updatetime");
        OrderExample.Criteria criteria = example.createCriteria();
        // 判断name是否为空
        if (orderName != null && orderName != "") {
            criteria.andOrderNameLike("%" + orderName + "%");
        }
        // 判断是否是admin
        User user = (User) SessionUtil.getSessionAttribute("user");
        if (!ShiroUtil.isAdmin(user.getUserId())) {
            // 不是admin，返回所有符合要求账单
            criteria.andUserIdEqualTo(user.getUserId());
        }
        List<Order> orders = orderMapper.selectByExample(example);

        return orders;
    }

    /**
     * 写入
     */
    @Override
    public Result batchInsert(List<String[]> list) {

        // 查询对应用户的所有分类
        CategoryExample example = new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        User user = (User) SessionUtil.getSessionAttribute("user");
        criteria.andUserIdEqualTo(user.getUserId());
        List<Category> categories = categoryMapper.selectByExample(example);

        Order order = null;
        List<Order> orders = new ArrayList<>();
        for (String[] strings : list) {
            order = new Order();
            order.setUserId(user.getUserId());
            order.setOrderName(strings[1]);
            order.setMoney(Long.parseLong(strings[2]));
            order.setCreatetime(DateUtils.stringToDate(strings[3]));
            order.setUpdatetime(DateUtils.stringToDate(strings[4]));
            // 查询该账户的账单类型，如果没有对应类型，创建一个
            int count = 0;
            for (Category category : categories) {
                if (category.getCategoryName().equals(StringUtil.removeTrim(strings[5]))) {
                    // 如果这个类型已经存在了，就设置当前类型id，并且直接跳出循环
                    order.setOrderType(category.getId());
                    count++;
                    break;
                }
            }
            if (count == 0) {
                // 不存在这个账单类型，创建一个
                Category c = new Category();
                c.setCategoryName(strings[5]);
                c.setUserId(user.getUserId());
                if (strings[5].contains("支出")) {
                    c.setCategoryType(2);
                } else if (strings[5].contains("收入")) {
                    c.setCategoryType(1);
                } else {
                    // 其他类型
                    c.setCategoryType(3);
                }
                categoryMapper.insert(c);
                order.setOrderType(c.getId());
            }
            order.setOrderDesc(strings[6]);
            orders.add(order);
        }
        try {
            orderMapper.batchInsert(orders);
            return Result.build(1,"插入成功");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.build(400, "插入失败！");
        }
    }
}
