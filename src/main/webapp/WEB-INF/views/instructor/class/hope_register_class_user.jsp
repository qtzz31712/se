<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<c:set var="isEmpty" value="${empty registerClassVos}" />
<div class="hope_register_user">
<c:choose>
    <c:when test="${not isEmpty}">
        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>강의 제목</th>
                <th>개설 일자</th>
                <th>희망 인원</th>
                <th>신청서 제출 일자</th>
                <th>승인 여부</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${registerClassVos}"  varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${item.classInfoVo.cls_title}</td>
                    <td>${item.classInfoVo.cls_reg_date}</td>
                    <td><a href="${pageContext.request.contextPath}/instructor/class/registerUserDetail?rc_no=${item.rc_no}">${item.userMemberVo.u_name}</a></td>
                    <td >${item.rc_reg_time}</td>
                    <td><c:choose>
                        <c:when test="${item.rc_approval == 1}">
                            <p>승인 완료</p>
                        </c:when>
                        <c:when test="${item.rc_approval == 0}">
                            <p>승인 거절</p>
                        </c:when>
                        <c:otherwise>
                            <p>승인 대기중</p>
                        </c:otherwise>
                    </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p>수강 신청한 인원이 없습니다.</p>
    </c:otherwise>
</c:choose>

</div>

