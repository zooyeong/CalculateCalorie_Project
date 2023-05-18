<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
<link rel="stylesheet" href="park_joinMember_css.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
  	integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
  	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
			
			<label for="inputId">아이디<span class="star">*</span></label><br>
			<input type="text" id="inputId"
				name="id" onkeydown="inputIdChk()" placeholder="아이디를 입력해주세요">
			<button type="button" value = "idCheck" id="idCheckBtn" onclick="openIdChk()">중복확인</button><br>
			<p class="notice" id="noticeId" style="display:none;">아이디를 중복확인 해주세요.</p>
			<input type="hidden" name="idDuplication" id="idDuplication" value="idUncheck">
			
			<label for="inputPw">비밀번호<span class="star">*</span></label><br>
			<input type="password" id="inputPw"
				name="pw" placeholder="비밀번호를 입력해주세요"><br>
			<label for="inputPwChk">비밀번호확인<span class="star">*</span></label><br>
			<input type="password" id="inputPwChk"
				name="pwChk" onkeydown="noticePw()" onkeyup="noticePwResult()" placeholder="비밀번호를 입력해주세요"><br>
			<p class="notice" id="noticePw" style="display:none;">비밀번호가 일치하지 않습니다.</p>
			
			<label for="inputName">이름<span class="star">*</span></label><br>
			<input type="text" id="inputName"
				name="name" placeholder="이름을 입력해주세요"><br>
	        
	        <label for="inputPhoneNum">휴대폰번호<span class="star">*</span></label><br>
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
			<input type="text" id="inputPhoneNum" name="phoneNum" placeholder="-없이 숫자만 입력" style="width:42%;">
			<button type="button" id="verificationBtn" onclick="verifiSendFunc()">인증번호 발송</button><br>      	
	        <div id="verif">
          		<p>인증번호</p>
          		<input type="text" id="verif_input" placeholder="인증번호 입력">
          		<button type="button" id="verifBtn">인증번호 확인</button>
          		<span id="timer"></span>
          		<p id="pfont_alert">인증문자가 오지 않으면 수신차단 메시지 또는 스팸함을 확인해주세요.</p>
        	</div>
	        <input type="hidden" name="verifiCodeChk" id="verifiCodeChk" value="codeUncheck">
	        
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
		    
		    <label for="gender">성별<br>
		    <input type="radio" id="M" name="gender" value="M">
		    <span>남자</span>
	        <input type="radio" id="F" name="gender" value="F">
	        <span>여자</span></label><br><br>
	        
	        <p><span class="star">*</span>는 필수입력 사항입니다.</p>
			
			<div id="btnWrapper">
				<button id="joinBtn" type="button">가입</button>
				<button id="cancelBtn" type="button">취소</button>
			</div>
			
		</form>
	</div>
