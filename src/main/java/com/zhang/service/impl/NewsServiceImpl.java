package com.zhang.service.impl;

import com.zhang.dao.NewsMapper;
import com.zhang.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    public NewsMapper newsMapper;
}
