<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<form name='naverloginForm' action='Login_naver_proc2.jsp' method='post'>
		<input type="hidden" name="naverId" id="naverId">
		<input type="hidden" name="naverName" id="naverName">
	</form>
	
	<script>
	
		let naverId = document.getElementById('naverId');
		let naverName = document.getElementById('naverName');
		let form = document.naverloginForm;
		
		var naver_id_login = new naver_id_login("2KnOasyUQIicJ8e5EDqa", "http://localhost:8080/CalculateCalorie_Project/Login_naver_proc.jsp");
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			let id = naver_id_login.getProfileData('email');
			let name = naver_id_login.getProfileData('name');
			
			naverId.value = id;
			naverName.value = name;
			
			form.submit();
		}
	</script>
</body>
</html>