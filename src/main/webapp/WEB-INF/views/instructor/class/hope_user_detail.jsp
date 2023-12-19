
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-13
  Time: 오후 5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>수강 신청서</title>

</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<section>
    <h2>수강 신청서</h2>
    <h3>신청 과목</h3>
    <p>${registerClassVos.classInfoVo.cls_title}</p>
    <h3>강사</h3>
    <p>${registerClassVos.classInfoVo.instructorMemberVo.t_name}</p>
    <h3>총 강의횟수</h3>
    <p>총 ${registerClassVos.classInfoVo.cls_size}회</p>
    <h3>강의 내용</h3>
    <div>${registerClassVos.classInfoVo.cls_sub}</div>
    <div><p>신청 회원 이름</p>
        <p>${registerClassVos.userMemberVo.u_name}</p>
    </div>
    <div><p>신청 회원 생년월일</p>
        <p>${registerClassVos.userMemberVo.u_birth}</p>
    </div>
    <div><p>신청 회원 이메일</p>
        <p>${registerClassVos.userMemberVo.u_mail}</p>
    </div>

    <div><p>수강 목적</p>
        <label>
            <textarea name="rc_sub" placeholder="신청 목적및 이유를 작성 하세요" readonly>${registerClassVos.rc_sub}</textarea>
        </label>
    </div>
    <div><p>신청 날짜</p>
        <p>${registerClassVos.rc_reg_time}</p>
    </div>

    <c:choose>
        <c:if test="${registerClassVos.rc_approval eq -1}">
            <div>승인 대기 중인 회원입니다.</div>
            <button type="button" onclick="approve_btn(${registerClassVos.rc_no}, ${registerClassVos.rc_approval})">신청 승인</button>
            <button type="button" onclick="reject_bten(${registerClassVos.rc_no}, ${registerClassVos.rc_approval})">신청 거절</button>
        </c:if>
        <c:if test="${registerClassVos.rc_approval eq 0}">
            <div>신청 거절된 회원입니다.</div>
            <button type="button" onclick="approve_btn(${registerClassVos.rc_no}, ${registerClassVos.rc_approval})">신청 승인</button>
        </c:if>
        <c:otherwise>
            <div>이미 수강 중인 회원입니다.</div>
        </c:otherwise>
    </c:choose>
</section>

</body>
</html>
