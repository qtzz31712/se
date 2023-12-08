<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-05
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>개설 강좌</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<section>
    <p>개설 중인 강의 목록</p>
    <div class="myClassList">

    </div>

</section>
<script>
    let cls_t_no = '${cls_t_no}';
    console.log(cls_t_no);
    classList(cls_t_no);
    function classList(cls_t_no) {
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/instructor/class/listUpClass/" + cls_t_no,
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (rdata) {
                console.log(rdata);
                jQuery('.myClassList').html(rdata);
            },
            error: function (error) {
                alert(error);
            }
        })
      }
</script>
</body>
</html>
