package com.zhang.service.impl;

import com.zhang.dao.UserMapper;
import com.zhang.entity.User;
import com.zhang.service.UserService;
import com.zhang.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    //用户登录
    @Override
    public User loginUser(String loginName, String password) {
        User user = userMapper.loginUser(loginName, password);
        return user;
    }

    //用户注册
    @Override
    public int register(User user) {
        int i = userMapper.register(user);
        return i;
    }

    //获取用户列表
    @Override
    public Page queryPageUsers(Integer currentPage,String loginName,String phone) {
        Page page = new Page();
        //查询用户总数
        Integer totalCount = userMapper.queryTotalCount(loginName, phone);
        page.setTotalCount(totalCount);
        //当前页面在合理范围
        if (currentPage < 1){
            currentPage = 1;
        }else if (currentPage > page.getPageCount()){
            currentPage = page.getPageCount();
        }
        page.setUrl("/user/getUserList");
        page.setCurrentPage(currentPage);
        List<User> userList = userMapper.getPageUsers((currentPage-1)*page.getPageSize(),page.getPageSize(),loginName,phone);
        page.setUserList(userList);
        return page;
    }

    @Override
    public Integer addUser(User user) {
        Integer i = userMapper.addUser(user);
        return i;
    }

    @Override
    public List<User> queryUserById(Integer uid) {
        List<User> userList = userMapper.queryUserById(uid);
        return userList;
    }

    @Override
    public Integer deleteUserById(Integer uid) {
        Integer i = userMapper.deleteUserById(uid);
        return i;
    }

    @Override
    public Integer modifyUser(User user) {
        Integer i = userMapper.modifyUser(user);
        return i;
    }

}
