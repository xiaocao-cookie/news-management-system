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
<%--自定义的CSS样式--%>
<link href="${ctx}/statics/css/login.css" rel="stylesheet" type="text/css">
<link href="${ctx}/statics/css/pageBar.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/statics/css/main.css" rel="stylesheet" type="text/css">
<link href="${ctx}/statics/css/admin.css" rel="stylesheet" type="text/css"/>

<%--js--%>
<script src="${ctx}/statics/js/admin.js" type="text/javascript"></script>
<script src="${ctx}/statics/js/pageBar.js" type="text/javascript"></script>

<nav class="navbar navbar-default" id="top">
    <div class="container-fluid" id="navbar">
        <%--左半部分--%>
        <ul class="nav navbar-nav navbar-left">
            <li>
                <a class="navbar-brand" href="#">
                    <img src="${ctx}/statics/img/logo.jpg" id="logoPhoto">
                </a>
            </li>
            <li><a class="navbar-brand" href="${ctx}/index.jsp" id="logo">微新闻</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">合作媒体<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="https://news.baidu.com/" target="_blank"><img src="${ctx}/statics/img/baiduLogo.jpg" id="baiduLogo">百度新闻</a></li>
                    <li><a href="https://news.qq.com/" target="_blank"><img src="${ctx}/statics/img/tencentLogo.jpg" id="tencentLogo">腾讯新闻</a></li>
                    <li><a href="https://news.sina.com.cn/" target="_blank"><img src="${ctx}/statics/img/sinaLogo.jpg" id="sinaLogo">新浪新闻</a></li>
                    <li><a href="http://news.sohu.com/" target="_blank"><img src="${ctx}/statics/img/sohuLogo.jpg" id="sohuLogo">搜狐新闻</a></li>
                </ul>
            </li>
        </ul>

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
                <c:if test="${sessionScope.loginUser == null}">
                    <li><a href="${ctx}/Login/toLogin">登录</a></li>
                    <li><a href="${ctx}/Register/toRegister">注册</a></li>
                </c:if>
                <c:if test="${sessionScope.loginUser != null}">
                    <li><a href="${ctx}/user/getUserInfo" id="personCenter"><span class="glyphicon glyphicon-user"></span>&nbsp;${sessionScope.loginUser.loginName}</a></li>
                    <li><a href="${ctx}/Login/loginOut">注销</a></li>
                    <li><a href="${ctx}/user/getUserList">后台管理</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
<style>
    #navbarMiddle{
        margin-left: 140px;
    }
    #navbar{
        padding-bottom: 5px;
        padding-top: 5px;
    }
    #baiduLogo,#sinaLogo,#tencentLogo,#sohuLogo{
        width: 20px;
        height: 20px;
        margin-right: 10px;
        border-radius: 8px;
    }
    #logo{
        color: #2aabd2;
        font-size: large;
        font-weight: bolder;
    }
    #logoPhoto{
        height: 20px;
        width: 20px;
        border-radius: 5px;
    }
</style>
