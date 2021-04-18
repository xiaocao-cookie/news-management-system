package com.zhang.controller;

import com.zhang.entity.*;
import com.zhang.service.*;
import com.zhang.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/news")
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
    @Resource
    public ReplyService replyService;

    //后台中的一般新闻列表
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

    //后台中的图片新闻列表
    @RequestMapping("/getPictureNews")
    public String getPictureNews(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
                                 Model model){
        Page pager = pictureNewsService.queryPictureNews(currentPage);
        List<PictureNews> pictureNewsList = pager.getPictureNewsList();
        model.addAttribute("pictureNewsList",pictureNewsList);
        model.addAttribute("pager",pager);
        model.addAttribute("menu",10);
        return "backend/news/pictureNewsAdmin";
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

            Integer cid = comment.getCid();
            List<Reply> replyList = replyService.queryRepliesByRcid(cid);
            for (Reply reply : replyList) {
                List<User> userList1 = userService.queryUserById(reply.getRauthorId());
                reply.setUserList(userList1);
                List<Reply> replyList1 = replyService.queryRepliesByRid(reply.getId());
                reply.setReplyList(replyList1);
                for (Reply reply1 : replyList1) {
                    List<User> userList2 = userService.queryUserById(reply1.getRauthorId());
                    reply1.setUserList(userList2);
                }
            }
            comment.setReplyList(replyList);
        }
        model.addAttribute("commentList",commentList);
        //查询右侧图片新闻
        PictureNews pictureNews1 = pictureNewsService.queryPictureNewsByPid(nid/2+1);
        PictureNews pictureNews2 = pictureNewsService.queryPictureNewsByPid(nid/2+2);
        model.addAttribute("pictureNews1",pictureNews1);
        model.addAttribute("pictureNews2",pictureNews2);
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
        List<Comment> commentList = commentService.queryCommentListByCpid(pid);
        pictureNews.setCommentList(commentList);
        for (Comment comment : commentList) {
            Integer uid = comment.getCauthorId();
            List<User> userList = userService.queryUserById(uid);
            comment.setUserList(userList);

            Integer cid = comment.getCid();
            List<Reply> replyList = replyService.queryRepliesByRcid(cid);
            for (Reply reply : replyList) {
                List<User> userList1 = userService.queryUserById(reply.getRauthorId());
                reply.setUserList(userList1);
                List<Reply> replyList1 = replyService.queryRepliesByRid(reply.getId());
                reply.setReplyList(replyList1);
                for (Reply reply1 : replyList1) {
                    List<User> userList2 = userService.queryUserById(reply1.getRauthorId());
                    reply1.setUserList(userList2);
                }
            }
            comment.setReplyList(replyList);
        }
        model.addAttribute("pictureNews",pictureNews);
        //右侧其他推荐
        PictureNews pictureNews1 = pictureNewsService.queryPictureNewsByPid(pid/2+1);
        PictureNews pictureNews2 = pictureNewsService.queryPictureNewsByPid(pid/2+2);
        PictureNews pictureNews3 = pictureNewsService.queryPictureNewsByPid(pid/2+3);
        model.addAttribute("pictureNews1",pictureNews1);
        model.addAttribute("pictureNews2",pictureNews2);
        model.addAttribute("pictureNews3",pictureNews3);
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

    //根据新闻id删除一般新闻
    @RequestMapping("/deleteNews")
    public void deleteNews(@RequestParam("id") Integer id,
                           HttpServletResponse response)throws Exception{
        Integer i = newsService.deleteNewsById(id);
        PrintWriter out = response.getWriter();
        if (i > 0){
            out.println("{'status':'1','message':'删除成功'}");
        }else{
            out.println("{'status':'2','message':'删除失败'}");
        }
    }

    //修改新闻--去修改
    @RequestMapping("/toModifyNews")
    public String toModifyNews(@RequestParam("newsType") Integer newsType,
                             @RequestParam(value = "nid",required = false) Integer nid,
                             @RequestParam(value = "pid",required = false) Integer pid,
                             Model model) {
        News news = newsService.queryNewsById(nid);
        PictureNews pictureNews = pictureNewsService.queryPictureNewsByPid(pid);
        List<Topic> topicList = topicService.getAllTopics();
        model.addAttribute("newsType", newsType);
        if (newsType == 1) {
            news.setTopicList(topicList);
            model.addAttribute("news", news);
            return "backend/news/newsEdit";
        }else{
            pictureNews.setTopicList(topicList);
            model.addAttribute("pictureNews", pictureNews);
            return "backend/news/pictureNewsEdit";
        }
    }

    //修改新闻--一般新闻
    @RequestMapping("/modifyNews")
    public void modifyNews(@RequestParam("nid") Integer nid,
                           @RequestParam("title") String title,
                           @RequestParam("topicId") Integer topicId,
                           @RequestParam("author") String author,
                           @RequestParam("contents") String contents,
                           HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        News news = new News();
        news.setNid(nid);
        news.setNtid(topicId);
        news.setNtitle(title);
        news.setNauthor(author);
        news.setNcontent(contents);
        Integer i = newsService.modifyNews(news);
        if (i > 0){
            out.println("{'status':'1','message':'修改成功','url':'/news/index.html'}");
        }else{
            out.println("{'status':'2','message':'修改失败'}");
        }
    }

    //修改新闻 -- 图片新闻
    @RequestMapping("/modifyPicNews")
    public void modifyPicNews(@RequestParam("pid") Integer pid,
                              @RequestParam("title") String title,
                              @RequestParam("topicId") Integer topicId,
                              @RequestParam("author") String author,
                              @RequestParam("contentOne") String contentOne,
                              @RequestParam("contentTwo") String contentTwo,
                              @RequestParam("contentThree") String contentThree,
                              @RequestParam("contentFour") String contentFour,
                              HttpServletResponse response)throws Exception {
        PrintWriter out = response.getWriter();
        PictureNews pictureNews = new PictureNews();
        pictureNews.setPtid(topicId);
        pictureNews.setPtitle(title);
        pictureNews.setPauthor(author);
        pictureNews.setPcontent1(contentOne);
        pictureNews.setPcontent2(contentTwo);
        pictureNews.setPcontent3(contentThree);
        pictureNews.setPcontent4(contentFour);
        pictureNews.setPid(pid);
        Integer j = pictureNewsService.updatePicNewsById(pictureNews);
        if (j > 0){
            out.println("{'status':'1','message':'修改成功','url':'/news/getPictureNews'}");
        }else{
            out.println("{'status':'2','message':'修改失败'}");
        }
    }

    //删除图片新闻
    @RequestMapping("/deletePictureNews")
    public void deletePictureNews(@RequestParam("id") Integer id,
                                  HttpServletResponse response)throws Exception{
        Integer i = pictureNewsService.deletePictureNews(id);
        PrintWriter out = response.getWriter();
        if (i > 0){
            out.println("{'status':'1','message':'删除成功'}");
        }else{
            out.println("{'status':'2','message':'删除失败'}");
        }
    }

    //新闻添加--去添加
    @RequestMapping("/toAddNews")
    public String toAddNews(Model model){
        model.addAttribute("menu",7);
        List<Topic> topicList = topicService.getAllTopics();
        model.addAttribute("topicList",topicList);
        return "backend/news/newsAdd";
    }

    //新闻添加--添加
    @RequestMapping("/addNews")
    public void addNews(
                        @RequestParam("newsType") Integer newsType,
                        @RequestParam("title") String title,
                        @RequestParam("topicId") Integer topicId,
                        @RequestParam("author") String author,
                        @RequestParam("contents") String contents,
                        @RequestParam("contentOne") String contentOne,
                        @RequestParam("contentTwo") String contentTwo,
                        @RequestParam("contentThree") String contentThree,
                        @RequestParam("contentFour") String contentFour,
                        HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        News news = new News();
        news.setNtid(topicId);
        news.setNtitle(title);
        news.setNauthor(author);
        news.setNcontent(contents);

        PictureNews pictureNews = new PictureNews();
        pictureNews.setPtid(topicId);
        pictureNews.setPtitle(title);
        pictureNews.setPauthor(author);
        pictureNews.setPcontent1(contentOne);
        pictureNews.setPcontent2(contentTwo);
        pictureNews.setPcontent3(contentThree);
        pictureNews.setPcontent4(contentFour);


        //一般新闻的添加
        if (newsType == 1){
            Integer i = newsService.addNews(news);
            if (i > 0){
                out.println("{'status':'1','message':'添加成功','url':'/news/index.html'}");
            }else{
                out.println("{'status':'2','message':'添加失败','url':'/news/toAddNews'}");
            }
        }
        //图片新闻的添加
        if (newsType == 2){
            Integer j = pictureNewsService.addPicNews(pictureNews);
            if (j > 0){
                out.println("{'status':'1','message':'添加成功','url':'/news/getPictureNews'}");
            }else{
                out.println("{'status':'2','message':'添加失败','url':'/news/toAddNews'}");
            }
        }
    }
}
