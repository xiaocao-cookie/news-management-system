<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Table</title>
    <script src="../bootstrap-3.3.7/js/jquery-3.2.1.min.js"></script>

    <%--引入bootstrap框架--%>
    <link href="../bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="../bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <%--引入layui框架--%>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.all.js"></script>
</head>
<body>
<div class="container">
    <div class="col-md-8 col-md-offset-2">
        <table class="table table-bordered table-hover">
            <tr>
                <th>#</th>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
            </tr>
            <tr class="warning">
                <td>1</td>
                <td>101</td>
                <td>陈一</td>
                <td>男</td>
            </tr>
            <tr class="info">
                <td>2</td>
                <td>102</td>
                <td>刘二</td>
                <td>女</td>
            </tr>
            <tr class="warning">
                <td>3</td>
                <td>103</td>
                <td>张三</td>
                <td>男</td>
            </tr>
            <tr class="success">
                <td>4</td>
                <td>104</td>
                <td>李四</td>
                <td>男</td>
            </tr>
            <tr class="warning">
                <td>5</td>
                <td>105</td>
                <td>王五</td>
                <td>女</td>
            </tr>
            <tr class="info">
                <td>6</td>
                <td>106</td>
                <td>赵六</td>
                <td>女</td>
            </tr>
            <tr class="warning">
                <td>7</td>
                <td>107</td>
                <td>钱七</td>
                <td>男</td>
            </tr>
            <tr class="info">
                <td>8</td>
                <td>108</td>
                <td>孙八</td>
                <td>男</td>
            </tr>
        </table>
    </div>
    <div class="col-md-8 col-md-offset-3">
        <%@ include file="pageBar.jsp"%>
<%--        <c:import url="pageBar.jsp"/>--%>
    </div>
</div>
</body>
</html>