<%@ include file = "footer.jsp" %>
	
	<script>
		let inputId = document.getElementById('inputId');
		let idDuplication = document.getElementById('idDuplication');
		let inputPw = document.getElementById('inputPw');
		let inputPwChk = document.getElementById('inputPwChk');
		let inputName = document.getElementById('inputName');
		let inputPhoneNum = document.getElementById('inputPhoneNum');
		let verifiCodeChk = document.getElementById('verifiCodeChk');
		
		document.getElementById('joinBtn').addEventListener('click', ()=>{
			let form = document.joinMemberForm;	
			
			let reg = new RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$");
			
			if(inputId.value == ""){
				alert('아이디를 입력해주세요.');
				inputId.focus();
			} else if(idDuplication.value != "idCheck"){
				document.getElementById('noticeId').style.display = 'block';
				inputId.focus();
			} else if(inputPw.value == ""){
				alert('비밀번호를 입력해주세요.');
				inputPw.focus();
			} else if(inputPw.value.length < 8){
				alert('비밀번호는 8자 이상으로 작성해주세요.');
				inputPw.focus();
			} else if(!reg.test(inputPw.value)){
				alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다.");
				inputPw.focus();
			} else if(inputPw.value.search(" ") != -1){
				alert("비밀번호는 공백을 포함할 수 없습니다.");
				inputPw.focus();
			} else if(inputPwChk.value == ""){
				alert('비밀번호를 재확인해주세요.');
				inputPwChk.focus();
			} else if(inputPw.value != inputPwChk.value){
				alert('비밀번호를 재확인해주세요.');
				inputPwChk.focus();
			} else if(inputName.value == ""){
				alert('이름을 입력해주세요.');
				inputName.focus();
			} else if(inputPhoneNum.value == ""){
				alert('전화번호를 입력해주세요.');
				inputPhoneNum.focus();
			} else if(verifiCodeChk.value != "codeCheck"){
				alert('휴대폰 인증을 완료해주세요.');
				verifiCodeChk.focus();
			} else{
				if(confirm('이 정보로 가입하겠습니까?')){
					form.submit();
				}
			}
		});
		
		document.getElementById('cancelBtn').addEventListener('click', ()=>{
			if(confirm('입력한 정보가 모두 사라집니다. 가입을 취소하겠습니까?')){
				location.href="index.jsp";
			}
		});
		
		function openIdChk(){
			let reg = new RegExp("^[a-zA-z0-9]{6,12}$");
			
			if(inputId.value == "" || inputId.value.length < 0){
				alert('아이디를 입력해주세요.')
				inputId.focus();
			}else if(inputId.value.length < 6 || inputId.value.length > 12){
				alert("아이디는 6자 이상 12자 이하로 작성해주세요.")
				return false;
			}else if(!reg.test(inputId.value)){
				alert("한글 및 특수문자는 아이디로 사용할 수 없습니다.")
				return false;
			}else{				
				window.name = "parentForm";
				window.open("IdCheck.jsp?userid="+inputId.value
						, "chkForm", "width=500, height=300, resizable = no, scrollbars = no");
			}
		}
		
		function inputIdChk(){
			idDuplication.value = "idUncheck";
		}
		
		function $ComTimer(){}

	    $ComTimer.prototype = {
	        comSecond : "",
	        fnCallback : function(){},
	        timer : "",
	        timerSpan : "",
	        fnTimer : function(){
	        	var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";
	          	this.comSecond--;	
	          	this.timerSpan.innerText = m;
	          	if (this.comSecond < 0) {	
	            	clearInterval(this.timer);
	            	alert('인증시간이 초과하였습니다.\n다시 인증을 시도해주세요.')
	            }
	        }, fnStop : function(){
	            clearInterval(this.timer);
	        }
	    }
	      
		function verifiSendFunc(){
			let reg = new RegExp("^[0-9]+$");
			
			if(inputPhoneNum.value == ""){
				alert('휴대폰번호를 입력해주세요.')
				inputPhoneNum.focus();
			}else if(!reg.test(inputPhoneNum.value)){
				alert("휴대폰번호를 숫자로만 입력해주세요.")
				return false;
			}else{
				let verif = document.getElementById('verif');
				verif.style.height="120px";
				var AuthTimer = new $ComTimer();
		        AuthTimer.comSecond = 180;
		        AuthTimer.timer = setInterval(function(){AuthTimer.fnTimer()},1000);
		        AuthTimer.timerSpan = document.getElementById("timer");

		        let verifBtn = document.getElementById('verifBtn');
		        let verif_input = document.getElementById('verif_input');
		        verifBtn.addEventListener('click', function(){
		        	if(verif_input.value == '0000'){ //인증번호를 0000으로 가정. 3차에서 구현 도전!
				        AuthTimer.fnStop();
		          		AuthTimer.timerSpan.innerText = '';
		          		verif.style.height = '0';
			 			verifiCodeChk.value = "codeCheck";
				        alert('인증이 완료되었습니다.')
		        	} else if(verif_input.value == ""){
		        		alert('인증번호를 입력해주세요.');
		        	} else{
		        		alert('인증번호가 다릅니다.');
		        	}
		        });
			}
		}
		
		function noticePw(){		
			if(inputPw.value != inputPwChk.value){
				document.getElementById('noticePw').style.display = 'block';
			}
		}
		
		function noticePwResult(){
			if(inputPw.value == inputPwChk.value){
				document.getElementById('noticePw').style.color = 'blue';
				document.getElementById('noticePw').innerHTML = '비밀번호가 일치합니다.';
			}
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