<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="choi.dto.CategoryDto"%>
<%@ page import="choi.dao.CategoryDao"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String userId2 = (String)session.getAttribute("user_id");

CategoryDao categoryDao = new CategoryDao();
categoryDao.reset_Category(userId2);
%>
<h1>초기화 되었습니당</h1>
</body>
</html>