package com.zhang.service.impl;

import com.zhang.dao.CommentMapper;
import com.zhang.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    public CommentMapper commentMapper;
}
