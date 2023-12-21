<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<c:set var="isEmpty" value="${empty registerClassVos}" />
<div class="enrolledUserList">
    <c:choose>
        <c:when test="${not isEmpty}">
            <table>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>수강신청 날짜</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${registerClassVos}"  varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${item.userMemberVo.u_name}</td>
                        <td>${item.userMemberVo.u_mail}</td>
                        <td>${item.rc_reg_time}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>수강중인 인원이 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>