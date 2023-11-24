<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Silver Edu</title>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<jsp:include page="common/nav.jsp"/>
<h1>인덱스 페이지 생성</h1>
<a href="${pageContext.request.contextPath}/user/member/createAccount">회원 가입</a>
<jsp:include page="common/footer.jsp"/>


</body>
</html>