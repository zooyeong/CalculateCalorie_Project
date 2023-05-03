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
	<form name='joinMemberForm' action='JoinMember_proc.jsp' method='post'>
		<div>
			<label for="inputId">아이디</label>
			<input type="text" id="inputId"
		  		name="id" placeholder="아이디를 입력해주세요">
		  	<label for="inputPw">비밀번호</label>
		  	<input type="password" id="inputPw"
		  		name="pw" placeholder="비밀번호를 입력해주세요">
		  	<label for="inputPwChk">비밀번호확인</label>
		  	<input type="password" id="inputPwChk"
		  		name="pwChk" placeholder="비밀번호를 입력해주세요">
		  	<label for="inputName">이름</label>
		  	<input type="text" id="inputName"
		  		name="name" placeholder="이름을 입력해주세요">
		  	<label for="birth">생년월일</label>
		  	<input type="date" id="birth" name="birth" value="2000-01-01"
		  			min="1950-01-01" max="2010-01-01">
	        <label for="gender">성별
	        <input type="radio" id="M" name="gender" value="M"><span>남자</span>
        	<input type="radio" id="F" name="gender" value="F"><span>여자</span></label>
        	<label for="inputEmail">이메일</label>
        	<input type="email" id="inputEmail" name="email" placeholder="이메일주소 입력(선택)">
        	<label for="inputPhoneNum">휴대폰번호</label>
			<input type="text" id="inputPhoneNum" name="phoneNum">        	
		</div>
		
		<button id="joinBtn" type="button">가입</button>
		<button id="cancelBtn" type="button">취소</button>
	</form>
	
	<script>
		document.getElementById('joinBtn').addEventListener('click', ()=>{
			let form = document.joinMemberForm;
			
			let inputId = document.getElementById('inputId');
			let inputPw = document.getElementById('inputPw');
			let inputPwChk = document.getElementById('inputPwChk');
			let inputName = document.getElementById('inputName');
			let inputPhoneNum = document.getElementById('inputPhoneNum');
			
			if(inputId.value == ""){
				alert('아이디를 입력해주세요');
				inputId.focus();
			} else if(inputPw.value == ""){
				alert('비밀번호를 입력해주세요');
				inputPw.focus();
			} else if(inputPwChk.value == ""){
				alert('비밀번호를 재확인해주세요');
				inputPwChk.focus();
			} else if(inputPw.value != inputPwChk.value){
				alert('비밀번호를 재확인해주세요');
				inputPwChk.focus();
			} else if(inputName.value == ""){
				alert('이름을 입력해주세요');
				inputName.focus();
			} else if(inputPhoneNum == ""){
				alert('이름을 입력해주세요');
				inputPhoneNum.focus();
			} else{
				if(confirm('이 정보로 가입하겠습니까?')){
					form.submit();
				}
			}
		});
		
	</script>
</body>
</html>