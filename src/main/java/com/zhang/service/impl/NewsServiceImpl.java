package com.zhang.service.impl;

import com.zhang.dao.NewsMapper;
import com.zhang.entity.News;
import com.zhang.service.NewsService;
import com.zhang.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    public NewsMapper newsMapper;

    @Override
    public List<News> getHotNews() {
        List<News> hotNews = newsMapper.getHotNews();
        return hotNews;
    }

    @Override
    public List<News> getAllNews(Integer id) {
        List<News> allNews = newsMapper.getAllNews(id);
        return allNews;
    }

    @Override
    public Page queryPageNews(Integer currentPage) {
        Page page = new Page();

        //查记录总数
        Integer totalCount = newsMapper.queryNewsTotal();
        page.setTotalCount(totalCount);

        //合理范围
        if (currentPage < 1){
            currentPage = 1;
        }else if (currentPage > page.getPageCount()){
            currentPage = page.getPageCount();
        }
        page.setUrl("/news/index.html");
        page.setCurrentPage(currentPage);
        List<News> newsList = newsMapper.queryPageNews((currentPage-1)*page.getPageSize(),page.getPageSize());
        page.setNewsList(newsList);

        return page;
    }

    @Override
    public List<News> queryNewsByNtid(Integer ntid) {
        List<News> newsList = newsMapper.queryNewsByNtid(ntid);
        return newsList;
    }

    @Override
    public List<News> queryNewsByNtitle(String ntitle) {
        List<News> newsList = newsMapper.queryNewsByNtitle(ntitle);
        return newsList;
    }

    @Override
    public News queryNewsById(Integer nid) {
        News news = newsMapper.queryNewsById(nid);
        return news;
    }
}
