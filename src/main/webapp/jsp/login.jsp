<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <!--  引入jQuery.js,灵活的为页面中的组件添加事件   -->
    <script src="../bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>
    <!--bootstrap框架-->
    <link href="../bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <link href="../css/logins.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form class="form-horizontal" style="padding-top: 30%">
            <!--用户名输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-user" id="usernameIcon"></span>
                <input type="text" class="form-control" id="username" placeholder="Enter your username" autocomplete="off">
            </div>
            <!--密码输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-lock" id="passwordIcon"></span>
                <input type="password" class="form-control" id="password" placeholder="Enter your password" autocomplete="off" required pattern="[0-9]{6}">
            </div>
            <!--登录重置按钮组-->
            <div class="form-group">
                <div class="col-md-3 col-md-offset-2">
                    <button type="submit" class="btn btn-info" id="loginButton">登&nbsp;&nbsp;录</button>
                </div>
                <div class="col-md-3 col-md-offset-2">
                    <button type="reset" class="btn btn-success" id="resetButton">重&nbsp;&nbsp;置</button>
                </div>
            </div>
        </form>
        <span id="tips">还没有账号？<a href="register.jsp" id="go">去注册>></a></span>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
