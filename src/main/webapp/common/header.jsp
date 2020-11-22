<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>header</title>

    <!--  引入jQuery.js,灵活的为页面中的组件添加事件   -->
    <script src="../bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
    <!--bootstrap框架-->
    <link href="../bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <style>
        #navbarMiddle{
            margin-left: 240px;
        }
        #navbar{
            padding-bottom: 5px;
            padding-top: 5px;
        }
        #baiduLogo,#sinaLogo,#tencentLogo,#sohuLogo{
            width: 5px;
            height: 5px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid" id="navbar">
        <%--左半部分--%>
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Brand</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <%--中部--%>
            <ul class="nav navbar-nav" id="navbarMiddle">
                <li><a href="#">国内</a></li>
                <li><a href="#">国际</a></li>
                <li><a href="#">娱乐</a></li>
                <li><a href="#">体育</a></li>
                <li><a href="#">汽车</a></li>
                <li><a href="#">旅游</a></li>
                <li><a href="#">科技</a></li>
                <li><a href="#">财经</a></li>
                <li><a href="#">健康</a></li>
                <li><a href="#">NBA</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">更多<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">母婴</a></li>
                        <li><a href="#">军事</a></li>
                        <li><a href="#">星座</a></li>
                        <li><a href="#">IT</a></li>
                    </ul>
                </li>
            </ul>
            <%--右半部分--%>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">登录</a></li>
                <li><a href="#">注册</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">合作媒体<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="https://news.baidu.com/">百度新闻&nbsp;&nbsp;去这里>></a></li>
                        <li><a href="https://news.qq.com/">腾讯新闻&nbsp;&nbsp;去这里>></a></li>
                        <li><a href="https://news.sina.com.cn/">新浪新闻&nbsp;&nbsp;去这里>></a></li>
                        <li><a href="http://news.sohu.com/">搜狐新闻&nbsp;&nbsp;去这里>></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
