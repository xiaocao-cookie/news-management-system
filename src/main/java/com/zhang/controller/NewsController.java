package com.zhang.controller;

import com.zhang.entity.Comment;
import com.zhang.entity.News;
import com.zhang.entity.PictureNews;
import com.zhang.entity.User;
import com.zhang.service.*;
import com.zhang.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.jws.WebParam;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("news")
public class NewsController {

    @Resource
    public NewsService newsService;
    @Resource
    public PictureNewsService pictureNewsService;
    @Resource
    public TopicService topicService;
    @Resource
    public CommentService commentService;
    @Resource
    public UserService userService;

    //后台中的新闻管理
    @RequestMapping("/index.html")
    public String index(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
                        Model model){
        Page pager = newsService.queryPageNews(currentPage);
        List<News> newsList = pager.getNewsList();
        model.addAttribute("newsList",newsList);
        model.addAttribute("pager",pager);
        model.addAttribute("menu",6);
        return "backend/news/newsAdmin";
    }

    //主题新闻的查询与展示
    @RequestMapping("/topicNews")
    public String queryTopicNews(@RequestParam("id") Integer id,Model model){
        //通过ntid查询新闻（包括一般新闻和图片新闻）
        List<News> plainNews = newsService.queryNewsByNtid(id);
        List<PictureNews> pictureNews = pictureNewsService.queryPictureNewsByPtid(id);
        model.addAttribute("plainNews",plainNews);
        model.addAttribute("pictureNews",pictureNews);
        //通过id查询主题名
        String topicName = topicService.queryTopicNameById(id);
        model.addAttribute("topicName",topicName);
        return "pre/topicNews";
    }

    //一般新闻的查询与展示
    @RequestMapping("/queryNewsDetails")
    public String queryNewsDetails(@RequestParam("id") Integer nid,
                                   Model model){
        //查询新闻的详情和评论
        News plainNews = newsService.queryNewsById(nid);
        model.addAttribute("plainNews",plainNews);
        List<Comment> commentList = commentService.queryCommentsByCnid(nid);
        for (Comment comment : commentList) {
            Integer uid = comment.getCauthorId();
            List<User> userList = userService.queryUserById(uid);
            comment.setUserList(userList);
        }
        model.addAttribute("commentList",commentList);
        //查询热点新闻
        List<News> hotNews = newsService.getHotNews();
        model.addAttribute("hotNews",hotNews);
        return "pre/plainNews";
    }

    //图片新闻的查询与展示
    @RequestMapping("/queryPicNewsDetails")
    public String queryPicNewsDetails(@RequestParam("id") Integer pid,
                                      Model model){
        PictureNews pictureNews = pictureNewsService.queryPictureNewsByPid(pid);
        model.addAttribute("pictureNews",pictureNews);
        //查询热点新闻
        List<News> hotNews = newsService.getHotNews();
        model.addAttribute("hotNews",hotNews);
        return "pre/picNews";
    }

    //新闻搜索
    @RequestMapping("/searchNews")
    public String searchNews(@RequestParam("keywords") String keywords,
                             Model model){
        //模糊查询一般新闻
        List<News> plainNews = newsService.queryNewsByNtitle(keywords);
        model.addAttribute("plainNews",plainNews);
        //模糊查询图片新闻
        List<PictureNews> pictureNews = pictureNewsService.queryPictureNewsByPtitle(keywords);
        model.addAttribute("pictureNews",pictureNews);
        return "pre/searchNews";
    }
}
