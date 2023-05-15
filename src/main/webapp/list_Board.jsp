<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="choi.dto.BoardDto" %>
<%@ page import="choi.dao.BoardDao" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Board List</title>
	
	<style>

	td{
	text-align:center;
	height:50px;
	border-bottom:1px solid black;
	}
	
	.id_width{
	width:120px;
	text-align:center;
	}
	.post_width{
	width:90px;
		text-align:center;
	}
	.title_width{
	width:500px;
	text-align:center;
	}
	.create_width{
	width:200px;
	text-align:center;
	}
	.view_width{
	width:150px;
	text-align:center;
	}
		.like_width{
	width:150px;
	text-align:center;
	}
	
	table{
	margin: 0 auto;
	}
	
	.right_button{
	display:flex;
	justify-content: end;
	margin-right:100px;
	margin-bottom:20px;
	}

	
	</style>
</head>
<body>
<%@ include file = "header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	session = request.getSession();
	String userId = request.getParameter("user_id");
	String userId2 = (String)session.getAttribute("user_id");
	
%>
<%
  if(userId == null) {
%>
  <script>
    alert("로그인 하십시오.");
    location.href = "Login.jsp";
  </script>
<%
    return;
  }
%>

	<table>
		<thead>
			<tr>
				<th class="id_width">아이디</th>
				<th class="post_width">글 번호</th>
				<th class="title_width">제목</th>
				<th class="create_width">작성일</th>
				<th class="view_width">조회수</th>
				<th class="like_width">추천</th>
			</tr>
		</thead>
		<tbody>

<div class="right_button">
<% if (userId2.equals(userId)) { %>
  <button  onclick="location.href='select_Board2.jsp?user_id=<%=userId2%>'">글 쓰기</button>
<% } %>
</div>

		<%
BoardDao boardDao = new BoardDao();
List<BoardDto> boardList = boardDao.boardInfoList(userId);

int count = 0; // 몇 번째 게시글인지 세기 위한 변수
for(BoardDto item : boardList){
  count++;
  // 제목에 링크를 걸고, 글 번호를 쿼리 스트링으로 함께 전달
  if(count <= 10){ %>
    <tr>
      <td><%=userId%></td>
      <td><%=item.getPost_no()%></td>
      <td><a href="read_Board.jsp?post_no=<%=item.getPost_no()%>&user_id=<%=userId%>"><%=item.getTitle()%></a></td>
      <td><%=item.getCreated_date()%></td>
      <td><%=item.getViews()%></td>
      <td><%=item.getTotal_like()%></td>
    </tr>
<% 
  } else {
    break; // 20개 이후의 글은 나오지 않도록 break문으로 for문을 빠져나옵니다.
  }
}
%>
		</tbody>
	</table>
	
</body>
</html>