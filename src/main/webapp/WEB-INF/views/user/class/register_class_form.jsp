<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-13
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강 신청</title>
    <script>
        function regClass() {
            let form = document.register_class_form;
            if (form.rc_u_no === "") {
                alert("로그인 후 이용하세요")
                return false;
            } else if (form.rc_sub === "" ) {
                alert("수강 신청 목적을 작성하세요")
                form.rc_sub.focus();
            } else if (form.rc_cls_approval === false){
                alert("현재 수강 신청이 불가능한 강의 입니다.")
                return false;
            } else {
                form.submit();
            }
        }
    </script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<section>
    <h2>수강 신청</h2>
    <h3>신청 과목</h3>
    <p>${classInfoVos.cls_title}</p>
    <h3>강사</h3>
    <p>${classInfoVos.instructorMemberVo.t_name}</p>
    <h3></h3>
    <p>총 ${classInfoVos.cls_size}회</p>
    <h3>강의 내용</h3>
    <div>${classInfoVos.cls_sub}</div>
    <form action="${pageContext.request.contextPath}/user/class/registerClassConfirm" name="register_class_form" method="post">
        <input type="text" name="rc_cls_no" value="${classInfoVos.cls_no}">
        <input type="text" name="rc_u_no" value="${loginedUserMemberVo.u_no}">
        <input type="hidden" name="rc_cls_approval" value="${classInfoVos.cls_approval}">
        <label>신청 목적</label>
        <textarea name="rc_sub" placeholder="신청 목적및 이유를 작성 하세요"></textarea>
    <button type="button" onclick="regClass()" class="reg_button">수강 신청</button>
        <button type="reset" class="reset_btn">초기화</button>
    </form>
</section>

</body>
</html>
