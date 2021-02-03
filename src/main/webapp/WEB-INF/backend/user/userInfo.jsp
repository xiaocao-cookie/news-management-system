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
            <li class="active"><a href="#personalPane" data-toggle="tab" id="personalNav">个人中心</a></li>
            <c:if test="${sessionScope.loginUser.type == 0}">
                <li><a href="#userListPane" data-toggle="tab" id="userListNav">用户列表</a></li>
            </c:if>
            <li><a href="#addUserModal" data-toggle="modal" data-target="#addUserModal" id="userAddNav">用户添加</a></li>
        </ul>
        <!-- 标签页所对应的具体内容   -->
        <div class="tab-content">
            <!--  个人中心的面板显示  -->
            <div class="tab-pane active" id="personalPane">
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
                <div class="tab-pane" id="userListPane">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-center">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="name">登录名</label>
                                        <input type="text" class="form-control" id="name">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">手机</label>
                                        <input type="text" class="form-control" id="phone">
                                    </div>
                                    <div class="form-group">
                                        <label for="state">性别</label>
                                        <select id="state" class="form-control">
                                            <option class="active">--请选择--</option>
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="button" class="btn btn-primary" value="查询">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>登录名</th>
                                    <th>密码</th>
                                    <th>手机号</th>
                                    <th>身份证号</th>
                                    <th>性别</th>
                                    <th>用户类型</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${userList}" var="temp">
                                    <tr>
                                        <td>${temp.loginName}</td>
                                        <td>${temp.password}</td>
                                        <td>${temp.phone}</td>
                                        <td>${temp.idCard}</td>
                                        <td>${temp.sex == 0?'男':'女'}</td>
                                        <td>${temp.type == 0?'管理员':'普通用户'}</td>
                                        <td>
                                            <button class="btn btn-primary" type="button" id="modifyUser">修改</button>
                                            <button class="btn btn-primary" type="button" id="deleteUser">删除</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>
            <!--  用户添加的模态框显示   -->
            <div class="modal fade" id="addUserModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3>添加用户</h3>
                        </div>
                        <div class="col-md-8 col-md-offset-3">
                            <div class="modal-body">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="addName">姓名</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="form-control" id="addName">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label for="addPwd">密码</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="password" class="form-control" id="addPwd">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label for="addAge">年龄</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="form-control" id="addAge">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label for="addBir">生日</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="date" class="form-control" id="addBir" style="width: 170px">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label for="addPhone">手机号</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="form-control" id="addPhone">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label for="addState">激活状态</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <select id="addState">
                                            <option class="active">激活</option>
                                            <option>未激活</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">提交</button>
                            <button type="reset" class="btn btn-default" data-dismiss="modal">关闭</button>
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
