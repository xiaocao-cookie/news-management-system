package com.zhang.service.impl;

import com.zhang.dao.CommentMapper;
import com.zhang.entity.Comment;
import com.zhang.service.CommentService;
import com.zhang.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
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
    public Page queryPageComment(Integer currentPage) {
        Page page = new Page();
        //另外设置一下
        page.setPageSize(3);
        //查记录总数
        Integer totalCount = commentMapper.queryTotalCounts();
        page.setTotalCount(totalCount);

        //当前页数的合理范围
        if(currentPage < 1){
            currentPage = 1;
        }else if (currentPage > page.getPageCount()){
            currentPage = page.getPageCount();
        }
        page.setUrl("/comments/allComments");
        page.setCurrentPage(currentPage);
        List<Comment> commentList = commentMapper.queryPageComment((currentPage-1)*page.getPageSize(),page.getPageSize());
        page.setCommentList(commentList);
        return page;
    }

    @Override
    public List<Comment> queryCommentsByCnid(Integer cnid) {
        List<Comment> commentList = commentMapper.queryCommentsByCnid(cnid);
        return commentList;
    }

    @Override
    public List<Comment> queryCommentListByCpid(Integer cpid) {
        List<Comment> commentList = commentMapper.queryCommentListByCpid(cpid);
        return commentList;
    }

    @Override
    public Integer addComment(Comment comment) {
        Integer i = commentMapper.addComment(comment);
        return i;
    }

    @Override
    public Integer addPicComment(Comment comment) {
        Integer i = commentMapper.addPicComment(comment);
        return i;
    }

}
