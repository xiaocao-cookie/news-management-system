package com.zhang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.fileupload.util.LimitedInputStream;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private Integer cid;
    private Integer cnid;
    private Integer cpid;
    private String ccontent;
    private Date cdate;
    private Integer cauthorId;  //对应user中的uid

    private String ntitle;
    private String loginName;

    private List<Comment> commentList;
    private List<User> userList;
    private List<Reply> replyList;
}
