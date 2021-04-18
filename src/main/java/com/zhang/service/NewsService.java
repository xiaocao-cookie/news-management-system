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
    //通过主题id查询新闻
    public List<News> queryNewsByNtid(Integer ntid);
    //模糊查询新闻
    public List<News> queryNewsByNtitle(String ntitle);
    //通过id查询新闻
    public News queryNewsById(Integer nid);
    //通过id删除新闻
    public Integer deleteNewsById(Integer id);
    //根据id修改新闻
    public Integer modifyNews(News news);
    //添加新闻
    public Integer addNews(News news);
}
