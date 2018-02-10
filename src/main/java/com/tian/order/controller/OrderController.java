package com.tian.order.controller;

import com.tian.common.pojo.AdminOrders;
import com.tian.common.pojo.Result;
import com.tian.common.util.ExportExcel;
import com.tian.common.util.POIUtil;
import com.tian.common.util.SessionUtil;
import com.tian.order.pojo.Category;
import com.tian.order.pojo.Order;
import com.tian.order.pojo.User;
import com.tian.order.service.CategoryService;
import com.tian.order.service.OrderService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private CategoryService categoryService;

    /**
     * 添加账单页面
     *
     * @param categoryId
     * @return
     */
    @RequestMapping("/order/add/{categoryId}")
    @RequiresRoles("user")
    public ModelAndView orderAddForm(@PathVariable Long categoryId) {
        ModelAndView mav = new ModelAndView("orderform");
        // 将对应分类信息返给页面
        Category category = categoryService.selectCategoryById(categoryId);
        mav.addObject("category", category);
        return mav;
    }

    /**
     * 新增账单
     *
     * @param order
     * @return
     */
    @RequestMapping("/order/save")
    @ResponseBody
    public Result orderSave(Order order) {
        return orderService.save(order);
    }

    /**
     * 查看/编辑账单视图
     */
    @RequestMapping(value = "/order/order_detail/{orderId}", method = RequestMethod.GET)
    public ModelAndView getOrderDetail(@PathVariable Long orderId) {
        ModelAndView mav = new ModelAndView("order_detail");
        Order order = orderService.slectOrderById(orderId);
        // 补全用户名
        User user = (User) SessionUtil.getSessionAttribute("user");
        AdminOrders result = new AdminOrders(user.getUserName(), order);
        mav.addObject("result", result);
        return mav;
    }

    /**
     * 修改账单信息
     *
     * @param order
     * @return
     */
    @RequestMapping("/order/edit")
    @ResponseBody
    @RequiresRoles("user")
    public Result orderUpdate(Order order) {
        return orderService.updateOrder(order);
    }

    @RequestMapping("/order/delete")
    @ResponseBody
    @RequiresRoles("user")
    public Result orderDelete(Long orderId) {

        return orderService.deleteOrder(orderId);
    }

    @RequestMapping("/order/search")
    public ModelAndView searchOrders(String orderName) {
        ModelAndView mav = new ModelAndView("projects");
        List<Order> orders = orderService.searchOrderByName(orderName);
        mav.addObject("orders", orders);
        mav.addObject("category", null);
        return mav;
    }

    @Value("${PATH}")
    private String PATH;

    /**
     * 下载Excel模板
     *
     * @param fileName
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/order/downmodel")
    public String download(String fileName, HttpServletRequest request,
                           HttpServletResponse response) {
        System.out.println("控制台输出：走入下载");
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
        try {
           /* String path = Thread.currentThread().getContextClassLoader()
                    .getResource("").getPath()
                    + "template";//这个download目录为啥建立在classes下的
            */
            String path=request.getSession().getServletContext().getRealPath("/")+"template";
            InputStream inputStream = new FileInputStream(new File(path + File.separator + fileName));
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
            // 这里主要关闭。
            os.close();
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //  返回值要注意，要不然就出现下面这句错误！
        //java+getOutputStream() has already been called for this response
        return null;
    }

    /**
     * 上传excel
     *
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("/order/import")
    @ResponseBody
    public String orderImport(MultipartFile file, HttpServletRequest request) throws IOException {
        List<String[]> list = POIUtil.readExcel(file);
        Result result = orderService.batchInsert(list);
        return result.getStatus().toString();
    }


    @RequestMapping("order/export")
    @ResponseBody
    public String orderExport(HttpServletResponse response) throws Exception {
        String title = "我的账单";
        //定义表的列名
        String[] rowsName = {"序号", "账单名称", "账单金额", "账单创建时间", "账单最后修改时间", "账单类型（以支出/收入结尾）", "账单详情"};

        //定义表的内容
        List<Object[]> dataList = new ArrayList<Object[]>();
        Object[] objs = null;
        User user = (User) SessionUtil.getSessionAttribute("user");
        List<AdminOrders> orders = orderService.getOrders(user.getUserId(), null);
        for (AdminOrders order : orders) {
            objs = new Object[rowsName.length];
            objs[0] = order.getOrderName();
            objs[1] = order.getOrderName();
            objs[2] = order.getMoney();
            objs[3] = order.getCreatetime();
            objs[4] = order.getUpdatetime();
            // 设置账单类型
            Category category = categoryService.selectCategoryById(order.getOrderType());
            objs[5] = category.getCategoryName();
            objs[6] = order.getOrderDesc();
            dataList.add(objs);
        }

        // 创建ExportExcel对象
        ExportExcel ex = new ExportExcel(title, rowsName, dataList);

        // 输出Excel文件
        try {
            OutputStream output = response.getOutputStream();
            response.reset();
            response.setHeader("Content-disposition",
                    "attachment; filename=orderList.xls");
            response.setContentType("application/msexcel");
            ex.export(output);
            output.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "tolist";// 返回列表显示
    }

}
