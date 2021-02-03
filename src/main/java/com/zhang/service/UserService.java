package com.zhang.service;

import com.zhang.entity.User;

import java.util.List;

public interface UserService {
    //用户登录
    public User loginUser(String loginName,String password);
    //用户注册
    public int register(User user);
    //获取用户列表
    public List<User> getUserLists();
}
