package com.zhang.service;

import com.zhang.entity.PictureNews;

import java.util.List;

public interface PictureNewsService {
    //通过主题id查询新闻
    public List<PictureNews> queryPictureNewsByPtid(Integer ptid);
    //模糊查询新闻
    public List<PictureNews> queryPictureNewsByPtitle(String ptitle);
    //根据id查询新闻
    public PictureNews queryPictureNewsByPid(Integer pid);
}
