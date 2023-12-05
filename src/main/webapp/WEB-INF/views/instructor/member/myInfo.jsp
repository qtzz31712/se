<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-29
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>나의 정보</title>

</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<h3>나의 정보</h3>
<div class="my_account_form">
    <form action="${pageContext.request.contextPath}/instructor/member/createAccountConfirm"
          name="create_account_form" method="post">
        <div><p>아이디</p><input type="text" name="t_id" placeholder="아이디를 입력하세요." value="${instructorMemberVos.t_id}" readonly> <br></div>
        <p id="idable"></p>
        <div><p>이름</p><input type="text" name="t_name" placeholder="이름을 입력하세요." value="${instructorMemberVos.t_name}" readonly> <br></div>
        <div><p>이메일</p><input type="email" name="t_mail" placeholder="이메일을 입력하세요." value="${instructorMemberVos.t_mail}" readonly><br></div>
        <div><p>휴대폰 번호</p><input type="text" name="t_phone" placeholder="휴대폰 번호 '-'제외하고 입력하세요."value="${instructorMemberVos.t_phone}" readonly> <br></div>
        <div><p>담당 과목</p><input type="text" name="t_part" placeholder="담당과목을 입력하세요."value="${instructorMemberVos.t_part}" readonly> <br></div>
    </form>

    <a class="modify_account" href="${pageContext.request.contextPath}/instructor/member/modifyAccountForm?t_no=${instructorMemberVos.t_no}">정보 수정</a>
    <a class="modify_account" href="${pageContext.request.contextPath}/instructor/member/deleteAccountConfirm?t_no=${instructorMemberVos.t_no}">회원 삭제</a>
</div>

</body>
</html>

