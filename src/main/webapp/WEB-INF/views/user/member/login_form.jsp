<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-11-28
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <script type="text/javascript">

        function loginForm() {
            console.log('loginForm() CALLED!!');

            let form = document.login_form;

            if (form.u_id.value == '') {
                alert('아이디를 입력하세요.');
                form.u_id.focus();

            } else if (form.u_pw.value == '') {
                alert('비밀번호를 입력하세요.');
                form.u_pw.focus();

            } else {
                form.submit();

            }

        }

    </script>
</head>
<body>
<section>
    <form action="${pageContext.request.contextPath}/user/member/loginConfirm" name="login_form" method="post">
        <input type="hidden"	name="loginType" value="">
    <div>
        <input type="text"		name="u_id" 		placeholder="아이디를 입력하세요."> <br>
        <input type="password"	name="u_pw" 		placeholder="비밀번호를 입력하세요."> <br>
    </div>
    <input type="button"	value="로그인" onclick="loginForm();">
    </form>
</section>
</body>
</html>
