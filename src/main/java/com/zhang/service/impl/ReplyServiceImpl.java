package com.zhang.service.impl;

import com.zhang.dao.ReplyMapper;
import com.zhang.entity.Reply;
import com.zhang.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    public ReplyMapper replyMapper;

    @Override
    public Integer addReply(Reply reply) {
        Integer i = replyMapper.addReply(reply);
        return i;
    }

    @Override
    public List<Reply> queryRepliesByRcid(Integer rcid) {
        List<Reply> replyList = replyMapper.queryRepliesByRcid(rcid);
        return replyList;
    }

    @Override
    public Integer addReply2(Reply reply) {
        Integer i = replyMapper.addReply2(reply);
        return i;
    }

    @Override
    public List<Reply> queryRepliesByRid(Integer rid) {
        List<Reply> replyList = replyMapper.queryRepliesByRid(rid);
        return replyList;
    }
}
