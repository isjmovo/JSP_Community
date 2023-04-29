<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <h1>회원가입</h1>

    <script>
        let JoinForm__SubmitDone = false;

        function JoinForm__SubmitDone (form) {
            if (JoinForm__SubmitDone) {
                alert('처리 중입니다.');

                return;
            }

            form.loginId.value = form.loginId.value.trim();

            if (form.loginId.value.length == 0) {
                alert('아이디를 입력해주세요.');
                form.loginId.focus();

                return;
            }

            form.loginPw.value = form.loginPw.value.trim();

            if (form.loginPw.value.length == 0) {
                alert('비밀번호를 입력해주세요.');
                form.loginPw.focus();

                return;
            }

            form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

            if (form.loginPwConfirm.value.length == 0) {
                alert('비밀번호 확인을 입력해주세요.');
                form.loginPwConfirm.focus();

                return;
            }

            if (form.loginPw.value != form.loginPwConfirm.value) {
                alert('비밀번호가 일치하지 않습니다.');
                form.loginPwConfirm.focus();

                return;
            }

            form.name.value = form.name.value.trim();

            if (form.name.value.length == 0) {
                alert('이름을 입력해주세요.');
                form.name.focus();

                return;
            }

            alert('당신은 모든 시련을 통과했습니다.');
            form.submit();
            JoinForm__SubmitDone = true;
        }
    </script>

    <form action="doJoin" method="POST" onsubmit="JoinForm__SubmitDone(this); return false;">
        <div>아이디 : <input type="text" autocomplete="off" placeholder="아이디를 입력해주세요." name="loginId"></div>
        <div>비밀번호 : <input type="text" autocomplete="off" placeholder="비밀번호를 입력해주세요." name="loginPw"></div>
        <div>비밀번호 확인 : <input type="text" autocomplete="off" placeholder="비밀번호 확인을 입력해주세요." name="loginPwConfirm"></div>
        <div>이름 : <input type="text" autocomplete="off" placeholder="이름을 입력해주세요." name="name"></div>
        <div>
            <button type="submit">가입</button>
            <button type="button">
                <a href="../home/main">취소</a>
            </button>
        </div>
    </form>
</body>
</html>