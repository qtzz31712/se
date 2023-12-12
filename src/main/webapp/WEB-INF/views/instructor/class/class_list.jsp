<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<c:set var="isEmpty" value="${empty classInfoVos}" />
<script>
    function toggleApproval(cls_no, cls_approval) {
        if (cls_approval === false){
            cls_approval = 0;
        } else {
            cls_approval = 1;
        }
        let newApproval = (cls_approval === 0) ? 1 : 0;
        console.log(newApproval)
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/instructor/class/toggleApproval',
            data: {
                cls_no: cls_no,
                cls_approval: newApproval

            },
            success: function(response) {
                alert("수강 신청 가능 여부가 변경되었습니다.");
                location.reload();
            },
            error: function(error) {
                console.error('요청 실패:', error);
            }
        });
    }
</script>

<div class="myClassList">
    <c:choose>
        <c:when test="${not isEmpty}">
            <table>
                <thead>
                <tr>
                    <th>번호</th>
                    <th>강의 제목</th>
                    <th>개설 일자</th>
                    <th>수강 신청 가능 여부</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${classInfoVos}"  varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td><a href="${pageContext.request.contextPath}/instructor/class/classInfoDetail?cls_no=${item.cls_no}">${item.cls_title}</a></td>
                        <td >${item.cls_reg_date}</td>
                        <td><c:choose>
                            <c:when test="${item.cls_approval}">
                                수강 신청 가능
                            </c:when>
                            <c:otherwise>
                                수강 신청 불가
                            </c:otherwise>
                        </c:choose>
                        <button type="button" onclick="toggleApproval(${item.cls_no}, ${item.cls_approval})" name= "appr_button" class="appr_button">수강 신청 가능 여부 변경</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>개설한 강의가 없습니다.</p>
        </c:otherwise>
    </c:choose>
</div>