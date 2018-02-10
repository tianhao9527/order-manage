package com.tian.order.controller;

import com.alibaba.fastjson.JSON;
import com.tian.common.pojo.AdminOrders;
import com.tian.common.pojo.Pie;
import com.tian.common.pojo.Result;
import com.tian.common.pojo.weather.Daily;
import com.tian.common.util.HttpClientUtil;
import com.tian.common.util.SessionUtil;
import com.tian.common.util.WeatherUtil;
import com.tian.order.pojo.Menu;
import com.tian.order.pojo.User;
import com.tian.order.service.CategoryService;
import com.tian.order.service.MenuService;
import com.tian.order.service.OrderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.security.SignatureException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private MenuService menuService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CategoryService categoryService;


    @RequestMapping("/")
    public String showLogin() {
        return "login";
    }

    @RequestMapping("/{page}")
    @RequiresPermissions("none")
    public String showPage(@PathVariable String page) {
        return page;
    }

    @RequestMapping("/index/showIndex")
    public ModelAndView showIndex() {

        // 获取用户信息
        User user = (User) SessionUtil.getSessionAttribute("user");
        // 获取用户菜单
        List<Menu> menus = menuService.getMenus(user.getUserId());
        // 获取用户对应账单
        List<AdminOrders> orders = orderService.getOrders(user.getUserId(), null);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("menus", menus);
        modelAndView.addObject("orders", orders);
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/index/getCategory")
    @ResponseBody
    public Result getCategory(String menuname, Long id) {
        // 获取用户信息
        User user = (User) SessionUtil.getSessionAttribute("user");
        List list = new ArrayList<>();
        // 收入或支出
        if ("收入".equals(menuname)) {
            list = categoryService.getIncomeOrExpenditure(1, user.getUserId());
            return Result.build(200, "category", list);
        } else if ("支出".equals(menuname)) {
            list = categoryService.getIncomeOrExpenditure(2, user.getUserId());
            return Result.build(200, "category", list);
        } else if ("其他类型".equals(menuname)) {
            list = categoryService.getIncomeOrExpenditure(3, user.getUserId());
            return Result.build(200, "category", list);
        }
        // 获取子菜单
        list = menuService.getSubMenus(id);
        return Result.build(200, "menus", list);
    }

    @RequestMapping("/index/pie")
    @ResponseBody
    public List<Pie> showPie() {
        User user = (User) SessionUtil.getSessionAttribute("user");
        // 查询该用户所有账单，收入，支出，其他
        List<Pie> pies = categoryService.showPie(user.getUserId());
        System.out.println(pies);
        return pies;
    }

    @RequestMapping( "/index/weather")
    @ResponseBody
    public List<Daily> showWeather(String localName) {
        WeatherUtil weatherUtil = new WeatherUtil();
        try {
            String url = weatherUtil.generateGetDiaryWeatherURL(localName,"zh-Hans","c","1","7");
            String result = HttpClientUtil.requestByGetMethod(url);

            result = "["+result.substring(result.indexOf("daily")+8,result.lastIndexOf("last_update")-3)+"]";
            List<Daily>  dailies = JSON.parseArray(result, Daily.class);
            return dailies;
        } catch (SignatureException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
