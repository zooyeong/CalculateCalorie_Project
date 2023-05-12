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

	String kakaoId = request.getParameter("kakaoId");
	String kakaoNickname = request.getParameter("kakaoNickname");
	session.setAttribute("user_id", kakaoId);
	session.setAttribute("user_name", kakaoNickname);
	response.sendRedirect("header.jsp");
%>
</body>
</html>