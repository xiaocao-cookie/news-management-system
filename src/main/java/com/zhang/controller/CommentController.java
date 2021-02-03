package com.zhang.controller;

import com.zhang.entity.Comment;
import com.zhang.service.CommentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Resource
    public CommentService commentService;

    //个人评论（评论过）
    @RequestMapping("/personalComments")
    public String personalComments(@RequestParam("id") Integer cauthorId,
                                   Model model){
        List<Comment> commentList = commentService.queryPersonalComment(cauthorId);
        model.addAttribute("commentList",commentList);
        model.addAttribute("menu",8);
        return "backend/comment/commentAdmin";
    }

    //所有评论
    @RequestMapping("/allComments")
    public String queryPageComments(Model model){
        List<Comment> allCommentList = commentService.queryAllComment();
        model.addAttribute("allCommentList",allCommentList);
        model.addAttribute("menu",9);
        return "backend/comment/commentAdmin";
    }
}
