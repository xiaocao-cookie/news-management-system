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
        <!-- 左侧新闻显示区域 -->
        <div class="col-md-8">
            <div class="text-center" style="font-size: 25px;font-weight: bolder">${pictureNews.ptitle}</div>
            <div class="text-center" style="color: gray">
                <fmt:formatDate value="${pictureNews.PCreateDate}" pattern="yyyy-MM-dd"/>
            </div><br><br>
            <c:if test="${pictureNews.PPicPath1 != null && pictureNews.pcontent1 != null}">
                <div class="text-center">
                    <%-- 图片显示  --%>
                    <img src="${ctx}/statics/img/${pictureNews.PPicPath1}" style="width: 700px"/><br>
                </div>
                <%-- 显示内容  --%>
                <span id="content1">${pictureNews.pcontent1}</span><br><br>
            </c:if>
            <c:if test="${pictureNews.PPicPath2 != null && pictureNews.pcontent2 != null}">
                <div class="text-center">
                    <%-- 图片显示  --%>
                    <img src="${ctx}/statics/img/${pictureNews.PPicPath2}" style="width: 700px"/><br>
                </div>
                <%-- 显示内容  --%>
                <span id="content2">${pictureNews.pcontent2}</span><br><br>
            </c:if>
            <c:if test="${pictureNews.PPicPath3 != null && pictureNews.pcontent3 != null}">
                <div class="text-center">
                    <%-- 图片显示 --%>
                    <img src="${ctx}/statics/img/${pictureNews.PPicPath3}" style="width: 700px"/><br>
                </div>
                <%-- 显示内容  --%>
                <span id="content3">${pictureNews.pcontent3}</span><br><br>
            </c:if>
            <span style="color: gray">责任编辑：${pictureNews.pauthor}</span>
            <br><hr style="border-top: 2px solid #2aabd2"/><br><br><br>
            <%--  评论区   --%>
            <div class="row">
                <form action="#" method="post" class="form-horizontal">
                    <div class="form-group">
                        <textarea class="form-control" rows="3" style="width: 779px;margin-left: 16px;height: 94px;" placeholder="请输入评论内容。。。"></textarea>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-md-offset-10">
                            <button type="submit" class="form-control btn btn-info">发表评论</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row">
                <table class="table table-hover" id="commentsTable">
                    <tbody>
                    <tr>
                        <td>评论内容：<br><br><br>
                            评论人：<br>
                            评论时间：
                            <div class="col-md-3 col-md-offset-11">
                                <button class="btn btn-primary" type="button" id="reply1" style="margin-right: 0">回复</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>评论内容：<br><br><br>
                            评论人：<br>
                            评论时间：
                            <div class="col-md-3 col-md-offset-11">
                                <button class="btn btn-primary" type="button" id="reply2" style="margin-right: 0">回复</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>评论内容：<br><br><br>
                            评论人：<br>
                            评论时间：
                            <div class="col-md-3 col-md-offset-11">
                                <button class="btn btn-primary" type="button" id="reply3" style="margin-right: 0">回复</button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 右侧推荐 -->
        <div class="col-md-4">
            <span id="otherRecommand">|其他推荐</span><br><br>
            <div class="row">
                <div class="col-md-5">
                    <a href="#">图片</a>
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-5" id="otherContent1">
                    <a href="#">内容</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5" id="otherContent2">
                    <a href="#">内容</a>
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-5">
                    <a href="#">图片</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    图片
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-5" id="otherContent3">
                    内容
                </div>
            </div>
            <br><br><br><br><br>
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