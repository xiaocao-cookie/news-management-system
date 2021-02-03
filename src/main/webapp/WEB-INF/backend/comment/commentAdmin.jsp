<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>评论区管理</title>
</head>
<body>
<%@include file="../../common/header.jsp"%>
<br><br>
<div class="container">
    <%--  左侧  --%>
    <%@include file="../../common/leftBar.jsp"%>
    <%--  右侧  --%>
    <div class="col-md-8" id="rightCommentsPart">
        <h2>评论区管理</h2>
        <hr>
        <!-- 右侧数据标签页 -->
        <ul class="nav nav-tabs">
            <li class="active"><a  href="#personalCommentPane" data-toggle="tab" id="personCommentNav">评论过</a></li>
            <li><a href="#allCommentsPane" data-toggle="tab" id="allCommentsNav">所有评论</a></li>
        </ul>
        <!--  标签页所对应的具体内容  -->
        <div class="tab-content">
            <!-- 个人评论  -->
            <div class="tab-pane active" id="personalCommentPane">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <table class="table table-hover table-striped table-bordered">
                            <tr>
                                <div class="container">
                                    <th class="col-md-6 text-center">评论的新闻标题</th>
                                    <th class="col-md-2 text-center">评论内容</th>
                                    <th class="col-md-2 text-center">评论时间</th>
                                    <th class="col-md-2 text-center">评论人</th>
                                </div>
                            </tr>
                            <c:forEach items="${commentList}" var="temp">
                                <tr>
                                    <td><a style="background-color: white;color: #0f0f0f" href="#">${temp.ntitle}</a></td>
                                    <td>${temp.ccontent}</td>
                                    <td><fmt:formatDate value="${temp.cdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>${temp.loginName}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 所有评论  -->
            <div class="tab-pane" id="allCommentsPane">
                <c:forEach items="${allCommentList}" var="temp">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ${temp.loginName}的评论
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover table-striped table-bordered">
                                <tr>
                                    <div class="container">
                                        <th class="col-md-6 text-center">评论的新闻标题</th>
                                        <th class="col-md-2 text-center">评论内容</th>
                                        <th class="col-md-2 text-center">评论时间</th>
                                        <th class="col-md-2 text-center">评论人</th>
                                    </div>
                                </tr>
                                <c:forEach items="${commentList}" var="temp">
                                    <tr>
                                        <td><a style="background-color: white;color: #0f0f0f" href="#">${temp.ntitle}</a></td>
                                        <td>${temp.ccontent}</td>
                                        <td><fmt:formatDate value="${temp.cdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td>${temp.loginName}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
</div>
<br><br>
<%@include file="../../common/footer.jsp"%>
</body>
<script src="${ctx}/statics/js/admin.js" type="text/javascript"></script>
</html>
