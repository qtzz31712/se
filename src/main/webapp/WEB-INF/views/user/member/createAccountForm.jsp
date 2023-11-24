<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer">

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
            <h3>개인 회원가입</h3>
        </div>

        <div class="create_account_form">
            <form action="${pageContext.request.contextPath}/user/member/createAccountConfirm" name="create_account_form" method="post">
                <div><p>아이디</p><input type="text" name="u_id" placeholder="아이디를 입력하세요."> <br></div>
                <p id="idable"></p>
                <div><p>비밀번호</p><input type="password" name="u_pw" placeholder="비밀번호를 입력하세요."> <br></div>
                <div><p>이름</p><input type="text" name="u_name" placeholder="이름을 입력하세요."> <br></div>
                <div><p>성별</p><select name="u_gender">
                    <option value="">성별을 입력하세요</option>
                    <option value="M">Man</option>
                    <option value="W">Woman</option>
                <div><p>이메일</p><input type="email" name="u_mail"	placeholder="이메일을 입력하세요." ><br></div>
                <div><p>휴대폰 번호</p><input type="text" name="u_phone"	placeholder="휴대폰 번호 '-'제외하고 입력하세요."> <br></div>
                <div><p>생년 월일</p><input type="date" name="u_birth"	placeholder="생년월일을 입력하세요."> <br></div>

                </select> <br></div>
                <input type="button" class ="join" value="가입하기" onclick="createAccountForm();">
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
