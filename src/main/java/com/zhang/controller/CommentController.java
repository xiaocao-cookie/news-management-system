package com.zhang.controller;

import com.zhang.entity.Comment;
import com.zhang.entity.Reply;
import com.zhang.service.CommentService;
import com.zhang.service.ReplyService;
import com.zhang.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Resource
    public CommentService commentService;
    @Resource
    public ReplyService replyService;

    //个人评论（评论过）
    @RequestMapping("/personalComments")
    public String personalComments(@RequestParam("id") Integer cauthorId,
                                   Model model){
        List<Comment> commentList = commentService.queryPersonalComment(cauthorId);
        model.addAttribute("commentList",commentList);
        model.addAttribute("menu",8);
        return "backend/comment/personComment";
    }

    //所有评论
    @RequestMapping("/allComments")
    public String queryPageComments(
            @RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
            Model model){
        Page pager = commentService.queryPageComment(currentPage);
        List<Comment> allCommentList = pager.getCommentList();
        for (Comment comment : allCommentList) {
            List<Comment> commentList = commentService.queryPersonalComment(comment.getCauthorId());
            comment.setCommentList(commentList);
        }
        model.addAttribute("pager",pager);
        model.addAttribute("allCommentList",allCommentList);
        model.addAttribute("menu",9);
        return "backend/comment/allComment";
    }

    //发表评论--一般新闻
    @RequestMapping("/addComment")
    public void addComment(@RequestParam("cnid") Integer cnid,
                           @RequestParam("cAuthorId") Integer cAuthorId,
                           @RequestParam("content") String content,
                           HttpServletResponse response)throws Exception{
        Comment comment = new Comment();
        PrintWriter out = response.getWriter();
        comment.setCnid(cnid);
        comment.setCauthorId(cAuthorId);
        comment.setCcontent(content);
        Integer i = commentService.addComment(comment);
        if (i > 0){
            out.println("{'status':'1','message':'发表成功'}");
        }else{
            out.println("{'status':'2','message':'发表失败'}");
        }
    }

    //发表评论--图片新闻
    @RequestMapping("/addPicComment")
    public void addPicComment(@RequestParam("cpid") Integer cpid,
                              @RequestParam("cAuthorId") Integer cAuthorId,
                              @RequestParam("content") String content,
                              HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Comment comment = new Comment();
        comment.setCpid(cpid);
        comment.setCauthorId(cAuthorId);
        comment.setCcontent(content);
        Integer i = commentService.addPicComment(comment);
        if (i > 0){
            out.println("{'status':'1','message':'发表成功'}");
        }else{
            out.println("{'status':'2','message':'发表失败'}");
        }
    }

    //回复评论--也叫作添加回复
    @RequestMapping("/reply")
    public void addReply(@RequestParam("rcid") Integer rcid,
                         @RequestParam("rAuthorId") Integer rAuthorId,
                         @RequestParam("content") String content,
                         HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Reply reply = new Reply();
        reply.setRcid(rcid);
        reply.setRauthorId(rAuthorId);
        reply.setContent(content);

        Integer i = replyService.addReply(reply);
        if (i > 0){
            out.println("{'status':'1','message':'发表成功'}");
        }else{
            out.println("{'status':'2','message':'发表失败'}");
        }
    }

    //回复评论的评论--添加评论
    @RequestMapping("/reply2")
    public void addReply2(@RequestParam("rid") Integer rid,
                          @RequestParam("rAuthorId") Integer rAuthorId,
                          @RequestParam("content") String content,
                          HttpServletResponse response)throws Exception{
        Reply reply = new Reply();
        reply.setRid(rid);
        reply.setRauthorId(rAuthorId);
        reply.setContent(content);
        PrintWriter out = response.getWriter();
        Integer i = replyService.addReply2(reply);
        if (i > 0){
            out.println("{'status':'1','message':'发表成功'}");
        }else{
            out.println("{'status':'2','message':'发表失败'}");
        }
    }
}
