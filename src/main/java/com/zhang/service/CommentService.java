package com.zhang.service;


import com.zhang.entity.Comment;
import com.zhang.util.Page;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface CommentService {
    //查询个人评论
    public List<Comment> queryPersonalComment(Integer cauthorId);
    //查询所有评论(分页查询)
    public Page queryPageComment(Integer currentPage);
    //通过cnid查询评论列表
    public List<Comment> queryCommentsByCnid(Integer cnid);
    //根据cpid查询评论列表
    public List<Comment> queryCommentListByCpid(Integer cpid);
    //发表评论--一般新闻
    public Integer addComment(Comment comment);
    //发表评论--图片新闻
    public Integer addPicComment(Comment comment);
}
