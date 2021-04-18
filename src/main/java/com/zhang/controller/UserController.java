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

    //获取用户个人信息
    @RequestMapping("/getUserInfo")
    public String getUserInfo(Model model){
        model.addAttribute("menu",1);
        return "backend/user/userInfo";
    }

    //获取用户列表
    @RequestMapping("/getUserList")
    public String getUserList(
            @RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
            @RequestParam(value = "loginName",defaultValue = "") String loginName,
            @RequestParam(value = "phone",defaultValue = "") String phone,
            Model model){
        Page pager = userService.queryPageUsers(currentPage,loginName,phone);
        List<User> userList = pager.getUserList();
        model.addAttribute("pager",pager);
        model.addAttribute("userList",userList);
        model.addAttribute("menu",2);
        model.addAttribute("loginName",loginName);
        model.addAttribute("phone",phone);
        return "backend/user/userList";
    }

    //添加用户
    @RequestMapping("/addUser")
    public void addUser(@RequestParam("loginName") String loginName,
                          @RequestParam("password") String password,
                          @RequestParam("sex") Integer sex,
                          @RequestParam("phone") String phone,
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
            out.println("{'status':'1','message':'添加成功'}");
        }else{
            out.println("{'status':'2','message':'添加失败'}");
        }
    }


    //根据userId修改用户
    @RequestMapping("/modifyUser")
    public void modifyUserById(@RequestParam("id") Integer id,
                               @RequestParam("loginName") String loginName,
                               @RequestParam("password") String password,
                               @RequestParam("phone") String phone,
                               @RequestParam("idCard") String idCard,
                               @RequestParam("sex") Integer sex,
                               @RequestParam("userType") Integer userType,
                               HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        User user = new User();
        user.setUid(id);
        user.setLoginName(loginName);
        user.setPassword(password);
        user.setPhone(phone);
        user.setSex(sex);
        user.setIdCard(idCard);
        user.setType(userType);
        Integer i = userService.modifyUser(user);
        if (i > 0){
            out.println("{'status':'1','message':'修改成功'}");
        }else{
            out.println("{'status':'2','message':'修改失败'}");
        }
    }

    //根据userId删除用户
    @RequestMapping("/deleteUserById")
    public void deleteUserById(@RequestParam("id") Integer id,
                               HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer i = userService.deleteUserById(id);
        if (i > 0){
            out.println("{'status':'1','message':'删除成功'}");
        }else{
            out.println("{'status':'2','message':'删除失败'}");
        }
    }
}
