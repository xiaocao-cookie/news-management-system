package com.zhang.service;


import com.zhang.entity.Comment;
import com.zhang.util.Page;

import java.util.List;

public interface CommentService {
    //查询个人评论
    public List<Comment> queryPersonalComment(Integer cauthorId);
    //查询所有评论(分页查询)
    public Page queryPageComment(Integer currentPage);
    //通过cnid查询评论列表
    public List<Comment> queryCommentsByCnid(Integer cnid);
}
