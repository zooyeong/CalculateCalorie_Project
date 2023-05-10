<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = (String)session.getAttribute("user_id");
		String user_pw = request.getParameter("pw");
		
		MemberDao memberDao = new MemberDao();
		
		boolean result = memberDao.pwCheck(user_id, user_pw);
		
		if(result){
			memberDao.updateStatus3(user_id);
	%>
			<script>
				alert('탈퇴 성공');
				location.href = "logout_proc.jsp";
			</script>
	<%
		}else{
	%>
			<script>
				alert('비밀번호가 일치하지 않습니다.');
				history.go(-1);
			</script>
	<%
		}
	%>
</body>
</html>