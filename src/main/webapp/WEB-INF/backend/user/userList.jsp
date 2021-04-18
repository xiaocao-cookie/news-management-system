<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户管理</title>
</head>
<body>
<%@include file="../../common/header.jsp"%>
<br><br>
<div class="container">
    <%--  左侧  --%>
    <%@include file="../../common/leftBar.jsp"%>
    <%--  右侧  --%>
    <!--用户管理-->
    <div class="col-md-8" id="rightUserPart">
        <h2>用户管理</h2>
        <hr>
        <!-- 右侧数据标签页   -->
        <ul class="nav nav-tabs">
            <li><a href="#personalPane" data-toggle="tab" id="personalNav">个人中心</a></li>
            <c:if test="${sessionScope.loginUser.type == 0}">
                <li class="active"><a href="#userListPane" data-toggle="tab" id="userListNav">用户列表</a></li>
            </c:if>
            <li><a href="#addUserModal" data-toggle="modal" data-target="#addUserModal" id="userAddNav">用户添加</a></li>
        </ul>
        <!-- 标签页所对应的具体内容   -->
        <div class="tab-content">
            <!--  个人中心的面板显示  -->
            <div class="tab-pane" id="personalPane">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        详细信息
                    </div>
                    <div class="panel-body">
                        <dl class="dl-horizontal">
                            <dt>登录名</dt>
                            <dd>${sessionScope.loginUser.loginName}</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>密码</dt>
                            <dd id="rPassword">***</dd>
                            <dd id="showPassword" hidden>${sessionScope.loginUser.password}</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>性别</dt>
                            <dd>${sessionScope.loginUser.sex == 0?'男':'女'}</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>手机号</dt>
                            <dd id="rPhone">${sessionScope.loginUser.phone.substring(0,3)}****${sessionScope.loginUser.phone.substring(7)}</dd>
                            <dd id="showPhone" hidden>${sessionScope.loginUser.phone}</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>身份证号</dt>
                            <dd id="rIdCard">${sessionScope.loginUser.idCard.substring(0,6)}******${sessionScope.loginUser.idCard.substring(14)}</dd>
                            <dd id="showIdCard" hidden>${sessionScope.loginUser.idCard}</dd>
                        </dl>
                        <dl class="dl-horizontal">
                            <dt>会员类型</dt>
                            <dd>${sessionScope.loginUser.type == 0?'管理员':'普通用户'}</dd>
                        </dl>
                        <center>
                            <button class="btn btn-primary" id="viewMessage">查看详细信息</button>
                            <button class="btn btn-success" id="hideMessage">隐藏详细信息</button>
                        </center>
                    </div>
                </div>
            </div>
            <!--  用户列表的面板显示   -->
            <c:if test="${sessionScope.loginUser.type == 0}">
                <div class="tab-pane active" id="userListPane">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-center">
                                <form action="${ctx}/user/getUserList" method="post" class="form-inline">
                                    <div class="form-group">
                                        <label for="name">登录名</label>
                                        <input type="text" value="${loginName}"  name="loginName" class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">手机</label>
                                        <input style="height: 34px;padding-left: 12px" value="${phone}" type="text" name="phone" class="form-control" id="phone">
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" class="btn btn-primary" value="查询">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th class="text-center">登录名</th>
                                    <th class="text-center">手机号</th>
                                    <th class="text-center">身份证号</th>
                                    <th>性别</th>
                                    <th style="padding-left: 8px;width: 83px;">用户类型</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${userList}" var="temp">
                                    <tr>
                                        <td>${temp.loginName}</td>
                                        <td>${temp.phone}</td>
                                        <td>${temp.idCard}</td>
                                        <td>${temp.sex == 0?'男':'女'}</td>
                                        <td>${temp.type == 0?'管理员':'普通用户'}</td>
                                        <td style="padding-left: 30px;width: 111px;">
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#modifyUserModal" value="${temp.uid}" type="button" id="modifyUser"
                                                    onclick="toModifyUser(${temp.uid},'${temp.loginName}','${temp.password}','${temp.phone}','${temp.idCard}',${temp.sex},${temp.type});">修改</button>
                                            <button class="btn btn-primary" value="${temp.uid}" type="button" id="deleteUser" onclick="delUser(${temp.uid});">删除</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <%@include file="../../common/pageBar.jsp"%>
                        </div>
                    </div>
                </div>
            </c:if>
            <%-- 修改用户的模态框  --%>
            <div id="modifyUserModal" class="modal fade modifyUserModal" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h3>修改用户</h3>
                            </div>
                        </div>
                        <div class="modal-body">
                            <form class="form-inline" style="padding-left: 125px">
                                <div class="form-group">
                                    &nbsp;&nbsp;
                                    登录名
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" name="oldLoginName" value="" class="form-control" id="oldLoginName" placeholder="长度在4-16的范围内" required pattern="[A-Za-z0-9]{4,16}" style="padding-left: 10px;width: 214px">
                                </div>
                                <br><br>
                                <div class="form-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    密码
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="password" class="form-control" value="" id="oldPwd" name="oldPassword" placeholder="密码由六位数字组成"  required pattern="[0-9]{6}" style="width: 214px;height:40px">
                                </div>
                                <br><br>
                                <div class="form-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    性别
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" class="form-control" name="sex" value="0">男
                                    <input type="radio" class="form-control" name="sex" value="1">女
                                </div>
                                <br><br>
                                <div class="form-group">
                                    &nbsp;&nbsp;
                                    手机号
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="form-control" value="" id="oldPhone" name="oldPhone" placeholder="以13、15、18开头"  required pattern="1[3,5,8]\d{9}" style="margin-left:3px;width: 214px;height:40px">
                                </div>
                                <br><br>
                                <div class="form-group">
                                    身份证号
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="form-control" value="" id="oldIdCard" name="oldIdCard" style="padding-left: 10px;width: 214px" placeholder="请输入18位的身份证号" required pattern="[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]">
                                </div>
                                <br><br>
                                <input hidden type="text" name="oldUserId" value="">
                                <input hidden type="text" name="oldUserType" value="">
                                <div class="form-group text-center" style="margin-left: 200px">
                                    <button data-toggle="modal" data-target=".message" type="button" class="btn btn-primary" onclick="modifyUser();">提交</button>
                                    <button type="reset" class="btn btn-default" data-dismiss="modal">关闭</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--  用户添加的模态框显示   -->
            <div class="modal fade" id="addUserModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3>添加用户</h3>
                        </div>
                        <div class="modal-body">
                            <form class="form-inline" style="padding-left: 125px">
                                <div class="form-group">
                                    &nbsp;&nbsp;
                                    登录名
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" name="loginName" class="form-control" id="loginName" placeholder="长度在4-16的范围内" required pattern="[A-Za-z0-9]{4,16}" style="padding-left: 10px;width: 214px">
                                </div>
                                <br><br>
                                <div class="form-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    密码
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="password" class="form-control" id="addPwd" name="password" placeholder="密码由六位数字组成" autocomplete="off" required pattern="[0-9]{6}" style="width: 214px;height:40px">
                                </div>
                                <br><br>
                                <div class="form-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    性别
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" class="form-control" name="sex" value="0" checked>男
                                    <input type="radio" class="form-control" name="sex" value="1">女
                                </div>
                                <br><br>
                                <div class="form-group">
                                    &nbsp;&nbsp;
                                    手机号
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="form-control" id="telphone" name="telphone" placeholder="以13、15、18开头"  required pattern="1[3,5,8]\d{9}" style="margin-left:3px;width: 214px;height:40px">
                                </div>
                                <br><br>
                                <div class="form-group">
                                    身份证号
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" class="form-control" id="idCard" name="idCard" style="padding-left: 10px;width: 214px" placeholder="请输入18位的身份证号" required pattern="[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]">
                                </div>
                                <br><br>
                                <div class="form-group text-center" style="margin-left: 200px">
                                    <button type="button" class="btn btn-primary" onclick="addUser();">提交</button>
                                    <button type="reset" class="btn btn-default" data-dismiss="modal">关闭</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
<%@include file="../../common/footer.jsp"%>
</body>
<script src="${ctx}/statics/js/admin.js" type="text/javascript"></script>
</html>
