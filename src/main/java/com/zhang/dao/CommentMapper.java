package com.zhang.dao;

import com.zhang.entity.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    //查询个人的评论
    public List<Comment> queryPersonalComment(Integer cAuthorId);
    //查询所有的评论
    public List<Comment> queryPageComment(
            @Param("from") Integer from,
            @Param("pageSize") Integer pageSize
    );
    //查询评论总条数
    public Integer queryTotalCounts();
    //通过cnid查询评论列表
    public List<Comment> queryCommentsByCnid(Integer cnid);
}
