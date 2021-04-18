package com.zhang.service;

import com.zhang.entity.PictureNews;
import com.zhang.util.Page;

import java.util.List;

public interface PictureNewsService {
    //通过主题id查询新闻
    public List<PictureNews> queryPictureNewsByPtid(Integer ptid);
    //模糊查询新闻
    public List<PictureNews> queryPictureNewsByPtitle(String ptitle);
    //根据id查询新闻
    public PictureNews queryPictureNewsByPid(Integer pid);
    //查询图片新闻，带分页
    public Page queryPictureNews(Integer currentPage);
    //根据id删除图片新闻
    public Integer deletePictureNews(Integer id);
    //添加图片新闻
    public Integer addPicNews(PictureNews pictureNews);
    //根据id修改图片新闻
    public Integer updatePicNewsById(PictureNews pictureNews);
}
