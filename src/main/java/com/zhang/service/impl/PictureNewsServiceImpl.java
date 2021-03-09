package com.zhang.service.impl;

import com.zhang.dao.PictureNewsMapper;
import com.zhang.entity.PictureNews;
import com.zhang.service.PictureNewsService;
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
}
