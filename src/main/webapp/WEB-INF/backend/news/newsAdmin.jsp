<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新闻管理</title>
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
            <li class="active"><a href="#newsListPane" data-toggle="tab" id="newsListNav">新闻列表</a></li>
            <li><a href="#addNewsModal" data-toggle="modal" data-target="#addNewsModal" id="newsAddNav">新闻添加</a></li>
        </ul>
        <!-- 标签页所对应的具体内容   -->
        <div class="tab-content">
            <!--  新闻列表面板的显示  -->
            <div class="tab-pane active" id="newsListPane">
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
                            <c:forEach items="${newsList}" var="temp">
                                <tr>
                                    <td id="nid">${temp.nid}</td>
                                    <td id="ntitle" style="width: 400px">
                                          <a href="${ctx}/news/queryNewsDetails?id=${temp.nid}">${temp.ntitle}</a>
                                    </td>
                                    <td class="text-center" id="nauthor" style="width: 100px">${temp.nauthor}</td>
                                    <td>
                                        <button class="btn btn-primary" type="button" id="modifyNews">修改</button>
                                        <button class="btn btn-primary" type="button" id="deleteNews">删除</button>
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
            <!--  新闻添加  -->
            <div class="modal fade" id="addNewsModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3>添加新闻</h3>
                        </div>
                        <div class="col-md-8 col-md-offset-3">
                            <div class="modal-body">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="title">新闻标题</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="form-control" id="title">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label for="content">新闻内容</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="form-control" id="content">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label for="picture">相关图片</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="file" class="form-control" id="picture">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label for="author">撰写人</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="form-control" id="author">
                                    </div>
                                    <br><br>
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
