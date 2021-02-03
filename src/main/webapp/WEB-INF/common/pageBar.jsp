<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<nav aria-label="Page navigation">
    <c:if test="${pager.pageCount >= 1}">
        <ul class="pagination">
            <li><a href="${ctx}/${pager.url}?currentPage=1">首页</a></li>
            <c:if test="${pager.currentPage > 1}">
                <li>
                    <a href="${ctx}/${pager.url}?currentPage=${pager.currentPage-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach var="temp" begin="${pager.currentPage>3?pager.currentPage-3:1}" end="${pager.pageCount-pager.currentPage>3?pager.currentPage+3:pager.pageCount}">
                <c:if test="${pager.currentPage==temp}">
                    <li>
                        <a href="${ctx}/${pager.url}?currentPage=${temp}" class="cur">${temp}</a>
                    </li>
                </c:if>
                <c:if test="${pager.currentPage!=temp}">
                    <li>
                        <a href="${ctx}/${pager.url}?currentPage=${temp}">${temp}</a>
                    </li>
                </c:if>
            </c:forEach>
            <c:if test="${pager.currentPage < pager.pageCount}">
                <li>
                    <a href="${ctx}/${pager.url}?currentPage=${pager.currentPage+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
            <li><a href="${ctx}/${pager.url}?currentPage=${pager.pageCount}">末页</a></li>
        </ul>
    </c:if>
    <c:if test="${pager.pageCount == 0}">
        暂无记录
    </c:if>
</nav>
