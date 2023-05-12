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
  <p>좋아요: <span id="total_like"><%= boardDto.getTotal_like() %></span></p>


<button id="likeBtn">좋아요</button>
<a href="edit_Board.jsp?post_no=<%=post_no%>">수정</button>
<button id="delBtn">삭제</button>
<button id="listMove">글 목록</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
  $('#likeBtn').on('click', function() {
	  
	  let total_like = parseInt($('#total_like').text());
	    $('#total_like').text(total_like + 1);
	    
    $.ajax({
      type: 'POST',
      url: 'like_Proc.jsp', // 좋아요 처리를 담당하는 서버 측 코드가 구현된 JSP 페이지 URL
      data: { post_no: <%= boardDto.getPost_no() %> }, // post_no 값을 전송
      success: function(result) {
        console.log('Success:', result);
        
      },
      error: function(xhr, status, error) {
        console.error('Error:', error);
      }
    });
  });
});
</script>


</body>
</html>