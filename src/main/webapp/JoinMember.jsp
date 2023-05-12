<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
<style>
#container{width:50%;}
#container > form{text-align:left;}
#container select{
  width:25%;
  height: 30px;
  margin: 5px;
  padding: 0 5px;
  font-family: 'omyu_pretty';
  font-size:1.3rem;
  color: black;
}
#inputPhoneNum, #inputEmail, #inputAddress{
  width: 25% !important;
}
#idCheckBtn, #verificationBtn{
  margin: 5px !important;
  width: 25% !important;
  height: 30px !important; 
}
#inputId, #inputPw, #inputPwChk, #inputName, #birth{width: 70% !important;}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>
	<div id="container">
		<h1>회원가입</h1>
		<form name='joinMemberForm' action='JoinMember_proc.jsp' method='post'>
			<%
				String[] values = request.getParameterValues("agree");
			
				for(String val : values){
					if(values.length == 2){
			%>
						<input type="hidden" name="agree1" value="Y">
						<input type="hidden" name="agree2" value="Y">
						<input type="hidden" name="agree3" value="N">
			<%
					} else{
			%>
						<input type="hidden" name="agree1" value="Y">
						<input type="hidden" name="agree2" value="Y">
						<input type="hidden" name="agree3" value="Y">
			<%
					}
				}
			%>
			
			<label for="inputId">아이디</label><br>
			<input type="text" id="inputId"
				name="id" onkeydown="inputIdChk()" placeholder="아이디를 입력해주세요">
			<button type="button" value = "idCheck" id="idCheckBtn" onclick="openIdChk()">중복확인</button><br>
			<input type="hidden" name="idDuplication" id="idDuplication" value="idUncheck">
			<label for="inputPw">비밀번호</label><br>
			<input type="password" id="inputPw"
				name="pw" placeholder="비밀번호를 입력해주세요"><br>
			<label for="inputPwChk">비밀번호확인</label><br>
			<input type="password" id="inputPwChk"
				name="pwChk" placeholder="비밀번호를 입력해주세요"><br>
			<label for="inputName">이름</label><br>
			<input type="text" id="inputName"
				name="name" placeholder="이름을 입력해주세요"><br>
	        <label for="inputPhoneNum">휴대폰번호</label><br>
	        <select name="nation" id="nation">
		    	<option value="korea">대한민국 +82</option>
		        <option value="korea">가나 +233</option>
		        <option value="korea">네덜란드 +31</option>
		        <option value="korea">라오스 +856</option>
		        <option value="korea">멕시코 +52</option>
		        <option value="korea">미국/캐나다 +1</option>
		        <option value="korea">브라질 +55</option>
		        <option value="korea">수리남 +597</option>
		        <option value="korea">싱가포르 +65</option>
		        <option value="korea">영국 +44</option>
		    </select>
			<input type="text" id="inputPhoneNum" name="phoneNum" placeholder="-없이 숫자만 입력">
			<button type="button" id="verificationBtn">인증번호 발송</button><br>      	
	        <label for="inputEmail">이메일</label><br>
	        <input type="text" id="inputEmail" name="email" placeholder="이메일주소(선택)">
	        @<input type="text" id="inputAddress" name="emailaddress_x" disabled>
	        <input type="hidden" id="inputAddress2" name="emailaddress">
	        
	        <select name="select_address" id="select_address" onchange="email_change()">
	        	<option value="0">이메일주소선택</option>
	        	<option value="naver.com">naver.com</option>
	        	<option value="daum.net">daum.net</option>
	        	<option value="hanmail.net">hanmail.net</option>
	        	<option value="gmail.com">gmail.com</option>
	        	<option value="nate.com">nate.com</option>
	        	<option value="hotmail.net">hotmail.net</option>
	        	<option value="9">직접입력</option>
	        </select><br>
			<label for="birth">생년월일</label><br>
			<input type="date" id="birth" name="birth" value="2000-01-01"
					min="1950-01-01" max="2010-01-01"><br>
		    <label for="gender">성별
		    <br><input type="radio" id="M" name="gender" value="M">
		    <span>남자</span><br>
	        <input type="radio" id="F" name="gender" value="F">
	        <span>여자</span></label><br>
		
			<button id="joinBtn" type="button">가입</button>
			<button id="cancelBtn" type="button">취소</button>
			
		</form>
	</div>
	
	<script>
		document.getElementById('joinBtn').addEventListener('click', ()=>{
			let form = document.joinMemberForm;
			
			let inputId = document.getElementById('inputId');
			let idDuplication = document.getElementById('idDuplication');
			let inputPw = document.getElementById('inputPw');
			let inputPwChk = document.getElementById('inputPwChk');
			let inputName = document.getElementById('inputName');
			let inputPhoneNum = document.getElementById('inputPhoneNum');
			
			let reg = new RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$");
// 			let regPhone= new RegExp("^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$");
			
			if(inputId.value == ""){
				alert('아이디를 입력해주세요');
				inputId.focus();
			} else if(idDuplication.value != "idCheck"){
				alert('아이디 중복체크를 해주세요');
				inputId.focus();
			} else if(inputPw.value == ""){
				alert('비밀번호를 입력해주세요');
				inputPw.focus();
			} else if(inputPw.value.length < 8){
				alert('비밀번호는 8자 이상으로 작성해주세요');
				inputPw.focus();
			} else if(!reg.test(inputPw.value)){
				alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다");
				inputPw.focus();
			} else if(inputPw.value.search(" ") != -1){
				alert("비밀번호는 공백을 포함할 수 없습니다");
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
			} else if(inputPhoneNum.value == ""){
				alert('전화번호를 입력해주세요');
				inputPhoneNum.focus();
			} else{
				if(confirm('이 정보로 가입하겠습니까?')){
					form.submit();
				}
			}
		});
		
		document.getElementById('cancelBtn').addEventListener('click', ()=>{
			if(confirm('가입을 취소하겠습니까?')){
				history.go(-1);
			}
		});
		
		function openIdChk(){
			let id = document.getElementById('inputId');
			let idV = document.getElementById('inputId').value;
			let reg = new RegExp("^[a-zA-z0-9]{6,12}$");
			
			if(idV == "" || idV.length < 0){
				alert('아이디를 입력해주세요')
				id.focus();
			}else if(idV.length < 6 || idV.length > 12){
				alert("아이디는 6자 이상 12자 이하로 작성해주세요")
				return false;
			}else if(!reg.test(idV)){
				alert("한글 및 특수문자는 아이디로 사용할 수 없습니다")
				return false;
			}else{				
				window.name = "parentForm";
				window.open("IdCheck.jsp?userid="+document.getElementById('inputId').value
						, "chkForm", "width=500, height=300, resizable = no, scrollbars = no");
			}
		}
		
		function inputIdChk(){
			idDuplication.value = "idUncheck";
		}
		
		function email_change(){
			if(document.getElementById("select_address").value == "0"){
				document.getElementById("inputAddress").disabled = true;
				document.getElementById("inputAddress").name = "emailaddress_x";
				document.getElementById("inputAddress2").name = "emailaddress";
				document.getElementById("inputAddress").value = "";
			}
			if(document.getElementById("select_address").value == "9"){
				document.getElementById("inputAddress").disabled = false;
				document.getElementById("inputAddress").name = "emailaddress";
				document.getElementById("inputAddress2").name = "emailaddress_x";
				document.getElementById("inputAddress").value = "";
				document.getElementById("inputAddress").focus();
			} else{
				document.getElementById("inputAddress").disabled = true;
				document.getElementById("inputAddress").name = "emailaddress_x";
				document.getElementById("inputAddress2").name = "emailaddress";
				document.getElementById("inputAddress").value = 
					document.getElementById("select_address").value;
				document.getElementById("inputAddress2").value = 
					document.getElementById("select_address").value;
				console.log(document.getElementById("inputAddress").value);
			}
		};
		
	</script>
</body>
</html>