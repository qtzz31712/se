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
    <title>수업 수정</title>

</head>
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/nav.jsp"/>
<body>
<script>
    window.onload = function () {
        let chapNumbers = ${chapNumbers};
        let defaultNum = ${chapterVos.chap_num}; // 서버에서 받은 기본값

        generateChapNumber(chapNumbers, defaultNum);
    }

    function generateChapNumber(chapNumbers, defaultNum) {
        const selectElement = document.getElementById('chapNumSelect');
        selectElement.innerHTML = '';

        for (let i = 1; i <= chapNumbers; i++) {
            const option = document.createElement('option');
            option.value = i;
            option.text = i;

            if (i === defaultNum) {
                option.selected = true;
            }
            selectElement.appendChild(option);
        }
    }

    function modify_btn() {
        let form = document.modify_chapter_form;
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

    function delete_btn(chap_no) {
        const check = confirm("정말로 삭제 하시겠습니까?");
        if (check) {
            window.location.href = "/instructor/chapter/deleteChapter?chap_mp=" + chap_no;
        } else {
            alert("취소 되었습니다.");
            return false
        }
    }
</script>
<section>
    <form action="${pageContext.request.contextPath}/instructor/chap/modifyChapterConfirm" name="modify_chapter_form" method="post">
        <input type="hidden" name="chap_no" value="${chapterVos.chap_no}" readonly>
        <input type="hidden" name="chap_cls_no" value="${chapterVos.chap_cls_no}" readonly>
        <p>수업 회차</p>
        <select name="chap_num"  id="chapNumSelect" >

        </select>
        <p>수업 제목</p>
        <input type="text" name="chap_title" placeholder="수업 제목을 입력하세요" value="${chapterVos.chap_title}">
        <p>강의 요약</p>
        <textarea name="chap_sub" placeholder="강의 요약을 입력하세요">${chapterVos.chap_sub}</textarea>
        <p>참고 문헌</p>
        <input type="text" name="chap_reference" placeholder="참고문헌을 입력하세요" value="${chapterVos.chap_reference}">
        <p>강의 교안</p>
        <input type="file" name="chap_textbook" value="${chapterVos.chap_textbook}}">
        <p>강의 파일</p>
        <video src="${chapterVos.chap_file}"></video>
        <input type="file" name="chap_file">
        <button type="button" onclick="modify_btn()" >수업 수정</button>
        <button type="button" onclick="delete_btn(${chapterVos.chap_no})">수업 삭제</button>
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

