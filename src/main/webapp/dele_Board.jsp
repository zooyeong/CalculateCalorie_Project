<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="choi.dto.BoardDto"%>
<%@ page import="choi.dao.BoardDao"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String userId = request.getParameter("user_id");
int post_no = Integer.parseInt(request.getParameter("post_no"));
%>

<%
BoardDao boardDao = new BoardDao();
int result = boardDao.deleteBoard(userId, post_no); // 이미지 경로 태그와 함께 DB에 저장
%>

<%
response.setHeader("Refresh", "0; URL=list_Board.jsp?page=1&user_id=" + userId);
%>

</body>
</html>