<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="choi.dto.BoardDto" %>
<%@ page import="choi.dao.BoardDao" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 뷰 페이지</title>
</head>
<body>
<%
  // URL로부터 post_no 파라미터 값을 가져옴
  int post_no = Integer.parseInt(request.getParameter("post_no"));

  BoardDao boardDao = new BoardDao();
  BoardDto boardDto = boardDao.board_Read(post_no);
  BoardDto viewsUp = boardDao.viewsUp(post_no);
%>
	<h1>제목: <%= boardDto.getTitle() %></h1>
  <p>작성일: <%= boardDto.getCreated_date() %></p>
  <p>내용: <%= boardDto.getContent_text() %></p>
  <p>이미지: <%= boardDto.getContent_img() %></p>
  <p>작성자: <%= boardDto.getUser_id() %></p>
  <p>조회수: <%= boardDto.getViews() %></p>


</body>
</html>