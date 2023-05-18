<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="choi.dto.BoardDto" %>
<%@ page import="choi.dao.BoardDao" %>
<%@ page import="choi.dto.LikeDto" %>
<%@ page import="choi.dao.LikeDao" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 뷰 페이지</title>
	<style>
		*{
  			margin:0; 
 			padding:0;
 			box-sizing: border-box;
		}

		.total_Container {
  			 width: 100%;
 			 display: flex;
  			 justify-content: center;
 			 align-items: center;
 			 flex-direction: column;
		}

		.one_Container{
			height:50px;
			width:1200px;
			display:flex;
			justify-content: center;
  			align-items: center;
			border-bottom: 1px solid black;;
		}

		.one_left_Container{
			height:50px;
			width:600px;
			display:flex;
			justify-content:left;
			align-items: center;
		}

		.one_right_Container{
			height:50px;
			width:600px;
			display:flex;
			justify-content:right;
			align-items: center;
		}

		.tow_Container{
			height:50px;
			width:1200px;
			display:flex;
			justify-content: center;
  			align-items: center;
			border-bottom: 1px solid black;;
		}

		.two_left_Container{
			height:50px;
			width:850px;
			display:flex;
			justify-content:left;
			align-items: center;
			margin-left:30px;
		}

		.two_center_Container{
			height:50px;
			width:150px;
			display:flex;
			justify-content:end;
			align-items: center;
		}

		.two_right_Container{
			height:50px;
			width:100px;
			display:flex;
			justify-content:end;
			align-items: center;
		}
		
		.two_rightright_Container{
			height:50px;
			width:100px;
			display:flex;
			justify-content:end;
			align-items: center;
		}

		.three_Container{
			height:300px;
			width:1100px;
			display:flex;
			justify-content:center;
			align-items: center;
			margin-top:30px;
		}

		.four_Container{
			height:350px;
			width:1200px;
			display:flex;
			justify-content:center;
			align-items: center;
		}
		
		.five_Container{
			height:100px;
			width:1200px;
			display:flex;
			justify-content:center;
			align-items: center;
		}
		
		.five_center_left_Container{
			height:100px;
			width:150px;
			display:flex;
			justify-content:center;
			align-items:center;
		}
		
		.five_center_Container{
			height:100px;
			width:1050px;
			display:flex;
			justify-content:center;
			align-items:center;
			margin-left:120px;
		}
		
		.five_center_right_Container{
			height:100px;
			width:150px;
			display:flex;
			justify-content:center;
			align-items:center;
		}
		
		.five_right_Container{
			height:100px;
			width:150px;
			display:flex;
			justify-content:end;
			align-items:center;
		}

		.grayColor{
			color:rgb(66, 66, 66);
		}
		
		img {
   		 width: 400px;
   		 height: 100%;
  		}

	</style>
</head>
<body>
<%@ include file = "header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	session = request.getSession();
	String userId2 = (String)session.getAttribute("user_id");
	String userId = request.getParameter("user_id");
%>

<%
  // URL로부터 post_no 파라미터 값을 가져옴
  int post_no = Integer.parseInt(request.getParameter("post_no"));

  BoardDao boardDao = new BoardDao();
  BoardDto boardDto = boardDao.board_Read(post_no, userId);
  BoardDto viewsUp = boardDao.viewsUp(post_no);
%>

<div class="total_Container">
<div class="one_Container">
	<div class="one_left_Container">
		<p>[작성자] <%= boardDto.getUser_id() %></p>
	</div>
	<div class="one_right_Container">
		<% if (userId2.equals(userId)) { %>
			<form action="edit_Board.jsp" method="get">
    			<input type="hidden" name="post_no" value="<%= post_no %>">
    			<input type="hidden" name="user_id" value="<%= userId %>">
    			<button type="submit">수정</button>
			</form>
			<form action="dele_Board.jsp" method="get">
			<input type="hidden" name="post_no" value="<%= post_no %>">
    			<input type="hidden" name="user_id" value="<%= userId %>">
				<button type="submit" id="delBtn" name="delBtn">삭제</button>
			</form>
		<% } %>
	</div>
</div>

<div class="tow_Container">
	<div class="two_left_Container">
		<h2><%= boardDto.getTitle() %></h2>
	</div>
	<div class="two_center_Container">
		<p class="grayColor">작성일: <%= boardDto.getCreated_date() %></p>
	</div>
	<div class="two_right_Container">
		<p class="grayColor">조회수: <%= boardDto.getViews() %></p>
	</div>
	<div class="two_rightright_Container">
		<p class="grayColor">좋아요: <span id="total_like"><%= boardDto.getTotal_like() %></span></p>
	</div>
	

</div>

	<% String imgYes = boardDto.getContent_img(); %>
	<% if (imgYes != null && !"<img src='upload/null' />".equals(imgYes)) { %>
    <!-- imgYes 변수가 null이 아닌 경우 대체 이미지를 표시합니다 -->
    <div class="three_Container">
        <%= imgYes %>
    </div>
	<% } %>

<div class="four_Container">
	<p><%= boardDto.getContent_text() %></p>
</div>

<div class="five_Container">
	<div class="five_center_left_Container">
		<button id="pageLeft">이전 글</button>
	</div>
	<div class="five_center_Container">
		<button id="likeBtn">좋아요</button>
	</div>
	<div class="five_center_right_Container">
		<button id="pageLeft">다음 글</button>
	</div>
	<div class="five_right_Container">
		<button id="listMove" onclick="moveBoard()">글 목록</button>
	</div>
</div>

</div>




<%
LikeDao likeDao = new LikeDao();
LikeDto likeDto = null;
int check = 0;

try {
    likeDto = likeDao.openLike(userId2, post_no, userId);
    check = likeDto.getLike_have();
} catch (Exception e) {
	    check = 0;
}
%>
 
<%= check %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	  $('#likeBtn').on('click', function() {
	    var check = <%= check %>; // check 변수의 값을 가져옴

	    if (check == 1) {
	      alert('좋아요는 1회만 누를 수 있습니다.');
	    } else {
	      $.ajax({
	        type: 'POST',
	        url: 'like_Proc.jsp', // 좋아요 처리를 담당하는 서버 측 코드가 구현된 JSP 페이지 URL
	        data: { post_no: <%= boardDto.getPost_no() %>, user_id: "<%= userId %>" }, // post_no 값을 전송
	        success: function(result) {
	          let total_like = parseInt($('#total_like').text());
	          $('#total_like').text(total_like + 1);
	          
	          location.reload();
	        },
	        error: function(xhr, status, error) {
	          // 요청이 실패한 경우 실행할 코드
	        }
	      });
	    }
	  });
	});
</script>


</body>
</html>