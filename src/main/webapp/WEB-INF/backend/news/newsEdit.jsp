<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新闻修改</title>
</head>
<body>
<%@include file="../../common/header.jsp"%>
<br><br>
<div class="container">
    <%--  左侧  --%>
    <%@include file="../../common/leftBar.jsp"%>
    <%--  右侧  --%>
    <div class="col-md-8">
        <h2>新闻修改</h2>
        <hr>
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-md-2 control-label">新闻类型</label>
                <div class="col-md-10">
                    <input type="text" value="一般新闻" disabled>
                </div>
            </div>
            <div class="form-group">
                <label for="title" class="col-md-2 control-label">标题</label>
                <div class="col-md-10">
                    <input id="title" type="text" class="form-control" name="title" value="${news.ntitle}">
                </div>
            </div>
            <div class="form-group">
                <label for="topic" class="col-md-2 control-label">主题</label>
                <div class="col-md-2">
                    <select id="topic" class="form-control" name="topic">
                        <option value="">请选择</option>
                        <c:forEach items="${news.topicList}" var="topic">
                            <option value="${topic.tid}"
                                    <c:if test="${topic.tid == news.ntid}">selected</c:if>>${topic.tname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">作者</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="author" value="${news.nauthor}">
                </div>
            </div>
            <div class="form-group" id="contentArea">
                <label for="contents" class="col-md-2 control-label">内容</label>
                <div class="col-md-10">
                    <textarea id="contents" class="form-control" rows="10" name="contents">${news.ncontent}</textarea>
                </div>
            </div>
            <div class="form-group" id="imgArea" hidden>
                <label class="col-md-2 control-label">上传图片</label>
                <div class="col-md-10">
                    <div class="imgArea">
                        <ul class="list">
                            <li class="file">
                                <!-- multiple这个属性可以实现文件选择框的多选 -->
                                <input type="file" name="file" id="file" multiple />
                            </li>
                        </ul>
                    </div>
                    *最多可上传四张，上传过多则会过滤所超出部分
                </div>
            </div>
            <input value="${news.nid}" id="newsId" hidden>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <button type="button" class="btn btn-lg btn-primary" onclick="modifyNews()">修改</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
