<!DOCTYPE HTML>
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
    <div class="row">
        <%--轮播图--%>
        <div class="col-md-9">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <a href="${ctx}/news/queryPicNewsDetails?id=4"><img src="${ctx}/statics/img/firstSlide.jpg" alt="江西致富小康路" id="firstSlide"></a>
                        <div class="carousel-caption" id="firstText">
                            航拍江西新余深山“大动脉” 直通致富“小康路”
                        </div>
                    </div>
                    <div class="item">
                        <a href="${ctx}/news/queryPicNewsDetails?id=5"><img src="${ctx}/statics/img/secondSlide.jpg" alt="布氏鲸" id="secondSlide"></a>
                        <div class="carousel-caption" id="secondText">
                            布氏鲸现身涠洲岛海域
                        </div>
                    </div>
                    <div class="item">
                        <a href="${ctx}/news/queryPicNewsDetails?id=6"><img src="${ctx}/statics/img/thirdSlide.jpg" alt="公益钢琴课" id="thirdSlide"></a>
                        <div class="carousel-caption" id="thirdText">
                            公益钢琴课添彩童年生活
                        </div>
                    </div>
                    <div class="item">
                        <a href="${ctx}/news/queryPicNewsDetails?id=7"><img src="${ctx}/statics/img/fourSlide.jpg" alt="山西青铜博物馆" id="fourSlide"></a>
                        <div class="carousel-caption" id="fourText">
                            走进晋地青铜世界 旁观千年前的权力游戏
                        </div>
                    </div>
                    <div class="item">
                        <a href="${ctx}/news/queryPicNewsDetails?id=2"><img src="${ctx}/statics/img/fifthSlide.jpg" alt="居家令" id="fifthSlide"></a>
                        <div class="carousel-caption" id="fifthText">
                            加拿大人口第一大省安大略省实施“居家令”
                        </div>
                    </div>
                    <div class="item">
                        <a href="${ctx}/news/queryPicNewsDetails?id=3"><img src="${ctx}/statics/img/sixSlide.png" alt="校场：美新研洲际导弹，是否能改变世界军力天平" id="sixSlide"></a>
                        <div class="carousel-caption" id="sixText">
                            校场：美新研洲际导弹，是否能改变世界军力天平
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <%--热点新闻--%>
        <div class="col-md-3">
            <div class="panel panel-default" id="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">热点新闻</h3>
                </div>
                <div class="panel-body">
                    <ul>
                        <c:forEach items="${hotNews}" var="temp">
                            <li style="margin-left: -20px"><a href="${ctx}/news/queryNewsDetails?id=${temp.nid}">${temp.ntitle}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%--广告--%>
    <div class="row">
        <img src="${ctx}/statics/img/adv.png" style="margin-left: 80px">
    </div>
    <%--每个主题下的新闻展示--%>
    <div class="row">
        <c:forEach items="${sessionScope.topicList}" var="topic">
        <hr />
        <a href="#" id="topicName">${topic.tname}</a>
        <hr style="border-top: 5px solid #2aabd2"/>
        <c:if test="${topic.newsList.size() == 0}">
           <center>
               <div>此主题下暂无新闻</div>
               <a href="#" class="btn btn-primary">点击添加</a>
           </center>
        </c:if>
        <c:if test="${topic.newsList.size() != 0}">
            <%--左侧图片新闻--%>
            <c:forEach items="${topic.pictureNewsList}" var="pictureNews" begin="1" step="1" end="1">
                <div class="col-md-3">
                    <a class="thumbnail" style="height: 380px" href="${ctx}/news/queryPicNewsDetails?id=${pictureNews.pid}">
                        <img src="${ctx}/statics/img/${pictureNews.PPicPath1}" alt="..." style="height: 200px;width: 375px">
                        <div class="caption">
                            <h4>&nbsp;&nbsp;&nbsp;&nbsp;${pictureNews.ptitle};${pictureNews.pcontent1.substring(0,30)}...</h4>
                        </div>
                    </a>
                </div>
            </c:forEach>
            <%--中间主题新闻--%>
            <div class="col-md-6">
                <ul>
                    <c:forEach items="${topic.newsList}" var="temp">
                        <div class="col-md-7">
                            <li>
                                <a href="${ctx}/news/queryNewsDetails?id=${temp.nid}">${temp.ntitle}</a>
                            </li>
                        </div>
                        <div class="col-md-5">
                            <span><fmt:formatDate value="${temp.NCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
                        </div>
                    </c:forEach>
                </ul>
            </div>
            <br><br>
            <%--右侧图片新闻，附带广告图片--%>
            <div class="col-md-3">
                <c:forEach items="${topic.pictureNewsList}" var="pictureNews" begin="2" step="1" end="2">
                    <div class="row" style="height: 150px">
                        <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews.pid}" class="thumbnail" id="rightThumbnailTop" style="margin-top: -30px">
                            <img src="${ctx}/statics/img/${pictureNews.PPicPath1}"  style="height: 150px;width: 300px" alt="...">
                            <div class="caption">
                                <h5>&nbsp;&nbsp;&nbsp;&nbsp;${pictureNews.ptitle};${pictureNews.pcontent1.substring(0,20)}...</h5>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                <div class="row" style="height: 220px">
                    <c:forEach items="${topic.pictureNewsList}" var="pictureNews" begin="3" step="1" end="3">
                        <div class="col-md-6">
                            <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews.pid}" class="thumbnail" id="rightThumbnailLarge">
                                <img src="${ctx}/statics/img/${pictureNews.PPicPath1}" style="height: 90px;width: 240px" alt="...">
                                <div class="caption">
                                    <h5>&nbsp;&nbsp;&nbsp;&nbsp;${pictureNews.pcontent1.substring(0,13)}...</h5>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                    <c:forEach items="${topic.pictureNewsList}" var="pictureNews" begin="4" step="1" end="4">
                        <div class="col-md-6">
                            <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews.pid}" class="thumbnail" id="rightThumbnailSmall">
                                <img src="${ctx}/statics/img/${pictureNews.PPicPath1}" style="height: 90px;width: 240px;" alt="...">
                                <div class="caption">
                                    <h5>&nbsp;&nbsp;&nbsp;&nbsp;${pictureNews.pcontent1.substring(0,13)}...</h5>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
        </c:forEach>
    </div>
    <a href="#top" style="position: absolute;right: 10px">回到顶部<caret class="glyphicon glyphicon-menu-up"></caret></a><br><br>
    <hr style="border-top: 2px solid #2aabd2"/>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
