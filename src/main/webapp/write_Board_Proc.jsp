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
String uploadPath = request.getRealPath("upload");
int maxFileSize = 10 * 1024 * 1024; // 최대 파일 크기 설정
String encoding = "UTF-8"; // 인코딩 설정

MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encoding, new DefaultFileRenamePolicy());

Enumeration files = multi.getFileNames();

String file1 = (String) files.nextElement();
String fileName1 = multi.getFilesystemName(file1);


// DB에 저장할 파일 경로 설정
request.setCharacterEncoding("UTF-8");
session = request.getSession();

String filePath1 = "<img src='upload/" + fileName1 + "' />";
String postStr = request.getParameter("post_no");
int post = Integer.parseInt(postStr);

String userId = (String)session.getAttribute("user_id");
String title = multi.getParameter("title");
String content = multi.getParameter("content");


out.println("post_no: " + post);
out.println("user_id: " + userId);
out.println("title: " + title);
out.println("content: " + content);
%>

<%
BoardDao boardDao = new BoardDao();
int result = boardDao.updateBoard(userId, post, title, content, filePath1); // 이미지 경로 태그와 함께 DB에 저장
%>
</body>
</html>