package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    public UserService userService;

    @RequestMapping("/getUserInfo")
    public String getUserInfo(Model model){
        List<User> userList = userService.getUserLists();
        model.addAttribute("userList",userList);
        model.addAttribute("menu",1);
        return "backend/user/userInfo";
    }
    @RequestMapping("/getUserList")
    public String getUserList(Model model){
        List<User> userList = userService.getUserLists();
        model.addAttribute("userList",userList);
        model.addAttribute("menu",2);
        return "backend/user/userList";
    }

}
