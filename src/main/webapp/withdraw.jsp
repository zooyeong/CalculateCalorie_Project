<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 확인</h1>
	<form name='withdrawForm' action='withdraw_proc.jsp' method='post'>
		<label for="pw">현재 비밀번호</label>
		<input type="password" id="pw" name="pw" placeholder="password"><br>
		<button id="withdrawBtn" type="button" onclick="pwCheck()">회원탈퇴</button>
		<button id="cancleBtn" type="button" onclick="location.href='mypage.jsp'">탈퇴취소</button>
	</form>
	
	<script>
		function pwCheck(){
			let pw = document.getElementById('pw');
			if(pw.value == ""){
				alert('비밀번호를 입력해주세요');
				pw.focus();
			} else{
				let form = document.withdrawForm;
				form.submit();
			}
		}
	</script>
</body>
</html>