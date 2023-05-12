<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<%@ page import="java.util.*" %>
<%@ page session = "true" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = (String)session.getAttribute("user_id");
		
		Date date1 = new Date(session.getLastAccessedTime());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String lastDate = formatter.format(date1);
		
		MemberDao memberDao = new MemberDao();
		memberDao.updateDate(user_id, lastDate);
		
	%>
	<script>
		location.href = "header.jsp";	
	</script>
</body>
</html>