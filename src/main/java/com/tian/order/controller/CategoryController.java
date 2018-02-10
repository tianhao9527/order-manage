package com.tian.order.controller;

import com.tian.common.pojo.AdminOrders;
import com.tian.common.pojo.Result;
import com.tian.common.util.SessionUtil;
import com.tian.order.pojo.Category;
import com.tian.order.pojo.Page;
import com.tian.order.pojo.User;
import com.tian.order.service.CategoryService;
import com.tian.order.service.OrderService;
import com.tian.order.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CategoryController {

    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/category/management")
    public ModelAndView getOrderCategorys(@RequestParam(defaultValue = "1") Integer pn) {
        ModelAndView mav = new ModelAndView("ordermanagement");
        // 查询用户所有账单类型
        User user = (User) SessionUtil.getSessionAttribute("user");
        List<Category> categorys = categoryService.getIncomeOrExpenditure(null, user.getUserId());
        // 默认为pageNow = 1
        Page page = new Page(categorys.size(), pn);
        // 查询分页后的数据
        Integer startRow = (pn-1)*5;
        List<Category> list = categoryService.selectCategoryPage(startRow, page.getPageSize());
        mav.addObject("list", categorys);
        mav.addObject("page", page);
        return mav;
    }

    @RequestMapping("/category/update")
    @ResponseBody
    public Result categoryUpdate(Category category){
        return categoryService.update(category);
    }

    @RequestMapping("/category/add")
    @ResponseBody
    public Result categoryAdd(Category category){
        return categoryService.addCategory(category);
    }

    @RequestMapping("/category/delete")
    @ResponseBody
    public Result categoryDelete(Long id){
        return categoryService.delete(id);
    }

    /**
     * 对应分类账单页面
     * @param categoryId
     * @return
     */
    @RequestMapping("/index/category/{categoryId}")
    public ModelAndView getOrdersByCategory(@PathVariable Long categoryId){
        ModelAndView mav = new ModelAndView("projects");
        // 根据当前用户查询该用户对应此分类的详细账单
        User user = (User) SessionUtil.getSessionAttribute("user");
        List<AdminOrders> orders = orderService.getOrders(user.getUserId(), categoryId);
        mav.addObject("orders",orders);
        // 将分类信息返回给页面
        Category category =  categoryService.selectCategoryById(categoryId);
        mav.addObject("category",category);
        return mav;
    }

    /*@RequestMapping(value = "/category/queryByCriteria")
    public Map<String,Object> getOrderCategoryByPage(String page){
        Map<String, Object> map = new HashMap<String, Object>();


        map.put("page", page);
        map.put("list", list);
    }



    //获取json对象
    @RequestMapping(value = "/category/queryByCriteria")
    public @ResponseBody
    Map<String, Object> queryByFoodPrice(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        FoodExample example = new FoodExample();
        FoodExample.Criteria criteria = example.createCriteria();
        String pageNow = request.getParameter("pn");
        int pn = 1;
        if (pageNow != "" & pageNow != null) {
            pn = new Integer(pageNow);
        }
        List<Food> listSize = foodService.selectFoodByExample(example);
        Page page = new Page(listSize.size(), pn);
        List<Food> list = foodService.selectFoodByExampleAndPage(example, pn, page.getPageSize());
        map.put("page", page);
        map.put("list", list);
        return map;
    }

*/
}
