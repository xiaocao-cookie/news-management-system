package com.zhang.dao;

import com.zhang.entity.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {
    //获取热点新闻(时间逆序)
    public List<News> getHotNews();
    //获取各个主题下的新闻
    public List<News> getAllNews(Integer id);
    //获取所有新闻(带分页)
    public List<News> queryPageNews(
            @Param("from") Integer from,
            @Param("pageSize") Integer pageSize);
    //查询新闻总条数
    public Integer queryNewsTotal();
}
