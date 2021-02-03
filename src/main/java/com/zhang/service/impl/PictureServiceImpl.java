package com.zhang.service.impl;

import com.zhang.dao.PictureMapper;
import com.zhang.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PictureServiceImpl implements PictureService {

    @Autowired
    public PictureMapper pictureMapper;
}
