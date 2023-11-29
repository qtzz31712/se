<jsp:useBean id="UserMemberVos" scope="request" type=""/>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-29
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>나의 정보</title>

</head>
<body>
<jsp:useBean id="userMemberVos" scope="request" type="java.util.List"/>
<jsp:include page="../../common/header.jsp"/>
<div class="my_account_form">

        <form action="${pageContext.request.contextPath}/user/member/createAccountConfirm" name="create_account_form" method="post">
            <input type="hidden" name="u_no" value="${UserMemberVos.u_no}">
            <div><p>아이디</p><input type="text" name="u_id" value="${UserMemberVos.u_id}" readonly></div>
            <p id="idable"></p>
            <div><p>비밀번호</p><input type="password" name="u_pw" value="${UserMemberVos.u_pw}" readonly> </div>
            <div><p>이름</p><input type="text" name="u_name" value="${UserMemberVos.u_name}" readonly> </div>
            <div><p>성별</p>
                <select name="u_gender" disabled>
                    <option value="">성별을 입력 하세요</option>
                    <option value="M"  ${UserMemberVos.u_gender == 'M' ? 'selected' : ''}>Man</option>
                    <option value="W"  ${UserMemberVos.u_gender == 'W' ? 'selected' : ''}>Woman</option>
                </select>
                <div><p>이메일</p><input type="email" name="u_mail"	value="${UserMemberVos.u_mail}" readonly></div>
                <div><p>휴대폰 번호</p><input type="text" name="u_phone"	value="${UserMemberVos.u_phone}" readonly></div>
                <div><p>생년 월일</p><input type="text" name="u_birth"	value="${UserMemberVos.u_birth}" readonly></div>
            </div>
        </form>


    <a class="modify_account" href="${pageContext.request.contextPath}/user/member/modifyAccountForm?u_no=${UserMemberVos.u_no}">정보 수정</a>
    <a class="modify_account" href="${pageContext.request.contextPath}/user/member/deleteAccountConfirm?u_no=${UserMemberVos.u_no}">회원 삭제</a>
</div>
</body>
</html>
