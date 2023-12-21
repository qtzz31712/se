<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <c:when test="${registerClassVos.rc_approval eq -1}">
            <div>승인 대기 중인 회원입니다.</div>
            <button type="button" onclick="approve_user(${registerClassVos.rc_no})">신청 승인</button>
            <button type="button" onclick="reject_user(${registerClassVos.rc_no})">신청 거절</button>
        </c:when>
        <c:when test="${registerClassVos.rc_approval eq 0}">
            <div>신청 거절된 회원입니다.</div>
            <button type="button" onclick="approve_user(${registerClassVos.rc_no})">신청 승인</button>
        </c:when>
        <c:otherwise>
            <div>이미 수강 중인 회원입니다.</div>
            <button type="button" onclick="reject_user(${registerClassVos.rc_no})">신청 거절</button>
        </c:otherwise>
    </c:choose>
</section>
<script>
    function approve_user(rc_no) {
        let confirmApproval = confirm("수강 신청을 수락 하시겠습니까?");
        if (confirmApproval){
        window.location.href= "/instructor/class/approveUser/"+rc_no;
        } else {
            alert("취소되었습니다.")
            return false;
        }
    }

    function reject_user(rc_no) {
        let confirmReject = confirm("수강 신청을 거절 하시겠습니까?");
        if(confirmReject){
            window.location.href= "/instructor/class/rejectUser/"+rc_no;
        } else {
            alert("취소되었습니다.")
            return false;
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        let message = "${message}";
        if (message !== "") {
            alert(message);
        }
    });

</script>
</body>
</html>
