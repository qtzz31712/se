<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>전체 수업 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<section>
    <div class="chapter_list">
    </div>
</section>

<script>
    let chap_cls_no = ${cls_no};
    console.log(chap_cls_no);
    classList(chap_cls_no);
    function classList(chap_cls_no) {
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/instructor/chapter/listUpChapter/"+chap_cls_no,
            type: "GET",
            contentType: 'application/json; charset=utf-8',
            success: function (rdata) {
                console.log(rdata);
                jQuery('.chapter_list').html(rdata);
            },
            error: function (error) {
                alert(error);
            }
        })
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
