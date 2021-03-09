package com.zhang.controller;

import com.zhang.entity.User;
import com.zhang.service.UserService;
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
@RequestMapping("/user")
public class UserController {

    @Resource
    public UserService userService;

    @RequestMapping("/getUserInfo")
    public String getUserInfo(Model model){
        model.addAttribute("menu",1);
        return "backend/user/userInfo";
    }
    @RequestMapping("/getUserList")
    public String getUserList(
            @RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
            Model model){
        Page pager = userService.queryPageUsers(currentPage);
        List<User> userList = pager.getUserList();
        model.addAttribute("pager",pager);
        model.addAttribute("userList",userList);
        model.addAttribute("menu",2);
        return "backend/user/userList";
    }

    @RequestMapping("/addUser")
    public void addUser(@RequestParam("loginName") String loginName,
                          @RequestParam("password") String password,
                          @RequestParam("sex") Integer sex,
                          @RequestParam("telphone") String phone,
                          @RequestParam("idCard") String idCard,
                          @RequestParam("userType") Integer userType,
                          HttpServletResponse response) throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        User user = new User();
        user.setLoginName(loginName);
        user.setPassword(password);
        user.setSex(sex);
        user.setPhone(phone);
        user.setIdCard(idCard);
        user.setType(userType);
        PrintWriter out = response.getWriter();
        Integer i = userService.addUser(user);
        if (i > 0){
            out.println("<script>alert('添加成功');location.href='/news/user/getUserList'</script>");
        }else{
            out.println("<script>alert('添加失败,请重新添加');location.href='/news/user/getUserList'</script>");
        }
    }

}
