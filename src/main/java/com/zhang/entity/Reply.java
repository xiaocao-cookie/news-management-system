package com.zhang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
    private Integer id;
    private Integer rid;
    private Integer rcid;
    private String content;
    private Date rdate;
    private Integer rauthorId;
    private List<Comment> commentList;
    private List<User> userList;
    private List<Reply> replyList;
}
