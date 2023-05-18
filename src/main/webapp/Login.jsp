<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
<link rel="stylesheet" href="park_align_css.css">
<link rel="stylesheet" href="park_login_css.css">
<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "align.jsp" %>
	<div id="container">
		<h1>로그인</h1>
		<form name='loginForm' id='loginForm' action='Login_proc.jsp' method='post' style="padding-bottom:0">
			<label for="id" id="labelId">아이디</label>
			<input type="text" id="id" name="id" placeholder="id"><br>

			<label for="pw" id="labelPw">비밀번호</label>
			<input type="password" id="pw" name="pw" placeholder="password"
				onkeydown="if(event.keyCode == 13) loginSubmit()"><br>
			
			<button id="loginBtn" type="button" style="margin-bottom:5px; width:183px;"
				onclick="loginSubmit()">로그인</button><br>
		    
			<a href="javascript:kakaoLogin()"><img src="img_park/kakao_login_medium_narrow.png"></a>
			<br>
			<div id="naver_id_login"></div>
		</form>
	</div>
	<div id="help_box">
        <ul id="h_b_back1">
        	<li>아이디를 잊어버리셨나요?</li>
            <li><a href="selectId.jsp">아이디 찾기</a></li>
        </ul>

        <ul id="h_b_back2">
            <li>비밀번호를 잊어버리셨나요?</li>
            <li><a href="selectPw.jsp">비밀번호 찾기</a></li>
        </ul>

        <ul id="h_b_back3">
            <li>회원이 아니신가요?</li>
            <li><a href="joinAgree.jsp">회원가입</a></li>
        </ul>
    </div>
	
	<form name='kakaologinForm' action='Login_kakao_proc.jsp' method='post'>
		<input type="hidden" name="kakaoId" id="kakaoId">
		<input type="hidden" name="kakaoNickname" id="kakaoNickname">
	</form>
	
<%@ include file = "footer.jsp" %>
	<script>
		function loginSubmit(){
			let form = document.loginForm;
			
			let id = document.getElementById('id');
			let pw = document.getElementById('pw');
			
			if(id.value == ""){//아이디 입력란이 빈 경우
				alert('아이디를 입력해주세요');
				id.focus();
			} else if(pw.value == ""){//비밀번호 입력란이 빈 경우
				alert('비밀번호를 입력해주세요');
				pw.focus();
			} else{
				form.submit();
			}
		}
		
		let kakaoId = document.getElementById('kakaoId');
		let kakaoNickname = document.getElementById('kakaoNickname');
		Kakao.init('393298fa86bee1d43adf910c5859b398');
		function kakaoLogin(){
			let form = document.kakaologinForm;
			Kakao.Auth.login({
		        success: function (response) {
		        	Kakao.API.request({
		                url: '/v2/user/me',
		                success: function (response) {
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
		
		var naver_id_login = new naver_id_login("2KnOasyUQIicJ8e5EDqa", "http://localhost:8080/CalculateCalorie_Project/Login_naver_proc.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,40);
	  	naver_id_login.setDomain("http://localhost:8080/CalculateCalorie_Project/Login.jsp");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	</script>
</body>
</html>