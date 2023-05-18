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

	String naverId = request.getParameter("naverId");
	String naverName = request.getParameter("naverName");
	session.setAttribute("user_id", naverId);
	session.setAttribute("user_name", naverName);
%>

<script>
	window.opener.location.href = "index.jsp";
	window.close();
</script>
</body>
</html>