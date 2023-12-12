<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-12
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>전체 강의</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<section>
    <p>개설 중인 강의 목록</p>
    <div class="all_class">

    </div>

</section>
<script>
    AllClassList();
    function AllClassList() {
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/user/class/listUpAllClass",
            type: "GET",
            // contentType: 'application/json; charset=utf-8',
            success: function (rdata) {
                console.log(rdata);
                jQuery('.all_class').html(rdata);
            },
            error: function (error) {
                alert(error);
            }
        })
    }
</script>

</body>
</html>
