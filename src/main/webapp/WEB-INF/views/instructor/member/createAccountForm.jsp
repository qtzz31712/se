<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
            integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
            crossorigin="anonymous" referrerpolicy="no-referrer">

    </script>

    <script>
        function createAccountForm() {
            console.log('createAccountForm() CALLED!!');
            let form = document.create_account_form;
            form.submit();
        }
    </script>
</head>
<body>

<section>

    <div id="section_wrap">
        <div class="word">
            <h3>강사 회원가입</h3>
        </div>

        <div class="create_account_form">
            <form action="${pageContext.request.contextPath}/instructor/member/createAccountConfirm"
                  name="create_account_form" method="post">
                <div><p>아이디</p><input type="text" name="t_id" placeholder="아이디를 입력하세요."> <br></div>
                <p id="idable"></p>
                <div><p>비밀번호</p><input type="password" name="t_pw" placeholder="비밀번호를 입력하세요."> <br></div>
                <div><p>이름</p><input type="text" name="t_name" placeholder="이름을 입력하세요."> <br></div>
                <div><p>이메일</p><input type="email" name="t_mail" placeholder="이메일을 입력하세요."><br></div>
                <div><p>휴대폰 번호</p><input type="text" name="t_phone" placeholder="휴대폰 번호 '-'제외하고 입력하세요."> <br></div>
                <div><p>담당 과목</p><input type="text" name="t_part" placeholder="담당과목을 입력하세요."> <br></div>
            </form>
        </div>
        <input type="button" class="join" value="가입하기" onclick="createAccountForm();">
        <!-- <input type="reset" value="reset"> -->

    </div>

    <%-- <div class="login">
        <a href="<c:url value='/instructor/member/loginForm' />">login</a>
    </div> --%>


</section>

</body>
</html>
