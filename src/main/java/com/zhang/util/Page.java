package com.zhang.util;

import com.zhang.entity.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Page {
    private int currentPage;                        // 当前页码
    private int pageSize = 8;                      // 页面大小，即每页显示记录数
    private int totalCount;                         // 记录总数
    private int pageCount;                          // 总页数
    private String url;                             //路径
    private List<User> userList;                    //用户信息
    private List<News> newsList;
    private List<Topic> topicList;
    private List<Comment> commentList;
    private List<PictureNews> pictureNewsList;

    public void setTotalCount(int totalCount) {
        if(totalCount > 0){
            this.totalCount = totalCount;
            pageCount = (totalCount % pageSize == 0)?(totalCount / pageSize):(totalCount / pageSize + 1);
        }
    }
}
