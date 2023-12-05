<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="pj.third.se.vo.user.UserMemberVo"%>
<%@ page import="pj.third.se.vo.instructor.InstructorMemberVo" %>

<header>
    <div id="header_wrap">
        <div class="logo">
            <a href="<c:url value='/'/>" class="로고"><img
                    src="<c:url value='/resources/image/common/gj_final.png' />" alt="logo"></a>
        </div>
        <div class="checklogin">
            <c:choose>
                <c:when test="${not empty loginedUserMemberVo}">
                    <% UserMemberVo loginedUserMemberVo = (UserMemberVo) session.getAttribute("loginedUserMemberVo"); %>
                    <c:set var="userid" value="${loginedUserMemberVo != null ? loginedUserMemberVo.getU_id() : ''}" />
                    <c:if test="${not empty userid}">
                        ${userid}님 어서오세요!
                    </c:if>
                    <div class="checklogin">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/user/member/logoutConfirm">로그아웃</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/member/myInfo?u_no=${loginedUserMemberVo != null ? loginedUserMemberVo.getU_no() : ''}">나의 정보(회원)</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:when test="${not empty loginedInstructorMemberVo}">
                    <% InstructorMemberVo loginedInstructorMemberVo = (InstructorMemberVo) session.getAttribute("loginedInstructorMemberVo"); %>
                    <c:set var="insid" value="${loginedInstructorMemberVo != null ? loginedInstructorMemberVo.getT_id() : ''}" />
                    <c:if test="${not empty insid}">
                        ${insid}님 어서오세요!
                    </c:if>
                    <div class="checklogin">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/instructor/member/logoutConfirm">로그 아웃</a></li>
                            <li><a href="${pageContext.request.contextPath}/instructor/member/myInfo?t_no=${loginedInstructorMemberVo != null ? loginedInstructorMemberVo.getT_no() : ''}">나의 정보(강사)</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="checklogin">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/loginForm">로그인</a></li>
                            <li><a href="${pageContext.request.contextPath}/join">회원 가입</a></li>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>
