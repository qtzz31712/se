<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-12-22
  Time: 오전 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${chapterVos.chap_num}회|${chapterVos.chap_title}</title>
</head>
<body>
<script>
    let chap_no = ${chapterVos.chap_no}
        function modify_btn(chap_no) {
            const check = confirm("수정 화면으로 이동하시겠습니까?");
            if (check) {
                window.location.href = "/instructor/chapter/modifyChapterForm?chap_no=" + chap_no;
            } else {
                alert("취소 되었습니다.");
                return false
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
    <form action="${pageContext.request.contextPath}/instructor/chapter/registerChapterConfirm"
          name="register_chapter_form" method="post">
        <input type="hidden" name="chap_cls_no" value="${chapterVos.chap_cls_no}">
        <input type="hidden" name="chap_no" value="${chapterVos.chap_no}">
        <p>강의 제목</p>
        <p>${chapterVos.classInfoVo.cls_title}</p>
        <p>수업 회차</p>
        <p>${chapterVos.chap_num}회</p>
        <p>수업 제목</p>
        <input type="text" name="chap_title" placeholder="수업 제목을 입력하세요" value="${chapterVos.chap_title}" readonly>
        <p>강의 요약</p>
        <textarea name="chap_sub" placeholder="강의 요약을 입력하세요" readonly>${chapterVos.chap_sub}</textarea>
        <p>강의 영상</p>
        <video src="#"></video>
        <p>참고 문헌</p>
        <input type="text" name="chap_reference" placeholder="참고문헌을 입력하세요" value="${chapterVos.chap_reference}"
               readonly>
        <p>강의 교안</p>
        <input type="file" name="chap_textbook" value="${chapterVos.chap_textbook}" readonly>

        <button type="button" onclick="register_btn(${chapterVos.chap_no})">수업 수정</button>
        <button type="button" onclick="delete_btn(${chapterVos.chap_no})">수업 삭제</button>
    </form>
</section>
</body>
</html>
