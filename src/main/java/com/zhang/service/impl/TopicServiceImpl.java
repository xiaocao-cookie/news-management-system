package com.zhang.service.impl;

import com.zhang.dao.TopicMapper;
import com.zhang.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    public TopicMapper topicMapper;
}
