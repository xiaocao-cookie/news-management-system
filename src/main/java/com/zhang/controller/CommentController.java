package com.zhang.controller;

import com.zhang.service.CommentService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class CommentController {

    @Resource
    public CommentService commentService;
}
