<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<a href="Login.jsp">로그인</a>	
	<a href="mypage_loginChk.jsp">마이페이지</a>
	<a href="JoinMember.jsp">회원가입</a>

	<h1>로그인 여부</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		String user_name = (String)session.getAttribute("user_name");
		
		boolean login = user_id == null ? false : true;

		if(login){
	%>
	
			<p>아이디</p> "<%=user_id%>"
			<p>이름</p> "<%=user_name%>" <span>님 로그인 중</span>
			
			<form name="logoutCheckForm" action="logout_proc.jsp" method="post">
				<button type="button" id="logoutBtn">로그아웃</button>
			</form>
	
	<%
		}else{
	%>
	
			<p>로그인하지 않은 상태</p>
	
	<%	} %>
	
	
	
	<script>
		document.getElementById('logoutBtn').addEventListener('click', ()=>{
			let form = document.logoutCheckForm;
			
			if(confirm('로그아웃 하시겠습니까?')){
				form.submit();
			}
		});
	</script>
</body>
</html>