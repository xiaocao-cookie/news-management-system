package com.zhang.dao;

import com.zhang.entity.Comment;
import org.apache.ibatis.annotations.Param;

import javax.persistence.criteria.CriteriaBuilder;
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
    //根据cpid查询评论列表
    public List<Comment> queryCommentListByCpid(Integer cpid);
    //发表评论--一般新闻
    public Integer addComment(Comment comment);
    //发表评论--图片新闻
    public Integer addPicComment(Comment comment);

}
