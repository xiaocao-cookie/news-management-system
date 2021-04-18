package com.zhang.service;

import com.zhang.entity.Comment;
import com.zhang.entity.Reply;

import java.util.List;

public interface ReplyService {

    //回复评论--添加回复
    public Integer addReply(Reply reply);
    //通过评论id（rcid）查询该评论下所有追评
    public List<Reply> queryRepliesByRcid(Integer rcid);
    //回复评论的评论--添加评论
    public Integer addReply2(Reply reply);
    //通过rid查询评论--目的是显示三级评论
    public List<Reply> queryRepliesByRid(Integer rid);
}
