<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>新闻添加</title>
</head>
<body>
<%@include file="../../common/header.jsp"%>
<br><br>
<div class="container">
    <%--  左侧  --%>
    <%@include file="../../common/leftBar.jsp"%>
    <%--  右侧  --%>
    <div class="col-md-8">
        <h2>新闻添加</h2>
        <hr>
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-md-2 control-label">新闻类型</label>
                <div class="col-md-10">
                    <label class="radio-inline">
                        <input type="radio" name="newsType" value="1" checked> 一般新闻
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="newsType" value="2"> 图片新闻
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="title" class="col-md-2 control-label">标题</label>
                <div class="col-md-10">
                    <input type="text" name="title" class="form-control" id="title" placeholder="最长不能超过50个字符">
                </div>
            </div>
            <div class="form-group">
                <label for="topic" class="col-md-2 control-label">主题</label>
                <div class="col-md-2">
                    <select class="form-control" id="topic">
                        <option value="">请选择</option>
                        <c:forEach items="${topicList}" var="topic">
                            <option value="${topic.tid}">${topic.tname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="author" class="col-md-2 control-label">作者</label>
                <div class="col-md-4">
                    <input type="text" name="author" class="form-control" id="author">
                </div>
            </div>
            <div class="form-group" id="contentArea">
                <label for="contents" class="col-md-2 control-label">内容</label>
                <div class="col-md-10">
                    <textarea class="form-control" rows="3" placeholder="内容不可空" id="contents"></textarea>
                </div>
            </div>
            <div class="form-group" id="contentArea1" hidden>
                <label for="contentOne" class="col-md-2 control-label">内容1</label>
                <div class="col-md-10">
                    <textarea class="form-control" rows="3" placeholder="四个内容可以不全部输入，但是必须有一个有内容，内容顺序尽量与图片顺序对应" id="contentOne"></textarea>
                </div>
            </div>
            <div class="form-group" id="contentArea2" hidden>
                <label for="contentTwo" class="col-md-2 control-label">内容2</label>
                <div class="col-md-10">
                    <textarea class="form-control" rows="3" placeholder="四个内容可以不全部输入，但是必须有一个有内容，内容顺序尽量与图片顺序对应" id="contentTwo"></textarea>
                </div>
            </div>
            <div class="form-group" id="contentArea3" hidden>
                <label for="contentThree" class="col-md-2 control-label">内容3</label>
                <div class="col-md-10">
                    <textarea class="form-control" rows="3" placeholder="四个内容可以不全部输入，但是必须有一个有内容，内容顺序尽量与图片顺序对应" id="contentThree"></textarea>
                </div>
            </div>
            <div class="form-group" id="contentArea4" hidden>
                <label for="contentFour" class="col-md-2 control-label">内容4</label>
                <div class="col-md-10">
                    <textarea class="form-control" rows="3" placeholder="四个内容可以不全部输入，但是必须有一个有内容，内容顺序尽量与图片顺序对应" id="contentFour"></textarea>
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
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <button type="button" class="btn btn-lg btn-primary" onclick="addNews()">添加</button>
                    <button type="reset" class="btn btn-lg btn-danger">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $("input[type='radio'][name='newsType']").change(function () {
        if (this.value == 1){
            $("#contentArea").show();
            $("#contentArea1").hide();
            $("#contentArea2").hide();
            $("#contentArea3").hide();
            $("#contentArea4").hide();
            $("#imgArea").hide();
        }else if (this.value == 2){
            $("#contentArea").hide();
            $("#contentArea1").show();
            $("#contentArea2").show();
            $("#contentArea3").show();
            $("#contentArea4").show();
            $("#imgArea").show();
        }
    })
</script>
</body>
</html>
