package com.zhang.controller;

import com.zhang.entity.Topic;
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

    @RequestMapping("/addTopicName")
    public void addTopicName(@RequestParam("addTopicName") String newTopicName,
                               HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //根据名称查是否有重复的
        String oldTopicName = topicService.queryTopicNameByNewName(newTopicName);
        PrintWriter out = response.getWriter();

        if ("".equals(newTopicName)){
            out.println("<script>alert('请输入主题名');location.href='/news/topic/index.html'</script>");
        }
        //若没有重复的，则进行添加操作
        if(oldTopicName == null || "".equals(oldTopicName)){
            Integer i = topicService.addTopicName(newTopicName);
            if (i > 0){
                out.println("<script>alert('添加成功');location.href='/news/topic/index.html'</script>");
            }else{
                out.println("<script>alert('添加失败');location.href='/news/topic/index.html'</script>");
            }
        }
        //若有重复，则返回原页面
        else{
            out.println("<script>alert('添加失败，已经有这个主题');location.href='/news/topic/index.html'</script>");
        }
    }

}