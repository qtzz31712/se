
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <c:set var="isEmpty" value="${empty registerClassVos}" />
    <div class="register_class_list">
        <c:choose>
            <c:when test="${not isEmpty}">
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>강의 제목</th>
                        <th>강사</th>
                        <th>신청 일자</th>
                        <th>승인 여부</th>
                        <th>신청 취소</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${registerClassVos}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/class/classInfoDetail?cls_no=${item.classInfoVo.cls_no}">
                                        ${item.classInfoVo.cls_title}
                                </a>
                            </td>
                            <td>${item.classInfoVo.instructorMemberVo.t_name}</td>
                            <td>${item.rc_reg_time}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.rc_approval == 1}">
                                        <p>수강 승인</p>
                                    </c:when>
                                    <c:when test="${item.rc_approval == 0}">
                                            <p>수강 거절</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p>승인 대기중</p>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><button type="button" onclick="delete_btn(${item.rc_no})">신청 취소</button></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>수강 신청한 강의가 없습니다.</p>
            </c:otherwise>
        </c:choose>
    </div>

