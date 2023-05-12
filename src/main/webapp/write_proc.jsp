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

<%
String uploadPath = request.getRealPath("upload");
int maxFileSize = 10 * 1024 * 1024; // 최대 파일 크기 설정
String encoding = "UTF-8"; // 인코딩 설정

MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encoding, new DefaultFileRenamePolicy());

Enumeration files = multi.getFileNames();

String file1 = (String) files.nextElement();
String fileName1 = multi.getFilesystemName(file1);


// DB에 저장할 파일 경로 설정
String filePath1 = "<img src='upload/" + fileName1 + "' />";
String title = multi.getParameter("title");
String content = multi.getParameter("content");
%>

<%


BoardDao boardDao = new BoardDao();
int result = boardDao.insertBoard(title, content, filePath1); // 이미지 경로 태그와 함께 DB에 저장

%>