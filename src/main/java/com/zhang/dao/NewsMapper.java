package com.zhang.dao;

import com.zhang.entity.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {
    //获取热点新闻(时间逆序)
    public List<News> getHotNews();
    //获取各个主题下的新闻
    public List<News> getAllNews(Integer ntid);
    //获取所有新闻(带分页)
    public List<News> queryPageNews(
            @Param("from") Integer from,
            @Param("pageSize") Integer pageSize);
    //查询新闻总条数
    public Integer queryNewsTotal();
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
