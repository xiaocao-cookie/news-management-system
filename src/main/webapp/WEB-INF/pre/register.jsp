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

</head>
<body id="body">
<%@ include file="../common/header.jsp"%>
<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form action="${ctx}/Register/register" class="form-horizontal" >
            <!--用户名输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-user" id="loginNameIcon"></span>
                <input type="text" class="form-control" id="loginName" name="loginName" placeholder="不能包含特殊符号,长度在4-16的范围内" required pattern="[A-Za-z0-9]{4,16}">
            </div>
            <!--密码输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-lock" id="passwordIcon"></span>
                <input type="password" class="form-control" id="password" name="password" placeholder="密码由六位数字组成" autocomplete="off" required pattern="[0-9]{6}">
            </div>
            <!--手机号输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-earphone" id="phoneIcon"></span>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="手机号以13、15、18开头且是十一位" required pattern="1[3,5,8]\d{9}">
            </div>
            <!--身份证输入框-->
            <div class="form-group">
                <span class="glyphicon glyphicon-leaf" id="idCardIcon"></span>
                <input type="text" class="form-control" id="idCard" name="idCard" placeholder="身份证号" required pattern="[0-9]{18}">
            </div>
            <%--性别选择框--%>
            <div class="form-group">
                <label class="radio-inline" style="padding-left: 160px">
                    <input type="radio" name="sex" id="man" value="0" style="width: 15px;height: 15px" checked> 男
                </label>
                <label class="radio-inline" style="padding-left: 60px;">
                    <input type="radio" name="sex" id="women" value="1" style="width: 15px;height: 15px"> 女
                </label>
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
        <span id="tips">已有账号？&nbsp;&nbsp;<a href="${ctx}/Login/toLogin" id="toLogin">去登录>></a></span>
    </div>
</div>
<br><br>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
