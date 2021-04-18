package com.zhang.service;

import com.zhang.entity.Topic;
import com.zhang.util.Page;
import org.apache.ibatis.annotations.Param;

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
    //通过主题id查询主题名
    public String queryTopicNameById(Integer tid);
    //根据id修改主题名
    public Integer modifyTopicName(Integer topicId,String topicName);
    //根据id删除主题
    public Integer deleteTopic(Integer id);
}
