package com.zhang.controller;

import com.zhang.service.NewsService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class NewsController {

    @Resource
    public NewsService newsService;
}
