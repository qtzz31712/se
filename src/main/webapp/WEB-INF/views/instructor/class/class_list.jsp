<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<c:set var="isEmpty" value="${empty classInfoVos}" />

<div class="myClassList">
    <c:choose>
        <c:when test="${not isEmpty}">
            <table>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>강의 제목</th>
                    <th>개설 일자</th>
                    <th>정보 수정</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${classInfoVos}"  varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td><a href="${pageContext.request.contextPath}/instructor/class/detailClassInfo">${item.cls_title}</a></td>
                        <td>${item.cls_reg_date}</td>
                        <td><a href="/instructor/class/modifyClassForm">정보 수정</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>개설한 강의가 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>