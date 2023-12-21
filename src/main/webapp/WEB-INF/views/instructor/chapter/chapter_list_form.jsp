<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>전체 수업 목록</title>
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
            url: "${pageContext.request.contextPath}/instructor/class/listUpChapter/" + chap_cls_no,
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
</body>
</html>
