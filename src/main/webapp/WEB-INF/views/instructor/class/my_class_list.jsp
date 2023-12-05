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
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<section>
    <p>개설 중인 강의 목록</p>
    <div class="myClassList">

    </div>

</section>
<script>
    let ar_t_no = ${cls_t_no}
        console.log(ar_t_no)
    classList(ar_t_no);
    function classList(cls_t_no){
        jQuery.ajax({
            url : "${pageContext.request.contextPath}/instructor/class/myClassList/"+t_u_no,
            type : "GET",
            contentType : 'application/json; charset=utf-8', // 서버로 데이터를 보내는 형식
            success : function(rdata) {
                console.log(rdata)
                jQuery('.MyClassList').html(rdata);
            },
            error : function(error) {
                alert(error)
            }
        })
    }
</script>
</body>
</html>
