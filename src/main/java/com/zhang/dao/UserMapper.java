package com.zhang.dao;

import com.zhang.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    //用户登录
    public User loginUser(@Param("loginName") String loginName,
                         @Param("password") String password);
    //注册用户
    public int register(User user);
}
