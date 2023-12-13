<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-13
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강 희망 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>

<p>신청자 이름을 클릭 하면 수강 신청서를 확인 하실 수 있습니다.</p>
<div class="hope_register_user"></div>
<script>
    const t_no = '${loginedInstructorMemberVo.t_no}';
    console.log(t_no);
    function HopeList(t_no) {
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/instructor/class/listUpHopeUser/" + t_no,
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (rdata) {
                console.log(rdata);
                jQuery('.hope_register_user').html(rdata);
            },
            error: function (error) {
                alert(error);
            }
        })
    }
    HopeList(t_no);
</script>
</body>
</html>
