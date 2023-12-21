
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>개설 강좌</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<section>
    <p>수강중인 인원 목록</p>
    <div class="enrolledUserList">

    </div>

</section>
<script>
    let cls_no = '${cls_no}';
    console.log(cls_no);
    classList(cls_no);
    function classList(cls_no) {
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/instructor/class/listUpEnrolledUser/" + cls_no,
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (rdata) {
                console.log(rdata);
                jQuery('.enrolledUserList').html(rdata);
            },
            error: function (error) {
                alert(error);
            }
        })
    }
</script>
</body>
</html>
