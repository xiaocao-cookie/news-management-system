<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图片新闻列表</title>
</head>
<body>
<%@include file="../../common/header.jsp"%>
<br><br>
<div class="container">
    <%--  左侧  --%>
    <%@include file="../../common/leftBar.jsp"%>
    <%--  右侧  --%>
    <div class="col-md-8" id="rightNewsPart">
        <h2>新闻管理</h2>
        <hr>
        <!-- 右侧数据标签页   -->
        <ul class="nav nav-tabs">
            <li><a href="#newsListPane" data-toggle="tab" id="newsListNav">新闻列表</a></li>
            <li class="active"><a href="#pictureNewsListPane" data-toggle="tab" id="pictureNewsListNav">图片新闻</a></li>
        </ul>
        <!-- 标签页所对应的具体内容   -->
        <div class="tab-content">
            <!--  图片新闻列表面板的显示  -->
            <div class="tab-pane active" id="pictureNewsListPane">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        新闻列表
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover table-striped table-bordered">
                            <thead>
                            <tr>
                                <th class="text-center">编号</th>
                                <th class="text-center">新闻标题</th>
                                <th class="text-center">作者</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pictureNewsList}" var="temp">
                                <tr>
                                    <td id="pid">${temp.pid}</td>
                                    <td id="ptitle" style="width: 400px">
                                        <a href="${ctx}/news/queryPicNewsDetails?id=${temp.pid}" style="color: #284156;background-color: white">${temp.ptitle}</a>
                                    </td>
                                    <td class="text-center" id="pauthor" style="width: 100px">${temp.pauthor}</td>
                                    <td>
                                        <a href="${ctx}/news/toModifyNews?newsType=2&pid=${temp.pid}" style="background-color: whitesmoke" >
                                            <button class="btn btn-primary" type="button">修改</button>
                                        </a>
                                        <button class="btn btn-primary" type="button" id="deletePictureNews" onclick="delPictureNews(${temp.pid});">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <center>
                            <%@include file="../../common/pageBar.jsp"%>
                        </center>
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
