<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
<c:if test="${empty classVos}">
    <div class="empty_word">개설한 강의가 없습니다.</div>
</c:if>
</table>
<thead>
<tr>
    <th>번호</th>
    <th>강의 제목</th>
    <th>개설 일자</th>
    <th>정보 수정</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${classVos}">
    <td>${loop.index + 1}</td>
    <td><a href="${pageContext.request.contextPath}/instructor/class/detailClassInfo">${item.cls_title}</a></td>
<td>${item.cls_reg_date}</td>
    <td><a href="${pageContext.request.contextPath}/instructor/class/modifyClassInfo">정보 수정</a></td>
</c:forEach>
</tbody>

<script>
    $.noConflict();
    var jQ = jQuery;
    function deleteClass(title, no, r_u_no) {
        let result = confirm('강의(' + title + ')를 삭제 하시겠습니까?');
        if (result){
            jQ.ajax({
                url : "${pageContext.request.contextPath}/class/deleteClassConfirm/"+no+"/"+cls_t_no,
                type : "GET",
                dataType:"json",
                contentType : 'application/json; charset=utf-8', // ������ �����͸� ������ ����
                success : function(rdata) {
                    console.log(rdata.ok)
                    if (rdata.ok===1) {
                        allList(cls_t_no);
                    }
                },
                error : function(error) {
                    alert(error)
                }
            })
        }
    }

    function allList(cls_t_no){
        jQ.ajax({
            url : "${pageContext.request.contextPath}/instructor/class/MyClassList"+cls_t_no,
            type : "GET",
            contentType : 'application/json; charset=utf-8',
            success : function(rdata) {
                console.log(rdata)
                jQuery('.class_list').html(rdata);
            },
            error : function(error) {
                alert(error)
            }
        })
    }
</script>