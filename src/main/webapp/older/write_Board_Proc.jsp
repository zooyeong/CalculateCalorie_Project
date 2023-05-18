<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, org.apache.commons.io.*, java.util.Base64, java.util.regex.Pattern"%>
<%@ page import="java.util.regex.Matcher" %>

<%@ page import="choi.dao.BoardDao"%>
<%@ page import="choi.dto.BoardDto"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quill Image Upload</title>
</head>
<body>

<%
  String title = request.getParameter("title");


  String content = request.getParameter("content");
  String path = "/upload/"; // 이미지를 저장할 경로
  String imgRegex = "data:image\\/([a-zA-Z]*);base64,([^\"]*)"; // 이미지 데이터 추출용 정규식
  Pattern pattern = Pattern.compile(imgRegex);
  Matcher matcher = pattern.matcher(content);
  
  String imgPath = ""; // 이미지 파일 경로
  String imgTag = ""; // 이미지 태그를 저장할 변수
  while (matcher.find()) {
      String ext = matcher.group(1); // 이미지 확장자
      String base64Data = matcher.group(2); // base64 인코딩된 이미지 데이터
      byte[] imgData = Base64.getDecoder().decode(base64Data); // base64 디코딩
      String fileName = "img_" + System.currentTimeMillis() + "." + ext; // 이미지 파일명
      imgPath = application.getRealPath(path) + fileName; // 이미지 파일 경로
      FileUtils.writeByteArrayToFile(new File(imgPath), imgData); // 이미지 파일 저장
      imgTag += "<img src='" + request.getContextPath() + path + fileName + "' />"; // 이미지 태그 저장
  }
  String text = content.replaceAll("<img[^>]*>", ""); // 이미지 데이터를 제거한 텍스트
  out.println(text + imgTag); // 텍스트와 이미지 태그 출력
%>


<%

BoardDao boardDao = new BoardDao();
int result = boardDao.insertBoard(title, text, imgTag); // 이미지 경로 태그와 함께 DB에 저장

%>
</body>
</html>