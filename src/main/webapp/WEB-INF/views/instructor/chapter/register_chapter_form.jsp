<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-21
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수업 등록</title>

</head>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<body>
<script>
window.onload = function () {
    let chapNumbers = ${chapNumbers};
    generateChapNumber(chapNumbers);
}
    function generateChapNumber(chapNumbers) {
        const selectElement = document.getElementById('chapNumSelect');
        selectElement.innerHTML = '';
        for (let i = 1; i <= chapNumbers; i++) {
            const option = document.createElement('option');
            option.value = i;
            option.text = i;
            selectElement.appendChild(option);
        }
    }

    function register_btn() {
        let form = document.register_chapter_form;
        if (form.chap_title == null) {
            alert("수업 제목은 필수입니다.")
            form.chap_title.focus();
        } else if (form.chap_sub == null) {
            alert("수업 요약은 필수입니다.")
            form.chap_sub.focus();
        } else if (form.chap_file ==null) {
            alert("강의 파일은 필수 입니다")
            form.chap_file.focus();
        } else {
            form.submit();
        }
    }

function fileUpload() {
    let formData = new FormData(document.register_chapter_form);
    let file = document.register_chapter_form.chap_file.files[0];

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
        console.log(data);
    }).catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
        // 에러 처리
    });
}

function textbookUpload() {
    let formData = new FormData(document.register_chapter_form);
    let file = document.register_chapter_form.chap_textbook.files[0];

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
        console.log(data);
    }).catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
        // 에러 처리
    });
}

</script>
<section>
    <form action="${pageContext.request.contextPath}/instructor/chapter/registerChapterConfirm" name="register_chapter_form" method="post">
        <input type="hidden" name="chap_cls_no" value="${cls_no}">
        <p>수업 회차</p>
        <select name="chap_num"  id="chapNumSelect">

        </select>
        <p>수업 제목</p>
        <input type="text" name="chap_title" placeholder="수업 제목을 입력하세요">
        <p>강의 요약</p>
        <textarea name="chap_sub" placeholder="강의 요약을 입력하세요"></textarea>
        <p>참고 문헌</p>
        <input type="text" name="chap_reference" placeholder="참고문헌을 입력하세요">
        <p>강의 교안</p>
        <input type="file" name="chap_textbook">
        <button type="button" onclick="textbookUpload()">파일 등록</button>
        <p>강의 파일</p>
        <input type="file" name="chap_file">
        <button type="button" onclick="fileUpload()">파일 등록</button>
        <button type="button" onclick="register_btn()" >강의 등록</button>
        <button type="reset">초기화</button>
    </form>
</section>
<script>
    let message = "${message}";
    if (message !== "") {
        alert(message);
    }
</script>
</body>
</html>
