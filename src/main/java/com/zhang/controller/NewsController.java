package com.zhang.controller;

import com.zhang.entity.News;
import com.zhang.service.NewsService;
import com.zhang.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("news")
public class NewsController {

    @Resource
    public NewsService newsService;

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
}
