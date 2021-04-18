package com.zhang.controller;

import com.zhang.entity.News;
import com.zhang.entity.Topic;
import com.zhang.service.NewsService;
import com.zhang.service.TopicService;
import com.zhang.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/topic")
public class TopicController {

    @Resource
    public TopicService topicService;
    @Resource
    public NewsService newsService;

    @RequestMapping("/index.html")
    public String index(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
            Model model){
        Page pager = topicService.queryPageTopic(currentPage);
        List<Topic> topicList = pager.getTopicList();
        model.addAttribute("pager",pager);
        model.addAttribute("topicList",topicList);
        model.addAttribute("menu",4);
        return "backend/topic/topicAdmin";
    }

    @RequestMapping("/addAndModifyTopicName")
    public void addTopicName(@RequestParam("topicName") String newTopicName,
                             @RequestParam("topicId") Integer topicId,
                             HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //根据名称查是否有重复的
        String oldTopicName = topicService.queryTopicNameByNewName(newTopicName);
        PrintWriter out = response.getWriter();
        //若没有重复的，则进行添加操作
        if(oldTopicName == null || "".equals(oldTopicName)){
            if (topicId == null){
                //添加主题
                Integer i = topicService.addTopicName(newTopicName);
                if (i > 0){
                    out.println("{'status':'1','message':'添加成功'}");
                }else{
                    out.println("{'status':'2','message':'添加失败'}");
                }
            }else{
                //修改主题
                Integer i = topicService.modifyTopicName(topicId,newTopicName);
                if (i > 0){
                    out.println("{'status':'1','message':'修改成功'}");
                }else{
                    out.println("{'status':'2','message':'修改失败'}");
                }
            }
        } else{
            out.println("{'status':'3','message':'主题名重复，请重新修改'}");
        }
    }

    //删除主题
    @RequestMapping("/deleteTopic")
    public void deleteTopic(@RequestParam("id") Integer topicId,
                            HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        //通过主题id查询该主题下是否有新闻
        List<News> newsList = newsService.getAllNews(topicId);
        //若无新闻，则删除
        if (newsList.size() == 0){
            Integer i = topicService.deleteTopic(topicId);
            if (i > 0){
                out.println("{'status':'1','message':'删除成功'}");
            }else{
                out.println("{'status':'2','message':'删除失败'}");
            }
        }else{
            out.println("{'status':'2','message':'该主题下仍有新闻'}");
        }
    }

}