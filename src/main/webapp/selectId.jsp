<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
</head>
<body>
<%@ include file = "header.jsp" %>
	<div id="container">
		<h1>아이디 찾기</h1>
		<form name='selectIdForm' action='selectId_proc.jsp' method='post'>	
			<label for="inputName">이름</label>
			<input type="text" id="inputName"
				name="name" placeholder="이름을 입력해주세요"><br>
		    <label for="inputPhoneNum">휴대폰번호</label>
			<input type="text" id="inputPhoneNum" name="phoneNum" placeholder="-없이 숫자만 입력">
			<br>
			<button type="button" onclick="selectId_func()">아이디 찾기</button>
		</form>
	</div>
	<script>
		function selectId_func(){
			let inputName = document.getElementById('inputName');
			let inputPhoneNum = document.getElementById('inputPhoneNum');
			let form = document.selectIdForm;
			
			if(inputName.value == ""){
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