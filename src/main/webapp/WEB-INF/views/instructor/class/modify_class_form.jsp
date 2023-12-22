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
    <title>강의 정보</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
<%--        function delete_video() {--%>
<%--            if (confirm("영상을 삭제 하시겠습니까?")) {--%>
<%--                // 여기서 영상을 삭제하는 로직을 작성해야 합니다.--%>
<%--                // 삭제할 때 사용하는 서버로의 요청 등을 수행할 수 있습니다.--%>

<%--                // 예시: jQuery를 사용하여 Ajax 요청으로 영상 삭제 요청을 서버로 보내는 방법--%>
<%--                $.ajax({--%>
<%--                    url: '/path_to_delete_video', // 영상 삭제를 처리하는 엔드포인트 URL--%>
<%--                    type: 'DELETE', // 혹은 다른 메서드 (POST, DELETE 등)--%>
<%--                    success: function (response) {--%>
<%--                        // 성공적으로 삭제되었을 때 처리할 내용--%>
<%--                        console.log('영상이 성공적으로 삭제되었습니다.');--%>
<%--                        // 예시: 삭제 후 페이지 새로고침--%>
<%--                        location.reload();--%>
<%--                    },--%>
<%--                    error: function (error) {--%>
<%--                        // 삭제에 실패했을 때 처리할 내용--%>
<%--                        console.error('영상 삭제 중 오류가 발생했습니다:', error);--%>
<%--                    }--%>
<%--                });--%>
<%--            } else {--%>
<%--                // 사용자가 취소를 선택한 경우 처리할 내용--%>
<%--                console.log('영상 삭제가 취소되었습니다.');--%>
<%--            }--%>
<%--        }--%>

function modifyClassInfo() {
    console.log("강의수정 호출")
    let form = document.class_info_form;
    if (form.cls_title == null) {
        alert("강의 제목을 입력 하세요");
        form.cls_title.focus();
    } else if (form.cls_size == null) {
        alert("강의 횟차를 입력 하세요")
        form.cls_size.focus();
    } else if (form.cls_sub == null) {
        alert("강의 요약 및 설명을 작성 하세요")
        form.cls_sub.focus();
    } else {
        let result = confirm("강의를 수정하시겠습니까?")
        if(result) {
            form.submit()
        } else {
            form.create_class.focus()
            return false;
        }
    }
}

function fileUpload() {
    let formData = new FormData(document.class_info_form);
    let file = document.class_info_form.cls_sample.files[0];

    if (!file) {
        alert("업로드할 파일을 등록하세요.");
        return false;
    }

    formData.append("file", file);

    fetch("/upload", {
        method: "POST",
        body: formData
    }).then(response => {
        if (response.ok) {
            return response.text();
        }
        throw new Error("Network response was not ok.");
    }).then(data => {
        document.querySelector('input[name="cls_sample"]').value = data;
        console.log("File uploaded successfully:", data);
    }).catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
        // 에러 처리
    });
}
    </script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<section>
    <form action="${pageContext.request.contextPath}/instructor/class/modifyClassConfirm" name="class_info_form"
          method="post">
        <input type="hidden" name="cls_no" value="${classInfoVos.cls_no}">
        <input type="hidden" name="cls_t_no" value="${classInfoVos.cls_t_no}">
        강의 제목<input type="text" name="cls_title" placeholder="강의 제목을 입력 하세요" value="${classInfoVos.cls_title}">
        강의 회차<input type="number" name="cls_size" placeholder="강의 총 회차를 입력 하세요" value="${classInfoVos.cls_size}">
        사용 교재<input type="text" name="cls_textbook" placeholder="사용 교재를 입력 하세요" value="${classInfoVos.cls_textbook}">
        강의 요약<textarea name="cls_sub" placeholder="강의 설명및 요약을 작성 하세요">${classInfoVos.cls_sub}</textarea>
        시범 영상
        <video>
            <source src="${classInfoVos.cls_sample}" type="video/mp4" class="cls_sample">
        </video>
        <input type="file" name="cls_sample" accept="video/*">
        <button type="button" onclick="fileUpload()">파일 업로드</button>
        <button type="button" name="create_class" onclick="modifyClassInfo()">수정 완료</button>
    </form>
</section>
</body>
</html>
