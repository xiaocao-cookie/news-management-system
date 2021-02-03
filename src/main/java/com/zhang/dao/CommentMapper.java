package com.zhang.dao;

import com.zhang.entity.Comment;

import java.util.List;

public interface CommentMapper {
    //查询个人的评论
    public List<Comment> queryPersonalComment(Integer cAuthorId);
    //查询所有的评论
    public List<Comment> queryAllComment();
}
