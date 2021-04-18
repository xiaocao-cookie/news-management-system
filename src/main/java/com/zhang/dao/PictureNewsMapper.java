package com.zhang.dao;

import com.zhang.entity.News;
import com.zhang.entity.PictureNews;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PictureNewsMapper {
    //通过主题id查询新闻
    public List<PictureNews> queryPictureNewsByPtid(Integer ptid);
    //模糊查询新闻
    public List<PictureNews> queryPictureNewsByPtitle(String ptitle);
    //根据id查询新闻
    public PictureNews queryPictureNewsByPid(Integer pid);
    //查询所有图片新闻，带分页
    public List<PictureNews> queryPagePictureNews(
            @Param("from") Integer from,
            @Param("pageSize") Integer pageSize);
    //查询图片新闻总条数
    public Integer queryNewsTotal();
    //根据id删除图片新闻
    public Integer deletePictureNews(Integer id);
    //添加新闻
    public Integer addPicNews(PictureNews pictureNews);
    //根据id修改图片新闻
    public Integer updatePicNewsById(PictureNews pictureNews);
}
