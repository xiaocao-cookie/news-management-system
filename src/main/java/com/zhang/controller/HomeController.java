package com.zhang.controller;

import com.zhang.entity.News;
import com.zhang.entity.PictureNews;
import com.zhang.entity.Topic;
import com.zhang.service.NewsService;
import com.zhang.service.PictureNewsService;
import com.zhang.service.TopicService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Home")
public class HomeController {

    @Resource
    public NewsService newsService;
    @Resource
    public TopicService topicService;
    @Resource
    public PictureNewsService pictureNewsService;

    @RequestMapping("/newsLists")
    public String getNewsLists(Model model, HttpServletRequest request){
        //热点新闻
        List<News> hotNews = newsService.getHotNews();
        model.addAttribute("hotNews",hotNews);
        //获取所有主题
        List<Topic> topicList = topicService.getAllTopics();
        for (Topic topic : topicList) {
            Integer id = topic.getTid();
            //各个主题下的新闻
            List<News> allTopicNews = newsService.getAllNews(id);
            topic.setNewsList(allTopicNews);
            List<PictureNews> allPictureNews = pictureNewsService.queryPictureNewsByPtid(id);
            topic.setPictureNewsList(allPictureNews);
        }
        HttpSession session = request.getSession();
        session.setAttribute("topicList",topicList);
        return "pre/main";
    }
}
