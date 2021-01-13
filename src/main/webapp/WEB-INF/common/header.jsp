<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
    var contextPath = "${ctx}";
</script>
<!--  引入jQuery.js,灵活的为页面中的组件添加事件   -->
<script src="${ctx}/statics/bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
<!--bootstrap框架-->
<link href="${ctx}/statics/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="${ctx}/statics/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<link href="${ctx}/statics/css/login.css" rel="stylesheet" type="text/css">

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
                <li><a href="#">军事</a></li>
                <li><a href="#">财经</a></li>
                <li><a href="#">科技</a></li>
                <li><a href="#">体育</a></li>
                <li><a href="#">娱乐</a></li>
                <li><a href="#">汽车</a></li>
                <li><a href="#">时尚</a></li>
                <li><a href="#">教育</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">更多<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">电影</a></li>
                        <li><a href="#">历史</a></li>
                        <li><a href="#">游戏</a></li>
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
