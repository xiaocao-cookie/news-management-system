package com.zhang.controller;

import com.zhang.service.PictureService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class PictureController {

    @Resource
    public PictureService pictureService;
}
