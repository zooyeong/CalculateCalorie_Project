<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form name='selectPwForm' action='selectPw_proc.jsp' method='post'>	
		<label for="inputId">아이디</label>
		<input type="text" id="inputId"
		  	name="id" placeholder="아이디를 입력해주세요"><br>
		<label for="inputName">이름</label>
		<input type="text" id="inputName"
			name="name" placeholder="이름을 입력해주세요"><br>
	    <label for="inputPhoneNum">휴대폰번호</label>
		<input type="text" id="inputPhoneNum" name="phoneNum" placeholder="-없이 숫자만 입력">
		<br>
		<button type="button" onclick="selectPw_func()">비밀번호 찾기</button>
	</form>
	
	<script>
		function selectPw_func(){
			let inputId = document.getElementById('inputId');
			let inputName = document.getElementById('inputName');
			let inputPhoneNum = document.getElementById('inputPhoneNum');
			let form = document.selectPwForm;
			
			if(inputId.value == ""){
				alert('아이디를 입력해주세요');
				inputId.focus();
			} else if(inputName.value == ""){
				alert('이름을 입력해주세요');
				inputName.focus();
			} else if(inputPhoneNum.value == ""){
				alert('휴대폰번호를 입력해주세요');
				inputName.focus();
			} else{
				form.submit();	
			}
		}
	</script>
</body>
</html>