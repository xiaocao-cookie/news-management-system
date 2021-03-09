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
    <title>${topicName}新闻</title>
</head>
<body>
<%@include file="../common/header.jsp"%>
<div class="container">
    <!--  左侧相关主题列表  -->
    <div class="col-md-8">
        <div class="row">
            <div class="col-md-3">
                <span style="color: #2aabd2;font-size: 30px;font-weight: bolder;">${topicName}新闻</span>
            </div>
            <%-- 搜索框  --%>
            <div class="col-md-9">
                <form class="form-inline" action="${ctx}/news/searchNews">
                    <div class="form-group">
                        <input type="text" id="keywords" name="keywords" class="form-control" placeholder="请输入您想搜索的内容">
                        <button id="searchButton" type="submit" class="btn btn-primary">
                            搜索<span class="glyphicon glyphicon-search"></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <table class="table table-hover" id="topicNewsTable">
                <tbody>
                <c:forEach items="${plainNews}" var="news">
                    <tr>
                        <td>
                            <a href="${ctx}/news/queryNewsDetails?id=${news.nid}">
                                <span style="margin-left: 10px;font-size: 24px">${news.ntitle}</span>
                            </a>
                            <br><br><br><br><br>
                            <div class="col-md-6" style="font-size: 15px">
                                发布时间：<fmt:formatDate value="${news.NCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </div>
                            <div class="col-md-3 col-md-offset-3" style="font-size: 15px">
                                责任编辑：${news.nauthor}
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${pictureNews}" var="temp">
                    <tr>
                        <td>
                            <a href="${ctx}/news/queryPicNewsDetails?id=${temp.pid}">
                                <span style="margin-left: 10px;font-size: 24px">${temp.ptitle}</span>
                            </a><br><br><br><br><br>
                            <div class="col-md-6" style="font-size: 15px">
                                发布时间：<fmt:formatDate value="${temp.PCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </div>
                            <div class="col-md-3 col-md-offset-3" style="font-size: 15px">
                                责任编辑：${temp.pauthor}
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-md-4">
        <br><br>
        <span id="sohuRecommend">|搜狐号推荐</span><br><br>
        <%-- 狸猫娱乐--%>
        <div class="row" style="margin-left: 25px">
            <div class="col-md-2">
                <img src="${ctx}/statics/img/limaoyule.jpg" style="width: 55px;height: 55px;border-radius: 55px">
            </div>
            <div class="col-md-10" style="padding-left: 25px">
                <a href="#" id="limaoTitle">狸猫娱乐</a><br>
                <span>最新鲜的娱乐大餐，第一手的娱乐资讯</span>
            </div>
        </div><br>
        <%--  肉叔电影--%>
        <div class="row" style="margin-left: 25px">
            <div class="col-md-2">
                <img src="${ctx}/statics/img/roushudianyin.jpg" style="width: 55px;height: 55px;border-radius: 55px">
            </div>
            <div class="col-md-10" style="padding-left: 25px">
                <a href="#" id="roushuTitle">肉叔电影</a><br>
                <span>找肉叔，带你完美避开烂片</span>
            </div>
        </div><br>
        <%--  星关系--%>
        <div class="row" style="margin-left: 25px">
            <div class="col-md-2">
                <img src="${ctx}/statics/img/xingguanxi.jpg" style="width: 55px;height: 55px;border-radius: 55px">
            </div>
            <div class="col-md-10" style="padding-left: 25px">
                <a href="#" id="xguanxiTitle">星关系</a><br>
                <span>中国权威的明星关系引擎，用数据讲八卦</span>
            </div>
        </div><br>
        <%-- 谈资 --%>
        <div class="row" style="margin-left: 25px">
            <div class="col-md-2">
                <img src="${ctx}/statics/img/tanzi.jpg" style="width: 55px;height: 55px;border-radius: 55px">
            </div>
            <div class="col-md-10" style="padding-left: 25px">
                <a href="#" id="tanziTitle">谈资</a><br>
                <span>移动社交类媒体APP</span>
            </div>
        </div><br>
        <%--  橘子娱乐  --%>
        <div class="row" style="margin-left: 25px">
            <div class="col-md-2">
                <img src="${ctx}/statics/img/juziyule.jpg" style="width: 55px;height: 55px;border-radius: 55px">
            </div>
            <div class="col-md-10" style="padding-left: 25px">
                <a href="#" id="juziTitle">橘子娱乐</a><br>
                <span>面向新生代的潮流APP</span>
            </div>
        </div><br>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
