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
                    <input type="text" value="图片新闻" disabled>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">标题</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" name="title" value="${pictureNews.ptitle}">
                </div>
            </div>
            <div class="form-group">
                <label for="topic" class="col-md-2 control-label">主题</label>
                <div class="col-md-2">
                    <select id="topic" class="form-control" name="topic">
                        <option value="">请选择</option>
                        <c:forEach items="${pictureNews.topicList}" var="topic">
                            <option value="${topic.tid}"
                                    <c:if test="${topic.tid == pictureNews.ptid}">selected</c:if>>${topic.tname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">作者</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="author" value="${pictureNews.pauthor}">
                </div>
            </div>
            <div class="form-group" id="contentArea1">
                <label for="contentOne" class="col-md-2 control-label">内容1</label>
                <div class="col-md-10">
                    <textarea id="contentOne" class="form-control" rows="5" name="contentOne">${pictureNews.pcontent1}</textarea>
                </div>
            </div>
            <div class="form-group" id="contentArea2">
                <label for="contentTwo" class="col-md-2 control-label">内容2</label>
                <div class="col-md-10">
                    <textarea id="contentTwo" class="form-control" rows="5" name="contentTwo" placeholder="请填写...">${pictureNews.pcontent2}</textarea>
                </div>
            </div>
            <div class="form-group" id="contentArea3">
                <label for="contentThree" class="col-md-2 control-label">内容3</label>
                <div class="col-md-10">
                    <textarea id="contentThree" class="form-control" rows="5" name="contentThree" placeholder="请填写...">${pictureNews.pcontent3}</textarea>
                </div>
            </div>
            <div class="form-group" id="contentArea4">
                <label for="contentFour" class="col-md-2 control-label">内容4</label>
                <div class="col-md-10">
                    <textarea id="contentFour" class="form-control" rows="5" name="contentFour" placeholder="请填写...">${pictureNews.pcontent4}</textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">上传图片</label>
                <div class="col-md-10">
                    <div class="imgArea">
                        <ul class="list">
                            <li>
                                <div class="close">×</div>
                                <img src="${ctx}/statics/img/${pictureNews.PPicPath1}"/>
                            </li>
                            <c:if test="${pictureNews.PPicPath2 != null && pictureNews.PPicPath2 != ''}">
                                <li>
                                    <div class="close">×</div>
                                    <img src="${ctx}/statics/img/${pictureNews.PPicPath2}"/>
                                </li>
                            </c:if>
                            <c:if test="${pictureNews.PPicPath3 != null && pictureNews.PPicPath3 != ''}">
                                <li>
                                    <div class="close">×</div>
                                    <img src="${ctx}/statics/img/${pictureNews.PPicPath3}"/>
                                </li>
                            </c:if>
                            <c:if test="${pictureNews.PPicPath4 != null && pictureNews.PPicPath4 != ''}">
                                <li>
                                    <div class="close">×</div>
                                    <img src="${ctx}/statics/img/${pictureNews.PPicPath4}"/>
                                </li>
                            </c:if>
                            <li class="file">
                                <!-- multiple这个属性可以实现文件选择框的多选 -->
                                <input type="file" name="file" id="file" multiple />
                            </li>
                        </ul>
                    </div>
                    *最多可上传四张，上传过多则会过滤所超出部分
                </div>
            </div>
            <input id="picNewsId" value="${pictureNews.pid}" hidden>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <button type="button" class="btn btn-lg btn-primary" onclick="modifyPicNews()">修改</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>