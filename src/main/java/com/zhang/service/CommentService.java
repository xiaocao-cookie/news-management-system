package com.zhang.service;


import com.zhang.entity.Comment;

import java.util.List;

public interface CommentService {
    //查询个人评论
    public List<Comment> queryPersonalComment(Integer cauthorId);
    //查询所有评论
    public List<Comment> queryAllComment();
}
