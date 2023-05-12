<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="choi.dto.BoardDto"%>
<%@ page import="choi.dao.BoardDao"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

<%
String uploadPath = request.getRealPath("upload");
int maxFileSize = 10 * 1024 * 1024; // 최대 파일 크기 설정
String encoding = "UTF-8"; // 인코딩 설정

MultipartRequest multi = new MultipartRequest(request, uploadPath, maxFileSize, encoding, new DefaultFileRenamePolicy());

Enumeration files = multi.getFileNames();

String file1 = (String) files.nextElement();
String fileName1 = multi.getFilesystemName(file1);

String file2 = (String) files.nextElement();
String fileName2 = multi.getFilesystemName(file2);

// DB에 저장할 파일 경로 설정
String filePath1 = "upload/" + fileName1;
String filePath2 = "upload/" + fileName2;


%>