<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-13
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강 신청 리스트</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<section>
    <h2>수강신청리스트</h2>
    <div class="register_class_list"></div>

</section>
<script>
    const u_no = "${loginedUserMemberVo.u_no}";
    function AllClassList(u_no) {
        console.log(u_no);
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/user/class/listUpRegisterClass/" + u_no,
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (rdata) {
                console.log(rdata);
                jQuery('.register_class_list').html(rdata);
            },
            error: function (error) {
                alert(error);
            }
        })
    }

    AllClassList(u_no);

    function delete_btn(rc_no) {
        var confirmDelete = confirm("수강신청을 취소하겠습니까?");
        if (confirmDelete) {
            window.location.href = "/user/class/deleteRegisterClass/" + rc_no
        } else {
            return false;
        }
        AllClassList(u_no);
    }

</script>

<script>
        let message = "${message}";
        if (message !== "") {
            alert(message);
        }
</script>

</body>
</html>
