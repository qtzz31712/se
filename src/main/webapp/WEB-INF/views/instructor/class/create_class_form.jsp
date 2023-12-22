<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-05
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>강의 등록</title>

<script>
    function createClass() {
        console.log("강의생성 호출")
        let form = document.create_class_form;
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
           let result = confirm("강의를 등록하시겠습니까?")
            if(result) {
                form.submit()
            } else {
                form.create_class.focus()
                return false;
            }
        }
    }

    function fileUpload() {
        let formData = new FormData(document.create_class_form);
        let file = document.create_class_form.cls_sample.files[0];

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
<form action="${pageContext.request.contextPath}/instructor/class/createClassConfirm" name="create_class_form" method="post">
    <input type="text" name="cls_t_no" value="${loginedInstructorMemberVo.t_no}">
    강의 제목<input type="text" name="cls_title" placeholder="강의 제목을 입력 하세요">
    강의 회차<input type="number" name="cls_size" placeholder="강의 총 회차를 입력 하세요">
    사용 교재<input type="text" name="cls_textbook" placeholder="사용 교재를 입력 하세요" >
    강의 요약<textarea name="cls_sub" placeholder="강의 설명및 요약을 작성 하세요"></textarea>
    시범 영상<input type="file" name="cls_sample">
    <button type="button" onclick="fileUpload()">파일등록</button>
    <button type="button" name="create_class" onclick="createClass();">강의 등록</button>
    <button type="reset" name="reset">초기화</button>
</form>
</section>
</body>
</html>
