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
				<th>USER_ID</th>
				<th>Post_NO</th>
				<th>TITLE</th>
				<th>CONTENT</th>
				<th>CREATED_DATE</th>
				<th>UPDATED_DATE</th>
				<th>VIEWS</th>
				<th>TOTAL_LIKE</th>
				<th>COUNT_LIKE</th>
			</tr>
		</thead>
		<tbody>
			<%
				BoardDao boardDao = new BoardDao();
				List<BoardDto> boardList = boardDao.boardInfoList();
				
				for(BoardDto item : boardList){
			%>
				<tr>
					<td><%=item.getUser_id()%></td>
					<td><%=item.getPost_no()%></td>
					<td><%=item.getTitle()%></td>
					<td><%=item.getContent()%></td>
					<td><%=item.getCreated_date()%></td>
					<td><%=item.getUpdated_date()%></td>
					<td><%=item.getViews()%></td>
					<td><%=item.getTotal_like()%></td>
					<td><%=item.getCount_like()%></td>
				</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>