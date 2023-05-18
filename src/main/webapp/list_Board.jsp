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

	th{
		height:50px;
		border-top: 1px solid rgb(141, 139, 139);
		border-bottom: 1px solid rgb(141, 139, 139);
	}

	td{
	text-align:center;
	height:40px;
	border-bottom:1px solid rgb(190, 189, 189);
	}
	
	.leftAlign{
	text-align:left;
	height:40px;
	border-bottom:1px solid rgb(190, 189, 189);
	display:flex;
	}
	
	.id_width{
	width:120px;
	text-align:center;
	}
	.post_width{
	width:90px;
		text-align:center;
	}

	.category{
	width:120px;
	text-align:center;
	}
	
	.title_width{
	width:540px;
	text-align:center;
	}
	.create_width{
	width:150px;
	text-align:center;
	}
	.view_width{
	width:80px;
	text-align:center;
	}
		.like_width{
	width:120px;
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

	.page_no_Link{
		display:flex;
		justify-content:center;
		gap: 10px; /* 각 아이템 사이의 간격을 10px로 설정합니다 */
	}

	.colorBlue{
	color:blue;
	font-size:14px;
	font-weight:bold;
	}
	
	.rightRight{
	height:100%;
	margin-right:20px;
	display:flex;
	align-items: center;
	gap:7px;
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
  if(userId2 == null) {
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
				<th class="category">카테고리</th>
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
		String pageNoStr = request.getParameter("page");
		int pageNo = Integer.parseInt(pageNoStr);
		
  BoardDao boardDao = new BoardDao();
  List<BoardDto> boardList = boardDao.boardInfoList(userId, pageNo);
  
  
  for(BoardDto item : boardList){
    
    // 제목에 링크를 걸고, 글 번호를 쿼리 스트링으로 함께 전달
%>
 		
<% String imgYes = item.getContent_img(); %>
		<% if (imgYes != null && !"<img src='upload/null' />".equals(imgYes)) { %>
    	<!-- imgYes 변수가 null이 아닌 경우 대체 이미지를 표시합니다 -->
    	<% imgYes = "<img src='https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.icons8.com%2Fcolor%2F452%2Fpaint-net.png&type=sc960_832' width='20' height='20'>"; %>
		<% } else { %>	
		<% imgYes = ""; %>
		<% } %>
    <tr>
      <td><%=userId%></td>
      <td><%=item.getPost_no()%></td>
      
      <td><%=item.getCategory()%></td>
      
      <td class="leftAlign">
      <a href="read_Board.jsp?post_no=<%=item.getPost_no()%>&user_id=<%=userId%>">
      <div class=rightRight>
      <%=item.getTitle()%>
      <div class=rightRight>
      <%= imgYes %>
      </div>
      </div>
      </a>
      </td>
  
   
      <td><%=item.getCreated_date()%></td>
      <td><%=item.getViews()%></td>
      <td class="colorBlue">
      <% int like = item.getTotal_like(); %>
      <% if (like != 0) { %>
      <%=like%>
      <% } else { %>
      <% } %>
      </td>
      

    </tr>
    
   
<%
  }
%>
		</tbody>
	</table>
	




<%
    int pageSize = 10;
    int totalCount = boardDao.page_No(userId);
    int totalPageCount = (int) Math.ceil((double) totalCount / pageSize);
%>

<div class="page_no_Link">
<% for (int i = 1; i <= totalPageCount; i++) { %>
    <a class="spaceBar" href="?page=<%= i %>&user_id=<%= userId %>">[<%= i %>]</a>
<% } %>	
</div>
	
	
</body>
</html>