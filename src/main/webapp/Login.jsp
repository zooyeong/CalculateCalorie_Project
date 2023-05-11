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
	<h1>로그인</h1>
	<form name='loginForm' action='Login_proc.jsp' method='post'>	
		<label for="id">아이디</label>
	    <input type="text" id="id" name="id" placeholder="id">
	    <label for="pw">비밀번호</label>
	    <input type="password" id="pw" name="pw" placeholder="password">
	    
	    <button id="loginBtn" type="button">로그인</button>
		<button id="cancelBtn" type="button">취소</button><br>
		<a href="javascript:kakaoLogin()"><img src="img_park/kakao_login_medium_narrow.png"></a>
		<br>
		<a href="selectId.jsp">아이디찾기</a>
		<a href="">비밀번호찾기</a>
		<a href="joinAgree.jsp">회원가입</a>
	</form>
	
	<form name='kakaologinForm' action='Login_kakao_proc.jsp' method='post'>
		<input type="hidden" name="kakaoId" id="kakaoId">
		<input type="hidden" name="kakaoNickname" id="kakaoNickname">
	</form>
	
	<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
		
		let kakaoId = document.getElementById('kakaoId');
		let kakaoNickname = document.getElementById('kakaoNickname');
		Kakao.init('34109d3ae35c8e1fec9c5bbf9cb89a65');
		function kakaoLogin(){
			let form = document.kakaologinForm;
			Kakao.Auth.login({
		        success: function (response) {
		        	Kakao.API.request({
		                url: '/v2/user/me',
		                success: function (response) {
		                    alert('로그인 성공');
		                    console.log(JSON.stringify(response));
		                    kakaoId.value = response.id;
		                    kakaoNickname.value = response.properties.nickname;
		                    form.submit();
		                },
		                fail: function (error) {
		                    alert(JSON.stringify(error))
		                },
		            })
		        },
		        fail: function (error) {
		            alert(JSON.stringify(error))
		        },
		    })
		}
	</script>
</body>
</html>