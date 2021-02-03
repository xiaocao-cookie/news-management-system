<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 左侧导航栏  -->
<div class="col-md-2 col-md-offset-1" id="leftBar">
    <br><br>
    <div class="text-center">
        <div class="panel-group" id="panelGroup1">
            <!--   左侧的用户管理     -->
            <div class="panel panel-default">
                <div class="panel-heading" style="background-color: #2F4056">
                    <div class="panel-title">
                        <a href="#" id="userPanelTitle" data-toggle="collapse">用户管理</a>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                            <a href="${ctx}/user/getUserInfo" class="list-group-item <c:if test="${menu==1}"> active </c:if>" id="personal">个人中心</a>
                            <c:if test="${sessionScope.loginUser.type == 0}">
                                <a href="${ctx}/user/getUserList" class="list-group-item <c:if test="${menu==2}"> active </c:if>" id="userList">用户列表</a>
                            </c:if>
                            <a href="#" class="list-group-item <c:if test="${menu==3}"> active </c:if>" id="userAdd">用户添加</a>
                    </div>
                </div>
            </div>
            <!--   左侧的主题管理     -->
            <div class="panel panel-default">
                <div class="panel-heading" style="background-color: #2F4056">
                    <div class="panel-title">
                        <a href="#" id="topicPanelTitle" data-toggle="collapse">主题管理</a>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a href="${ctx}/topic/index.html" class="list-group-item <c:if test="${menu==4}"> active</c:if>" id="topicList">主题列表</a>
                        <a href="#" class="list-group-item <c:if test="${menu==5}"> active</c:if>" id="topicAdd">主题添加</a>
                    </div>
                </div>
            </div>
            <!--   左侧的新闻管理     -->
            <div class="panel panel-default">
                <div class="panel-heading" style="background-color: #2F4056">
                    <div class="panel-title">
                        <a href="#" id="newsPanelTitle" data-toggle="collapse">新闻管理</a>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a href="${ctx}/news/index.html" class="list-group-item <c:if test="${menu==6}"> active</c:if>" id="newsList">新闻列表</a>
                        <a href="#" class="list-group-item <c:if test="${menu==7}"> active</c:if>" id="newsAdd">新闻添加</a>
                    </div>
                </div>
            </div>
            <!--  左侧的评论管理   -->
            <div class="panel panel-default">
                <div class="panel-heading" style="background-color: #2F4056">
                    <div class="panel-title">
                        <a href="#" id="commentsPanelTitle" data-toggle="collapse">评论区管理</a>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a href="${ctx}/comments/personalComments?id=${sessionScope.loginUser.uid}" class="list-group-item <c:if test="${menu==8}"> active</c:if>" id="personComments">评论过</a>
                        <a href="${ctx}/comments/allComments" class="list-group-item <c:if test="${menu==9}"> active</c:if>" id="allComments">所有评论</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
