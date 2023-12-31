<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-05
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의 정보</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<section>
    <form action="${pageContext.request.contextPath}/instructor/class/modifyClassForm" name="class_info_form"
          method="post">
        <input type="hidden" name="cls_t_no" value="${classInfoVos.cls_t_no}">
        <input type="hidden" name="cls_no" value="${classInfoVos.cls_no}">
        강의 제목<input type="text" name="cls_title" placeholder="강의 제목을 입력 하세요" value="${classInfoVos.cls_title}" readonly>
        강의 회차<input type="number" name="cls_size" placeholder="강의 총 회차를 입력 하세요" value="${classInfoVos.cls_size}"
                    readonly>
        강사 <input type="text" name="cls_instructor" value="${classInfoVos.instructorMemberVo.t_name}">
        사용 교재<input type="text" name="cls_textbook" placeholder="사용 교재를 입력 하세요" value="${classInfoVos.cls_textbook}"
                    readonly>
        강의 요약<textarea name="cls_sub" placeholder="강의 설명및 요약을 작성 하세요" readonly>${classInfoVos.cls_sub}</textarea>
        시범 영상
        <video>
            <source src="${classInfoVos.cls_sample}" type="video/mp4">
        </video>
<a href="${pageContext.request.contextPath}/user/class/registerClassForm?cls_no=${classInfoVos.cls_t_no}&u_no=${loginedUserMemberVo.getU_no()}">수강 신청하기</a>
    </form>
</section>
</body>
</html>
