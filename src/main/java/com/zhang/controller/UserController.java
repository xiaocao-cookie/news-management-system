package com.zhang.controller;

import com.zhang.service.UserService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class UserController {

    @Resource
    public UserService userService;
}
