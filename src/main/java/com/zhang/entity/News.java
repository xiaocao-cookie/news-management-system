package com.zhang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class News {
    private Integer nid;
    private Integer ntid;
    private String ntitle;
    private String nsummary;
    private String ncontent;
    private String nauthor;
    private Date nCreateDate;
    private Date nModifyDate;
    private String nPicPath;

}
