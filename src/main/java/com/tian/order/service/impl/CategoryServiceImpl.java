package com.tian.order.service.impl;

import com.tian.common.pojo.Pie;
import com.tian.common.pojo.Result;
import com.tian.common.util.SessionUtil;
import com.tian.common.util.ShiroUtil;
import com.tian.order.mapper.CategoryMapper;
import com.tian.order.mapper.OrderMapper;
import com.tian.order.pojo.Category;
import com.tian.order.pojo.CategoryExample;
import com.tian.order.pojo.Order;
import com.tian.order.pojo.User;
import com.tian.order.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Category> getIncomeOrExpenditure(Integer category_type, Long UserId) {
        CategoryExample example = new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(UserId);
        if (category_type != null) {
            criteria.andCategoryTypeEqualTo(category_type);
        }
        return categoryMapper.selectByExample(example);

    }

    @Override
    public List<Category> selectCategoryPage(int startRow, int pageSize) {
        CategoryExample example = new CategoryExample();
        example.setStartRow(startRow);
        return categoryMapper.selectByExample(example);
    }

    @Override
    public Result update(Category category) {
        CategoryExample example = new CategoryExample();
        CategoryExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(category.getId());
        int i = categoryMapper.updateByExampleSelective(category, example);
        if (i > 0) {
            return Result.ok();
        }
        return Result.build(400, "修改失败，请稍后重试");
    }

    @Override
    public Result addCategory(Category category) {
        User user = (User) SessionUtil.getSessionAttribute("user");
        category.setUserId(user.getUserId());
        int i = categoryMapper.insert(category);
        if (i > 0) {
            return Result.ok();
        }
        return Result.build(400, "添加失败，请稍后重试");
    }

    @Override
    public Result delete(Long id) {
        int i = categoryMapper.deleteByPrimaryKey(id);
        if (i > 0) {
            return Result.ok();
        }
        return Result.build(400, "删除失败，请稍后重试");
    }

    @Override
    public Category selectCategoryById(Long categoryId) {
        return categoryMapper.selectByPrimaryKey(categoryId);

    }

    @Override
    public List<Pie> showPie(Long userId) {
        List<Pie> list = new ArrayList<>();
        // 判断用户是否是admin
        Pie pie = null;
        if (ShiroUtil.isAdmin(userId)) {
            // 将所有用户的支出，收入，等信息展示
            // 查询所有分类，根据分类查询对应账单，根据对应账单计算总金额
            for (int i = 1; i <= 3; i++) {
                pie = getPie((long) i, null);
                list.add(pie);
            }
        }
        for (int i = 1; i <= 3; i++) {
            pie = getPie((long) i, userId);
            list.add(pie);
        }
        return list;
    }
    private Pie getPie(Long categoryType,Long userId){ // categoryType 1 收入，2支出，3其他
        // 获取所有收入分类，工资收入，股票收入等，然后再根据这个具体分类的id去查询对应的order，将order的money相加
        Long money = 0L;
        Pie pie = new Pie();
        if(categoryType==1)pie.setTypeName("收入");
        if(categoryType==2)pie.setTypeName("支出");
        if(categoryType==3)pie.setTypeName("其他");
       List<Category> categories = categoryMapper.getCategoryByCategoryType(categoryType,userId);
       for(Category category : categories){
           List<Order> orders = orderMapper.getOrders(userId, category.getId());
           for(Order order : orders){
               money +=order.getMoney();
           }
       }
       pie.setSales(Long.toString(money/100));
       return pie;
    }
}
