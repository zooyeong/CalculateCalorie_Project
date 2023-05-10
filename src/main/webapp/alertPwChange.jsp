<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>개인정보를 위해</h1>
	<h1>비밀번호를 변경해 주세요</h1>
	
	<p>회원님은 3개월 이상 동일한 비밀번호를 사용하고 계십니다.<br>
	   소중한 개인 정보보호를 위해 비밀번호를 주기적으로 변경해주세요.</p>
		
	<form name='pwChangeForm' action='pwChange_proc.jsp' method='post'>
				

		<label for="pw">현재 비밀번호</label>
		<input type="password" id="pw" name="pw" placeholder="password"><br>
		<label for="pwNew">변경할 비밀번호</label>
		<input type="password" id="pwNew" name="pwNew" placeholder="new password"><br>
		<label for="pwChk">비밀번호 확인</label>
		<input type="password" id="pwChk" name="pwChk" placeholder="confirm password"><br>
		<button id="pwChangeBtn" type="button" onclick="pwCheck()">비밀번호 변경</button>
		<button id="laterBtn" type="button" onclick="location.href='pwChangeLater_proc.jsp'">90일 뒤에 변경</button>
	</form>
	
	<script>
		let form = document.pwChangeForm;
		function pwCheck(){
			let pw = document.getElementById('pw');
			let pwNew = document.getElementById('pwNew');
			let pwChk = document.getElementById('pwChk');
			let reg = new RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$");
			if(pw.value == ""){
				alert('비밀번호를 입력해주세요');
				pw.focus();
			} else if(pwNew.value == ""){
				alert('변경할 비밀번호를 입력해주세요');
				pwNew.focus();
			} else if(pwChk.value == ""){
				alert('비밀번호를 재확인해주세요');
				pwChk.focus();
			} else if(pw.value == pwNew.value){
				alert("기존 비밀번호와 동일합니다");
				pwNew.focus();
			} else if(pwNew.value != pwChk.value){
				alert('입력한 비밀번호가 다릅니다. 비밀번호를 재확인해주세요');
				pwChk.focus();
			} else if(!reg.test(pwNew.value)){
				alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다");
				pwNew.focus();
			} else if(pwNew.value.search(" ") != -1){
				alert("비밀번호는 공백을 포함할 수 없습니다");
				pwNew.focus();
			} else{
				form.submit();
			}
		}
	</script>	
		
</body>
</html>