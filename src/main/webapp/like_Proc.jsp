<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="choi.dto.BoardDto" %>
<%@ page import="choi.dao.BoardDao" %>
<%@ page import="choi.dto.LikeDto" %>
<%@ page import="choi.dao.LikeDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  int post_no = Integer.parseInt(request.getParameter("post_no"));
  String user_id = request.getParameter("user_id");
  String userId2 = (String)session.getAttribute("user_id");
  // post_no 값을 이용하여 좋아요 처리 로직 구현

  BoardDao boardDao = new BoardDao();
  BoardDto viewsUp = boardDao.likeUp(post_no, user_id);
  
  LikeDao likeDao = new LikeDao();
  LikeDto likeDto = likeDao.canlike(userId2, post_no, user_id);
  
%>




</body>
</html>