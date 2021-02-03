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
    <title>主题名</title>
</head>
<body>
<%@include file="../common/header.jsp"%>
<div class="container">
    <!--  左侧相关主题列表  -->
    <!--  这些圈子都在看  -->
    <div class="col-md-3">

    </div>
    <!--  中间显示这个主题下的新闻  -->
    <div class="col-md-6">

    </div>
    <!--  右侧显示广告  -->
    <div class="col-md-3">

    </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
