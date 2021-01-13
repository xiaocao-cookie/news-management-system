package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Controller
@RequestMapping("/Register")
public class RegisterController {

    @Resource
    public UserService userService;

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "pre/register";
    }

    @RequestMapping("/register")
    public String register(
            @RequestParam("loginName") String loginName,
            @RequestParam("password") String password,
            @RequestParam("phone") String phone,
            @RequestParam("idCard") String idCard,
            @RequestParam("sex") Integer sex,
            HttpServletResponse response
    )throws Exception{
        User user = new User();
        user.setLoginName(loginName);
        user.setPassword(password);
        user.setPhone(phone);
        user.setIdCard(idCard);
        user.setSex(sex);

        PrintWriter out = response.getWriter();
        int i = userService.register(user);
        if (i > 0){
            return "pre/login";
        }else{
            return "pre/register";
        }
    }
}