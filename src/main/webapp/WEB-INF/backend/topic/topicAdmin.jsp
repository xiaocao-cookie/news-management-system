<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主题管理</title>
</head>
<body>
<%@include file="../../common/header.jsp"%>
<br><br>
<div class="container">
    <%--  左侧  --%>
    <%@include file="../../common/leftBar.jsp"%>
    <%--  右侧  --%>
    <div class="col-md-8" id="rightTopicPart">
        <h2>主题管理</h2>
        <hr>
        <!-- 右侧数据标签页   -->
        <ul class="nav nav-tabs">
            <li class="active"><a href="#topicListPane" data-toggle="tab" id="topicListNav">主题列表</a></li>
            <li><a href="#addTopicModal" data-toggle="modal" data-target="#addTopicModal" id="topicAddNav">主题添加</a></li>
        </ul>
        <!-- 标签页所对应的具体内容   -->
        <div class="tab-content">
            <!--  主题列表的面板显示   -->
            <div class="tab-pane active" id="topicListPane">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="text-center">
                            <form class="form-inline">
                                <div class="form-group">
                                    <label for="topicName">主题名</label>
                                    <input type="text" class="form-control" id="topicName">
                                </div>
                                <div class="form-group">
                                    <input type="button" class="btn btn-primary" value="查询">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-10 col-md-offset-1">
                            <table class="table table-hover table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th><center>编号</center></th>
                                    <th><center>主题名</center></th>
                                    <th><center>操作</center></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${topicList}" var="topic">
                                    <tr style="margin-left: auto">
                                        <td><center>${topic.tid}</center></td>
                                        <td><center>${topic.tname}</center></td>
                                        <td>
                                            <center>
                                                <button class="btn btn-primary" type="button">修改</button>
                                                <button class="btn btn-primary" type="button">删除</button>
                                            </center>
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
            <!--  主题添加的模态框显示   -->
            <div class="modal fade" id="addTopicModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3>添加主题</h3>
                        </div>
                        <div class="col-md-7 col-md-offset-2">
                            <div class="modal-body">
                                <form class="form-inline" method="post" action="${ctx}/topic/addTopicName">
                                    <div class="form-group">
                                        <label for="addTopicName">主题名</label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="text" class="form-control" id="addTopicName" name="addTopicName">
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary" style="margin-left: 220px">提交</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <hr hidden>
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
