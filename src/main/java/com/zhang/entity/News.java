package com.zhang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class News {
    private Integer nid;
    private Integer ntid;
    private String ntitle;
    private String ncontent;
    private String nauthor;
    private Date nCreateDate;
    private Date nModifyDate;
    private List<Topic> topicList;
}
