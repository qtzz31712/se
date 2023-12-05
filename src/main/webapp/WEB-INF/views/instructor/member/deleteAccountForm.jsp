<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-29
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 탈퇴</title>

</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<section>
    <h1>정말로 회원을 탈퇴하시겠습니까?</h1>
    <a class="delete_account" href="${pageContext.request.contextPath}/instructor/member/deleteAccountConfirm?u_no=${loginedInstructorMemberVo.t_no}">회원 탈퇴</a>
</section>
</body>
</html>
