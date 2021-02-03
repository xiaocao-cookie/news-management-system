package com.zhang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private Integer cid;
    private Integer cnid;
    private String ccontent;
    private Date cdate;
    private String cauthorId;  //对应user中的uid

    private String ntitle;
    private String loginName;
}
