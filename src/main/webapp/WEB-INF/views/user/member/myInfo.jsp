<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-23
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section>
    <div id="section_wrap">
        <div class="word">
            <h3>나의 정보</h3>
        </div>

        <div class="create_account_form">
            <form action="${pageContext.request.contextPath}/user/member/createAccountConfirm" name="create_account_form" method="post">
                <div><p>아이디</p><input type="text" name="u_id" placeholder="아이디를 입력하세요." readonly></div>
                <p id="idable">${u_id}</p>
                <div><p>비밀번호</p><input type="password" name="u_pw" placeholder="비밀번호를 입력하세요."> ${u_pw}<br></div>
                <div><p>이름</p><input type="text" name="u_name" placeholder="이름을 입력하세요."> ${u_name}<br></div>
                <div><p>성별</p><select name="u_gender">
                    <option value="">성별을 입력하세요</option>
                    <c:if u_gender.value == M>
                    <option value="M">Man</option>
                    <option value="W">Woman</option>
                    <div><p>이메일</p><input type="email" name="u_mail"	placeholder="이메일을 입력하세요." readonly>${u_mail}</div>
                    <div><p>휴대폰 번호</p><input type="text" name="u_phone"	placeholder="휴대폰 번호 '-'제외하고 입력하세요.">${u_phone}</div>
                    <div><p>생년 월일</p><input type="date" name="u_birth"	placeholder="생년월일을 입력하세요.">${u_birth}</div>

                </select> <br></div>
                <input type="button" class ="join" value="수정하기" onclick="modifyAccountForm();">
                <!-- <input type="reset" value="reset"> -->

            </form>

        </div>

        <%-- <div class="login">
            <a href="<c:url value='/user/member/loginForm' />">login</a>
        </div> --%>

    </div>

</section>
</body>
</html>
