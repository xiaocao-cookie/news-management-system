package com.zhang.service;

import com.zhang.entity.News;
import com.zhang.util.Page;

import java.util.List;

public interface NewsService {
    //主页上热点新闻的展示
    public List<News> getHotNews();
    //主页上各个主题下新闻的展示
    public List<News> getAllNews(Integer id);
    //分页查询
    public Page queryPageNews(Integer currentPage);
}
