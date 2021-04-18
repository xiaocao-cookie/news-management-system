package com.zhang.dao;

import com.zhang.entity.Topic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TopicMapper {
    //查询所有新闻主题
    public List<Topic> getAllTopics();
    //查询所有主题的数量
    public Integer queryTotalCounts();
    //查询所有新闻主题（带分页）
    public List<Topic> queryPageTopic(@Param("from") Integer from,
                                      @Param("pageSize") Integer pageSize);
    //查询新添加的主题名是否和原有的冲突
    public String queryTopicNameByNewName(String newTopicName);
    //添加主题
    public Integer addTopicName(String topicName);
    //通过主题id查询主题名
    public String queryTopicNameById(Integer tid);
    //根据id修改主题名
    public Integer modifyTopicName(@Param("topicId") Integer topicId,
                                   @Param("topicName") String topicName);
    //根据id删除主题
    public Integer deleteTopic(Integer id);
}
