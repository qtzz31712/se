<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-23
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pj.third.se.vo.user.UserMemberVo" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>

<section>
    <div id="section_wrap">
        <div class="word">
            <h3>나의 정보 수정</h3>
        </div>
        <div class="modify_account_form">
            <form action="${pageContext.request.contextPath}/instructor/member/modifyAccountConfirm"
                  name="modify_account_form" method="post">
                <div><p>아이디</p><input type="text" name="t_id" placeholder="아이디를 입력하세요."
                                      value="${instructorMemberVos.t_id}"> <br></div>
                <p id="idable"></p>
                <div><p>이름</p><input type="text" name="t_name" placeholder="이름을 입력하세요."
                                     value="${instructorMemberVos.t_name}"> <br></div>
                <div><p>이메일</p><input type="email" name="t_mail" placeholder="이메일을 입력하세요."
                                      value="${instructorMemberVos.t_mail}"><br></div>
                <div><p>휴대폰 번호</p><input type="text" name="t_phone" placeholder="휴대폰 번호 '-'제외하고 입력하세요."
                                         value="${instructorMemberVos.t_phone}"> <br></div>
                <div><p>담당 과목</p><input type="text" name="t_part" placeholder="담당과목을 입력하세요."
                                        value="${instructorMemberVos.t_part}"> <br></div>
            <button type="submit">수정 완료</button>
            </form>

        </div>
    </div>

</section>
</body>
</html>
