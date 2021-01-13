package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
@RequestMapping("/Login")
public class LoginController {

    @Resource
    private UserService userService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "pre/login";
    }

    @RequestMapping("/loginUser")
    public String loginUser(@RequestParam("loginName") String loginName,
                            @RequestParam("password") String password){
        User user = userService.loginUser(loginName, password);
        if (user == null){
            return "pre/login";
        }
        return "pre/main";
    }
}
