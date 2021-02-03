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

        </div>
        <!-- 右侧广告显示区域 -->
        <div class="col-md-4">

        </div>
    </div>
    <!-- 新闻评论区 -->
    <div class="row">

    </div>
    <!-- 下方的相关新闻 -->
    <div class="row">

    </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
