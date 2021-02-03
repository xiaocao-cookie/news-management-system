package com.zhang.service;

import com.zhang.entity.Topic;
import com.zhang.util.Page;

import java.util.List;

public interface TopicService {
    //查询所有主题
    public List<Topic> getAllTopics();
    //分页查询主题
    public Page queryPageTopic(Integer currentPage);
    //查询主题名是否冲突
    public String queryTopicNameByNewName(String newTopicName);
    //添加主题
    public Integer addTopicName(String topicName);
}
