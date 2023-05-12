<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>5 칼로리</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String name = request.getParameter("bbsTitle");
%>

<!-- name 변수의 값을 출력합니다. -->
<p><%= name %></p>

</body>
</html>