package com.zhang.service.impl;

import com.zhang.dao.PictureNewsMapper;
import com.zhang.entity.News;
import com.zhang.entity.PictureNews;
import com.zhang.service.PictureNewsService;
import com.zhang.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class PictureNewsServiceImpl implements PictureNewsService {

    @Autowired
    public PictureNewsMapper pictureNewsMapper;

    @Override
    public List<PictureNews> queryPictureNewsByPtid(Integer ptid) {
        List<PictureNews> pictureNewsList = pictureNewsMapper.queryPictureNewsByPtid(ptid);
        return pictureNewsList;
    }

    @Override
    public List<PictureNews> queryPictureNewsByPtitle(String ptitle) {
        List<PictureNews> pictureNewsList = pictureNewsMapper.queryPictureNewsByPtitle(ptitle);
        return pictureNewsList;
    }

    @Override
    public PictureNews queryPictureNewsByPid(Integer pid) {
        PictureNews pictureNews = pictureNewsMapper.queryPictureNewsByPid(pid);
        return pictureNews;
    }

    @Override
    public Page queryPictureNews(Integer currentPage) {
        Page page = new Page();

        //查记录总数
        Integer totalCount = pictureNewsMapper.queryNewsTotal();
        page.setTotalCount(totalCount);

        //合理范围
        if (currentPage < 1){
            currentPage = 1;
        }else if (currentPage > page.getPageCount()){
            currentPage = page.getPageCount();
        }
        page.setUrl("/news/getPictureNews");
        page.setCurrentPage(currentPage);
        List<PictureNews> pictureNewsList = pictureNewsMapper.queryPagePictureNews((currentPage-1)*page.getPageSize(),page.getPageSize());
        page.setPictureNewsList(pictureNewsList);

        return page;
    }

    @Override
    public Integer deletePictureNews(Integer id) {
        Integer i = pictureNewsMapper.deletePictureNews(id);
        return i;
    }

    @Override
    public Integer addPicNews(PictureNews pictureNews) {
        Integer i = pictureNewsMapper.addPicNews(pictureNews);
        return i;
    }

    @Override
    public Integer updatePicNewsById(PictureNews pictureNews) {
        Integer i = pictureNewsMapper.updatePicNewsById(pictureNews);
        return i;
    }
}
