package com.zhang.controller;

import com.zhang.service.TopicService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class TopicController {

    @Resource
    public TopicService topicService;
}
