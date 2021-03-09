package com.zhang.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Topic {
    private Integer tid;
    private String tname;

    private List<News> newsList;
    private List<PictureNews> pictureNewsList;
}
