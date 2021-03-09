<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <base href="<%=basePath%>">
    <title>微新闻</title>
</head>
<body>
<%@include file="../common/header.jsp"%>
<div class="container">
    <!-- 主体新闻 -->
    <div class="row">
        <!-- 左侧广告显示区域 -->
        <div class="col-md-3">
            <a href="http://www.gov.cn/zhuanti/2021qglh/index.htm" target="_blank"><img src="${ctx}/statics/img/leftPicture.jpg"></a>
            <br><br><br>
            <img src="${ctx}/statics/img/leftPicture2.jpg">
        </div>
        <!-- 中间新闻显示区域  -->
        <div class="col-md-6">
            <div class="text-center" style="font-size: 25px;font-weight: bolder">${plainNews.ntitle}</div>
            <div class="text-center" style="color: gray">
                <fmt:formatDate value="${plainNews.NCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </div>
            <br><br>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${plainNews.ncontent}
            </div><br>
            <div class="col-md-6 col-md-offset-7">
                <span style="color: gray">责任编辑：${plainNews.nauthor}</span>
            </div>

            <hr style="border-top: 2px solid #2aabd2"/><br>
            <%--  评论区   --%>
            <form action="#" method="post" class="form-horizontal">
                <textarea class="form-control" rows="3" placeholder="请输入评论内容。。。"></textarea><br>
                <div class="col-md-4 col-md-offset-8">
                    <button type="submit" id="commentsSubmit" class="form-control btn btn-info">发表评论</button>
                </div>
            </form><br><br><br>
            <span style="font-size: 20px;border-left: 5px solid deepskyblue">相关评论</span>
            <c:if test="${commentList.size() != 0}">
                <table class="table table-hover" id="commentsTable">
                    <tbody>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <td>评论内容：${comment.ccontent}<br><br><br>
                                <c:forEach items="${comment.userList}" var="temp">
                                    评论人：${temp.loginName}<br>
                                </c:forEach>
                                评论时间：<fmt:formatDate value="${comment.cdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <div class="col-md-3 col-md-offset-11">
                                    <button class="btn btn-primary" type="button" id="reply">回复</button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${commentList.size() == 0}">
                <hr style="border-top: 2px solid gray"/>
                <div class="text-center" style="font-size: 15px">
                    暂无他人评论
                </div><hr style="border-top: 2px solid gray"/>
                <br><br>
            </c:if>
        </div>
        <!-- 右侧推荐显示区域 -->
        <div class="col-md-3">
            <span id="hotRecommend">|热门推荐</span><br>
            <div style="height: 100px;width: 200px;border: 1px solid black">图片1</div>
            <div>图片标题1</div>
            <div style="height: 100px;width: 200px;border: 1px solid black">图片2</div>
            <div>图片标题2</div>
            <br><br>
            <span id="headline">|头条新闻</span><br><br>
            <div class="col-md-10">
                <c:forEach items="${hotNews}" var="temp">
                    <span class="glyphicon glyphicon-fire" style="color: red"></span>
                    <a href="${ctx}/news/queryNewsDetails?id=${temp.nid}" id="hotNews">
                        ${temp.ntitle}
                    </a>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
                    <br>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
