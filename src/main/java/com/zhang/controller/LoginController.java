package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Login")
public class LoginController {

    @Resource
    private UserService userService;

    //去登录
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "pre/login";
    }

    //登录
    @RequestMapping("/loginUser")
    public String loginUser(@RequestParam("loginName") String loginName,
                            @RequestParam("password") String password,
                            HttpSession session){
        User user = userService.loginUser(loginName, password);
        if (user == null){
            return "pre/login";
        }
        session.setAttribute("loginUser",user);
        return "../index";
    }

    //注销
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("loginUser");
        return "../index";
    }
}
