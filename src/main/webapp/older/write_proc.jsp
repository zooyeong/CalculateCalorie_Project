<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="choi.dto.BoardDto"%>
<%@ page import="choi.dao.BoardDao"%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
d
	

<%
		request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
		BoardDao boardDao = new BoardDao();
	
		Part filePart1 = request.getPart("fileename1");
		Part filePart2 = request.getPart("filename2");
		
		String title = null;
		String content = null;
		   Collection<Part> parts = request.getParts();
		   for (Part part : parts) {
		      String name = part.getName();
		      if (name.equals("title")) {
		         title = new Scanner(part.getInputStream())
		               .useDelimiter("\\A").next();
		      } else if (name.equals("content")) {
		         content = new Scanner(part.getInputStream())
		               .useDelimiter("\\A").next();
		      }
		   }
		
		out.println("제목: " + title + "<br>");
		out.println("내용: " + content + "<br>");
		
		
	%>
	<script> location.href = './select_Board2.jsp';</script>




</body>
</html>