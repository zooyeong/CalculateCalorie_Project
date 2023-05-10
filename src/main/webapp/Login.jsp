<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input{
		width:100%
	}
</style>
</head>
<body>
	<form name='loginForm' action='Login_proc.jsp' method='post'>	
		<label for="id">아이디</label>
	    <input type="text" id="id" name="id" placeholder="id">
	    <label for="pw">비밀번호</label>
	    <input type="password" id="pw" name="pw" placeholder="password">
	    
	    <button id="loginBtn" type="button">로그인</button>
		<button id="cancelBtn" type="button">취소</button>
		<br>
		<a href="">아이디찾기</a>
		<a href="">비밀번호찾기</a>
		<a href="joinAgree.jsp">회원가입</a>
	</form>
	
	<script>
		document.getElementById('loginBtn').addEventListener('click', ()=>{
			let form = document.loginForm;
			
			let id = document.getElementById('id');
			let pw = document.getElementById('pw');
			
			if(id.value == ""){
				alert('아이디를 입력해주세요');
				id.focus();
			} else if(pw.value == ""){
				alert('비밀번호를 입력해주세요');
				pw.focus();
			} else{
				form.submit();
			}
			
		});
	</script>
</body>
</html>