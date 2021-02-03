package com.zhang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Picture {
    private Integer pid;
    private Integer ptid;
    private String ptitle;
    private String psummary;
    private String pcontent1;
    private String pPicPath1;
    private String pcontent2;
    private String pPicPath2;
    private String pcontent3;
    private String pPicPath3;
    private String pcontent4;
    private String pPicPath4;
    private Date pCreateDate;
}
