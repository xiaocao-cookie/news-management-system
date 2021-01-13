package com.zhang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer uid;
    private String loginName;
    private String password;
    private Integer sex;
    private String phone;
    private String idCard;
    private Integer type;
}
