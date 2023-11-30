<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-23
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pj.third.se.Vo.member.UserMemberVo"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>나의 정보</h3>
        </div>

        <div class="modify_account_form">
            <form action="${pageContext.request.contextPath}/se/user/member/modifyAccountConfirm" name="modify_account_form" method="post">
                <input type="hidden" name="u_no" value="${userMemberVos.u_no}">
                <div><p>아이디</p><input type="text" name="u_id" value="${userMemberVos.u_id}" readonly></div>
                <div><p>비밀 번호</p><input type="password" name="u_pw" value="${userMemberVos.u_pw}"> </div>
                <div><p>이름</p><input type="text" name="u_name" value="${userMemberVos.u_name}"> </div>
                <div><p>성별</p>
                    <select name="u_gender" disabled>
                        <option value="">성별을 입력 하세요</option>
                        <option value="M"  ${userMemberVos.u_gender == 'M' ? 'selected' : ''}>Man</option>
                        <option value="W"  ${userMemberVos.u_gender == 'W' ? 'selected' : ''}>Woman</option>
                    </select>
                    <div><p>이메일</p><input type="email" name="u_mail"	value="${userMemberVos.u_mail}"></div>
                    <div><p>휴대폰 번호</p><input type="text" name="u_phone"	value="${userMemberVos.u_phone}"></div>
                    <div><p>생년 월일</p><input type="date" name="u_birth"	value="${userMemberVos.u_birth}"></div>
                </div>
                <button type="submit">수정 하기</button>
            </form>

        </div>

        <%-- <div class="login">
            <a href="<c:url value='/user/member/loginForm' />">login</a>
        </div> --%>

    </div>

</section>
</body>
</html>
