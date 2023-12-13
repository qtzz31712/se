<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="isEmpty" value="${empty classInfoVos}" />
<div class="all_class">
    <c:choose>
        <c:when test="${not isEmpty}">
            <table>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>강의 제목</th>
                    <th>강사</th>
                    <th>개설 일자</th>
                    <th>수강 신청 가능 여부</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${classInfoVos}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td><a href="${pageContext.request.contextPath}/instructor/class/classInfoDetail?cls_no=${item.cls_no}">${item.cls_title}</a></td>
                        <td>${item.instructorMemberVo.t_name}</td>
                        <td>${item.cls_reg_date}</td>
                        <td>
                            <c:choose>
                                <c:when test="${item.cls_approval == 1}">
                                    <p>수강 신청 가능</p>
                                    <a href="${pageContext.request.contextPath}/user/class/registerClassForm?cls_no=${item.cls_no}"> 수강 신청하기 </a>
                                </c:when>
                                <c:otherwise>
                                    <p>수강 신청 불가</p>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>개설된 강의가 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>

