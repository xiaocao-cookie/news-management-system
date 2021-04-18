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
    <title>微新闻</title>
</head>
<body>
<%@include file="../common/header.jsp"%>
<div class="container">
    <!-- 主体新闻 -->
    <div class="row">
        <!-- 左侧新闻显示区域 -->
        <div class="col-md-8">
            <div class="text-center" style="font-size: 25px;font-weight: bolder">${pictureNews.ptitle}</div>
            <div class="text-center" style="color: gray">
                <fmt:formatDate value="${pictureNews.PCreateDate}" pattern="yyyy-MM-dd"/>
            </div><br><br>
            <c:if test="${pictureNews.PPicPath1 != null && pictureNews.pcontent1 != null}">
                <div class="text-center">
                    <%-- 图片显示  --%>
                    <img src="${ctx}/statics/img/${pictureNews.PPicPath1}" style="width: 700px"/><br>
                </div>
                <%-- 显示内容  --%>
                <span id="content1">${pictureNews.pcontent1}</span><br><br>
            </c:if>
            <c:if test="${pictureNews.PPicPath2 != null && pictureNews.pcontent2 != null}">
                <div class="text-center">
                    <%-- 图片显示  --%>
                    <img src="${ctx}/statics/img/${pictureNews.PPicPath2}" style="width: 700px"/><br>
                </div>
                <%-- 显示内容  --%>
                <span id="content2">${pictureNews.pcontent2}</span><br><br>
            </c:if>
            <c:if test="${pictureNews.PPicPath3 != null && pictureNews.pcontent3 != null}">
                <div class="text-center">
                    <%-- 图片显示 --%>
                    <img src="${ctx}/statics/img/${pictureNews.PPicPath3}" style="width: 700px"/><br>
                </div>
                <%-- 显示内容  --%>
                <span id="content3">${pictureNews.pcontent3}</span><br><br>
            </c:if>
            <span style="color: gray">责任编辑：${pictureNews.pauthor}</span>
            <br><hr style="border-top: 2px solid #2aabd2"/><br><br><br>
            <%--  评论区   --%>
            <div class="row">
                <form class="form-horizontal">
                    <input hidden id="cAuthorId" value="${sessionScope.loginUser.uid}">
                    <input hidden id="cpid" value="${pictureNews.pid}">
                    <div class="form-group">
                        <textarea class="form-control" id="cContent" rows="3" style="width: 779px;margin-left: 16px;height: 94px;" placeholder="请输入评论内容。。。"></textarea>
                    </div>
                    <div class="form-group">
                        <div class="col-md-2 col-md-offset-10">
                            <button type="button" class="form-control btn btn-info" onclick="addPicComment()">发表评论</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row">
                <c:if test="${pictureNews.commentList.size() != 0}">
                    <table class="table table-hover" id="commentsTable">
                        <tbody>
                        <c:forEach items="${pictureNews.commentList}" var="comment">
                            <tr>
                                <td>评论内容：${comment.ccontent}<br><br><br>
                                    <c:forEach items="${comment.userList}" var="user">
                                        评论人：${user.loginName}<br>
                                        <input hidden id="author${comment.cid}" value="${user.loginName}">
                                    </c:forEach>
                                    评论时间：
                                    <fmt:formatDate value="${comment.cdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                    <div class="col-md-3 col-md-offset-11">
                                        <button class="btn btn-primary" type="button" id="reply" onclick="toReply(this,${comment.cid})">回复</button>
                                        <button class="btn btn-danger" type="button" id="cancelReply" onclick="toCancelReply(this,${comment.cid})"
                                                style="display: none;position: relative;left: -170px;">取消回复</button><br/><br>
                                    </div>
                                    <%--  二级评论  --%>
                                    <c:if test="${comment.replyList.size() != 0}">
                                        <br><br><br>
                                        <c:forEach items="${comment.replyList}" var="reply">
                                            <div style="background-color: rgb(180, 180, 180)">
                                                <c:forEach items="${reply.userList}" var="user">
                                                    <font style="color: #FF6935;font-size: 20px">${user.loginName}</font>回复
                                                    <input hidden id="reAuthor${reply.id}" value="${user.loginName}">
                                                </c:forEach>
                                                ：  ${reply.content}<br>
                                                <div style="margin-left: 600px">
                                                    <fmt:formatDate value="${reply.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                </div><br>
                                                <div>
                                                    <button style="position: relative;left: 650px" class="btn btn-primary" type="button" id="reply2" onclick="toReply2(this,${reply.id})">回复</button>
                                                    <button class="btn btn-danger" type="button" id="cancelReply2" onclick="toCancelReply2(this,${reply.id})"
                                                            style="display: none;position: relative;left: 500px">取消回复</button>
                                                </div><br/>
                                                <%-- 三级评论 --%>
                                                <c:forEach items="${reply.replyList}" var="reply2">
                                                    <div style="background-color: white;border: 1px solid darkgrey">
                                                        <c:forEach items="${reply2.userList}" var="user2">
                                                            <font style="color: #FF6935;font-size: 20px;margin-left: 20px">${user2.loginName}</font>
                                                        </c:forEach>
                                                        ： ${reply2.content}<br/>
                                                        <div style="margin-left: 600px">
                                                            <fmt:formatDate value="${reply2.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <hr style="color: whitesmoke"/>
                                                <form class="form-horizontal" id="replyForm2${reply.id}" hidden>
                                                    <input hidden id="rAuthor2${reply.id}" value="${sessionScope.loginUser.uid}">
                                                    <textarea style="width: 700px;margin-left: 20px" id="contents2${reply.id}" class="form-control" rows="3"></textarea><br>
                                                    <div class="col-md-4 col-md-offset-8">
                                                        <button style="position: relative;left: -50px" type="button" id="replySubmit2" class="form-control btn btn-info" onclick="replyComment2(${reply.id})">评论</button>
                                                    </div>
                                                    <br><br><br>
                                                </form>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <br>
                                    <form class="form-horizontal" id="replyForm${comment.cid}" hidden>
                                        <input hidden id="rAuthor${comment.cid}" value="${sessionScope.loginUser.uid}">
                                        <textarea id="contents${comment.cid}" class="form-control" rows="3"></textarea><br>
                                        <div class="col-md-4 col-md-offset-8">
                                            <button type="button" id="replySubmit" class="form-control btn btn-info" onclick="replyComment(${comment.cid})">评论</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${pictureNews.commentList.size() == 0}">
                    <hr style="border-top: 2px solid gray"/>
                    <div class="text-center" style="font-size: 15px">
                        暂无他人评论
                    </div><hr style="border-top: 2px solid gray"/>
                    <br><br>
                </c:if>
            </div>
        </div>
        <!-- 右侧推荐 -->
        <div class="col-md-4">
            <span id="otherRecommand">|其他推荐</span><br><br>
            <div class="row">
                <div class="col-md-5">
                    <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews1.pid}">
                        <img style="margin-left:20px;width: 150px;height: 100px;" src="${ctx}/statics/img/${pictureNews1.PPicPath1}">
                    </a>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5" id="otherContent1">
                    <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews1.pid}">${pictureNews1.pcontent1.substring(0,20)}...</a>
                </div>
            </div><br>
            <div class="row">
                <div class="col-md-5" id="otherContent2" style="margin-left: 5px;padding-left: 40px;padding-right: 0">
                    <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews2.pid}">${pictureNews2.pcontent1.substring(0,20)}...</a>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews2.pid}">
                        <img style="width: 150px;height: 100px;" src="${ctx}/statics/img/${pictureNews2.PPicPath1}">
                    </a>
                </div>
            </div><br>
            <div class="row">
                <div class="col-md-5">
                    <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews3.pid}">
                        <img style="margin-left:20px;width: 150px;height: 100px;" src="${ctx}/statics/img/${pictureNews3.PPicPath1}">
                    </a>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5" id="otherContent3">
                    <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews3.pid}">${pictureNews3.pcontent1.substring(0,20)}...</a>
                </div>
            </div>
            <br><br><br>
            <span id="headline">|头条新闻</span><br><br>
            <c:forEach items="${hotNews}" var="temp">
                <span class="glyphicon glyphicon-fire" style="color: red"></span>
                <a href="${ctx}/news/queryNewsDetails?id=${temp.nid}" id="hotNews">
                        ${temp.ntitle}
                </a>
                <br>
            </c:forEach>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>