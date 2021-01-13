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
    <title>Title</title>

    <!--  引入jQuery.js,灵活的为页面中的组件添加事件   -->
    <script src="../../statics/bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
    <!--bootstrap框架-->
    <link href="../../statics/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="../../statics/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h1>主页面</h1>
</body>
</html>
