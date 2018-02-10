package com.tian.order.controller;

import com.tian.common.pojo.Result;
import com.tian.common.pojo.UserBo;
import com.tian.common.util.SecurityUtil;
import com.tian.common.util.SessionUtil;
import com.tian.order.pojo.User;
import com.tian.order.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    @ResponseBody
    public Result login(User user) {

        // 基于shiro实现登录
        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken token = new UsernamePasswordToken(user.getUserName(),
                SecurityUtil.encryptPassword(user.getPassword()));
        //AuthenticationToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
        try {
            subject.login(token);
            // 登录成功
            // 将用户信息 保存到 Session
            user = userService.findByUsername(user.getUserName());
            user.setPassword(null);
            SessionUtil.setSessionAttribute("user", user);
            return Result.ok();
        } catch (AuthenticationException e) {
            // 登录失败
            e.printStackTrace();
            return Result.build(400, "用户名或密码错误");
        }
    }

    /**
     * 个人信息
     *
     * @return
     */
    @RequestMapping("/user/profile")
    public String userProfile() {
        return "profile";
    }

    /**
     * 修改密码展示页面
     */
    @RequestMapping("/user/modpwdpage")
    public String modpwdpage() {
        return "modifypwd";
    }

    /**
     * 修改密码
     */
    @RequestMapping("/user/modifypwd")
    @ResponseBody
    public Result modifyPwd(String oldPassword, String password) {
        // 获取用户信息
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        User user = userService.findByUsername(username);
        // 对比密码
        if (user.getPassword().equals(SecurityUtil.encryptPassword(oldPassword))) {
            user.setPassword(SecurityUtil.encryptPassword(password));
            int i = userService.updateUser(user);
            int x = 1;
            if (i > 0) {
                return Result.ok();
            } else {
                return Result.build(400, "修改失败，请检查你的网络");
            }
        }
        return Result.build(400, "修改失败，旧密码错误");
    }

    @RequestMapping(value = "/user/registerpage", method = RequestMethod.GET)
    public String registerPage() {
        return "register";
    }


    /**
     * 注册
     *
     * @param user
     * @return
     */
    @RequestMapping("/user/register")
    @ResponseBody
    public Result register(User user) {
        User byUsername = userService.findByUsername(user.getUserName());
        if (byUsername != null) {
            return Result.build(400, "用户名已存在");
        }
        user.setPassword(SecurityUtil.encryptPassword(user.getPassword()));
        return userService.insertUser(user);
    }

    @RequestMapping("/user/logout")
    public String logout() {
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        SessionUtil.removeSessionAttribute("user");
        return "login";
    }

    @RequestMapping("/user/listpage")
    public String showUserList() {
        return "userlist";
    }

    @RequestMapping("/user/list")
    public ModelAndView userList() {
        ModelAndView mav = new ModelAndView("userlist");
        List<User> userlist = userService.getUserList();
        mav.addObject("userlist", userlist);
        mav.addObject("userBoList", null);
        return mav;
    }

    @RequestMapping("/user/delete/{userId}")
    @ResponseBody
    public Result userDelteById(@PathVariable Long userId) {
        return userService.deleteUserById(userId);
    }

    @RequestMapping("/user/online")
    public ModelAndView getAllUser() {
        List<UserBo> list = userService.getAllUser();
        ModelAndView mav = new ModelAndView("userlist");
        mav.addObject("userBoList", list);
        mav.addObject("userlist", null);
        return mav;
    }

    @RequestMapping("/user/kickout")
    @ResponseBody
    public Result kickOutUser(String sessionId) {
        return userService.kickOutUser(sessionId);
    }
}




