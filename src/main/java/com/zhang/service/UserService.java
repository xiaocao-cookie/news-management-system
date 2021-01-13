package com.zhang.service;

import com.zhang.entity.User;

public interface UserService {
    //用户登录
    public User loginUser(String loginName,String password);
    //用户注册
    public int register(User user);
}
