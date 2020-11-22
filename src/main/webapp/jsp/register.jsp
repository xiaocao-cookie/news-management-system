<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register</title>

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
        <form class="form-horizontal" method="post">
            <!--用户名输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-user" id="usernameIcon"></span>
                <input type="text" class="form-control" id="username" placeholder="由英文字母和数字组成的4-16位字符，以字母开头" autocomplete="off" required pattern="[A-Za-z][A-Za-z0-9]{3,15}">
            </div>
            <!--密码输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-lock" id="passwordIcon"></span>
                <input type="password" class="form-control" id="password" placeholder="密码由六位数字组成" autocomplete="off" required pattern="[0-9]{6}">
            </div>
            <%--确定密码输入框--%>
            <div class="form-group">
                <span class="glyphicon glyphicon-lock" id="rePasswordIcon"></span>
                <input type="password" class="form-control" id="rePassword" placeholder="再次输入密码" autocomplete="off" required pattern="[0-9]{6}">
            </div>
            <!--手机号输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-earphone" id="phoneIcon"></span>
                <input type="text" class="form-control" id="phone" placeholder="手机号以13、15、18开头且是十一位" autocomplete="off" required pattern="1[3,5,8]\d{9}">
            </div>
            <!--发送验证码框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-leaf" id="verifyCodeIcon"></span>
                <input type="text" class="form-control" id="verifyCode" placeholder="验证码必须是六位数字" autocomplete="off" required pattern="[0-9]{6}">
                <button type="button" class="btn btn-info" id="verifyCodeButton">发送验证码</button>
            </div>
            <!--注册重置按钮组-->
            <div class="form-group">
                <div class="col-md-3 col-md-offset-2">
                    <button type="submit" class="btn btn-info" id="registerButton">注&nbsp;&nbsp;册</button>
                </div>
                <div class="col-md-3 col-md-offset-2">
                    <button type="reset" class="btn btn-success" id="resetButton">重&nbsp;&nbsp;置</button>
                </div>
            </div>
        </form>
        <span id="tips">已有账号？&nbsp;&nbsp;<a href="login.jsp" id="go">去登录>></a></span>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
