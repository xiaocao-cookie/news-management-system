package com.zhang.service.impl;

import com.zhang.dao.CommentMapper;
import com.zhang.entity.Comment;
import com.zhang.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    public CommentMapper commentMapper;

    @Override
    public List<Comment> queryPersonalComment(Integer cauthorId) {
        List<Comment> commentList = commentMapper.queryPersonalComment(cauthorId);
        return commentList;
    }

    @Override
    public List<Comment> queryAllComment() {
        List<Comment> commentList = commentMapper.queryAllComment();
        return commentList;
    }
}
