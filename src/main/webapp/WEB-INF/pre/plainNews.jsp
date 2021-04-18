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
        <!-- 左侧广告显示区域 -->
        <div class="col-md-3">
            <a href="http://www.gov.cn/zhuanti/2021qglh/index.htm" target="_blank"><img src="${ctx}/statics/img/leftPicture.jpg"></a>
            <br><br><br>
            <img src="${ctx}/statics/img/leftPicture2.jpg">
        </div>
        <!-- 中间新闻显示区域  -->
        <div class="col-md-6">
            <div class="text-center" style="font-size: 25px;font-weight: bolder">${plainNews.ntitle}</div>
            <div class="text-center" style="color: gray">
                <fmt:formatDate value="${plainNews.NCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </div>
            <br><br>
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${plainNews.ncontent}
            </div><br>
            <div class="col-md-6 col-md-offset-7">
                <span style="color: gray">责任编辑：${plainNews.nauthor}</span>
            </div>

            <hr style="border-top: 2px solid #2aabd2"/><br>
            <%--  评论区   --%>
            <form class="form-horizontal">
                <input hidden id="cAuthorId" value="${sessionScope.loginUser.uid}">
                <input hidden id="cnid" value="${plainNews.nid}">
                <textarea id="cContent" class="form-control" rows="3" placeholder="请输入评论内容。。。"></textarea><br>
                <div class="col-md-4 col-md-offset-8">
                    <button type="button" id="commentsSubmit" class="form-control btn btn-info" onclick="addComment()">发表评论</button>
                </div>
            </form><br><br><br>
            <span style="font-size: 20px;border-left: 5px solid deepskyblue">相关评论</span>
            <c:if test="${commentList.size() != 0}">
                <table class="table table-hover" id="commentsTable">
                    <tbody>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <%--  一级评论  --%>
                            <td>评论内容：${comment.ccontent}<br><br><br>
                                <c:forEach items="${comment.userList}" var="temp">
                                    评论人：<font style="color: #0092FF;font-size: 20px">${temp.loginName}</font><br>
                                    <input hidden id="author${comment.cid}" value="${temp.loginName}">
                                </c:forEach>
                                评论时间：<fmt:formatDate value="${comment.cdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <div class="col-md-3 col-md-offset-11">
                                    <button class="btn btn-primary" type="button" id="reply" onclick="toReply(this,${comment.cid})">回复</button>
                                    <button class="btn btn-danger" type="button" id="cancelReply" onclick="toCancelReply(this,${comment.cid})"
                                            style="display: none;position: relative;left: -110px;top: -34px">取消回复</button>
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
                                            <div style="margin-left: 300px">
                                                <fmt:formatDate value="${reply.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </div><br>
                                            <div>
                                                <button style="position: relative;left: 465px" class="btn btn-primary" type="button" id="reply2" onclick="toReply2(this,${reply.id})">回复</button>
                                                <button class="btn btn-danger" type="button" id="cancelReply2" onclick="toCancelReply2(this,${reply.id})"
                                                        style="display: none;position: relative;left: 310px">取消回复</button>
                                            </div><br/>
                                            <%-- 三级评论 --%>
                                            <c:forEach items="${reply.replyList}" var="reply2">
                                                <div style="background-color: white;border: 1px solid darkgrey">
                                                    <c:forEach items="${reply2.userList}" var="user2">
                                                        <font style="color: #FF6935;font-size: 20px;margin-left: 20px">${user2.loginName}</font>
                                                    </c:forEach>
                                                    ： ${reply2.content}<br/>
                                                    <div style="margin-left: 300px">
                                                        <fmt:formatDate value="${reply2.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/><br>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <hr style="color: whitesmoke"/>
                                            <form class="form-horizontal" id="replyForm2${reply.id}" hidden>
                                                <input hidden id="rAuthor2${reply.id}" value="${sessionScope.loginUser.uid}">
                                                <textarea style="width: 500px;margin-left: 20px" id="contents2${reply.id}" class="form-control" rows="3"></textarea><br>
                                                <div class="col-md-4 col-md-offset-8">
                                                    <button type="button" id="replySubmit2" class="form-control btn btn-info" onclick="replyComment2(${reply.id})">评论</button>
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
            <c:if test="${commentList.size() == 0}">
                <hr style="border-top: 2px solid gray"/>
                <div class="text-center" style="font-size: 15px">
                    暂无他人评论
                </div><hr style="border-top: 2px solid gray"/>
                <br><br>
            </c:if>
        </div>
        <!-- 右侧推荐显示区域 -->
        <div class="col-md-3">
            <span id="hotRecommend">|热门推荐</span><br>
            <div>
                <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews1.pid}">
                   <img style="height: 100px;width: 200px;" src="${ctx}/statics/img/${pictureNews1.PPicPath1}">
                </a>
            </div>
            <div>${pictureNews1.ptitle.substring(0,8)}...</div>
            <div>
                <a href="${ctx}/news/queryPicNewsDetails?id=${pictureNews2.pid}">
                    <img style="height: 100px;width: 200px;" src="${ctx}/statics/img/${pictureNews2.PPicPath1}">
                </a>
            </div>
            <div>${pictureNews2.ptitle.substring(0,8)}...</div>
            <br><br>
            <span id="headline">|头条新闻</span><br><br>
            <div class="col-md-10">
                <c:forEach items="${hotNews}" var="temp">
                    <span class="glyphicon glyphicon-fire" style="color: red"></span>
                    <a href="${ctx}/news/queryNewsDetails?id=${temp.nid}" id="hotNews">
                        ${temp.ntitle}
                    </a>¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
                    <br>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
</body>
</html>
