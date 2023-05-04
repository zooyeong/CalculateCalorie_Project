<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		String user_name = (String)session.getAttribute("user_name");
		
		boolean login = user_id == null ? false : true;
		
		if(login){
	%>
	
			<script>			
				location.href = 'mypage.jsp';
			</script>
	
	<%	}else{ %>
			
			<script>
				alert('로그인을 해주세요');
				history.go(-1);
			</script>
	<%	} %>
</body>
</html>