<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<c:set var="isEmpty" value="${empty chapterVos}" />

<div class="myClassList">
    <c:choose>
    <c:when test="${not isEmpty}">
    <table>
        <thead>
        <tr>
            <th>수업 회차</th>
            <th>수업 제목</th>
            <th>게시 일자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${chapterVos}"  varStatus="loop">
            <tr>
                <td>${item.chap_num}</td>
                <td><a href="${pageContext.request.contextPath}/instructor/class/chapterDetail?chap_no=${item.chap_no}">${item.chap_title}</a></td>
                <td>${item.chap_reg_date}</td>
            </tr>
        </c:forEach>
        </tbody>ㄴ
    </table>
    </c:when>
    <c:otherwise>
    <p>진행중인 수업이 없습니다.</p>
    </c:otherwise>
    </c:choose>
