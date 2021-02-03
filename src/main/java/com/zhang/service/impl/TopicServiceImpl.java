package com.zhang.service.impl;

import com.zhang.dao.TopicMapper;
import com.zhang.entity.News;
import com.zhang.entity.Topic;
import com.zhang.service.TopicService;
import com.zhang.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    public TopicMapper topicMapper;

    @Override
    public List<Topic> getAllTopics() {
        List<Topic> topicList = topicMapper.getAllTopics();
        return topicList;
    }

    @Override
    public Page queryPageTopic(Integer currentPage) {
        Page page = new Page();

        //查记录总数
        Integer totalCount = topicMapper.queryTotalCounts();
        page.setTotalCount(totalCount);

        //合理范围
        if (currentPage < 1){
            currentPage = 1;
        }else if (currentPage > page.getPageCount()){
            currentPage = page.getPageCount();
        }
        page.setUrl("/topic/index.html");
        page.setCurrentPage(currentPage);
        List<Topic> topicList = topicMapper.queryPageTopic((currentPage-1)*page.getPageSize(),page.getPageSize());
        page.setTopicList(topicList);
        return page;
    }

    @Override
    public String queryTopicNameByNewName(String newTopicName) {
        String topicName = topicMapper.queryTopicNameByNewName(newTopicName);
        return topicName;
    }

    @Override
    public Integer addTopicName(String topicName) {
        Integer i = topicMapper.addTopicName(topicName);
        return i;
    }
}
