<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-23
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pj.third.se.vo.user.UserMemberVo"%>
<%@ page import="pj.third.se.vo.instructor.InstructorMemberVo" %>
<nav>
    <a href="${pageContext.request.contextPath}/instructor/class/createClassForm">강의등록(강사)</a>
    <a href="${pageContext.request.contextPath}/instructor/class/myClassList?cls_t_no=${loginedInstructorMemberVo.getT_no()}">내가 등록한 강의(강사)</a>
    <a href="${pageContext.request.contextPath}/user/class/allClassList">전체 강의(전체)</a>
    <a href="${pageContext.request.contextPath}/user/class/registerClassList?u_no=${lodinedUserMemverVo.getU_no()}&message=">수강 신청 목록(회원)</a>
    <a href="${pageContext.request.contextPath}/instructor/class/hopeRegisterClassUser?t_no=${loginedInstructorMemberVo.getT_no()}">수강 희망 인원 (강사)</a>

</nav>