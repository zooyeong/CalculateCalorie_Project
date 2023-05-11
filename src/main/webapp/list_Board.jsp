<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="choi.dto.BoardDto" %>
<%@ page import="choi.dao.BoardDao" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Board List</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>조회수</th>
				<th>추천</th>
			</tr>
		</thead>
		<tbody>
		<%
  BoardDao boardDao = new BoardDao();
  List<BoardDto> boardList = boardDao.boardInfoList();
  
  for(BoardDto item : boardList){
    int postNo = item.getPost_no(); // 글 번호를 변수에 저장
    
    // 제목에 링크를 걸고, 글 번호를 쿼리 스트링으로 함께 전달
%>
    <tr>
      <td><%=postNo%></td>
      <td><a href="read_Board.jsp?post_no=<%=postNo%>"><%=item.getTitle()%></a></td>
      <td><%=item.getCreated_date()%></td>
      <td><%=item.getUpdated_date()%></td>
      <td><%=item.getViews()%></td>
      <td><%=item.getTotal_like()%></td>
    </tr>
<%
  }
%>
		</tbody>
	</table>
	
</body>
</html>