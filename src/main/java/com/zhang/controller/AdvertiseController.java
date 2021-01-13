package com.zhang.controller;

import com.zhang.service.AdvertiseService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class AdvertiseController {

    @Resource
    public AdvertiseService advertiseService;
}
