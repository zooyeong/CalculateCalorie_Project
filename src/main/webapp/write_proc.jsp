<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="choi.dto.BoardDto"%>
<%@ page import="choi.dao.BoardDao"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	

<%
		request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
		BoardDao boardDao = new BoardDao();
		Part boardDao = request.getPart("title");
		
	
		int result = boardDao.insertBoard(title); 
		
		if(result == 1){
			//삭제 성공
	%>
	<script>
			alert('추가 성공');
		</script>
	<% 	
		} else {
	%>
	<!--삭제 실패-->
	<script>
				alert('추가 실패');
			</script>
	<%		
		}
	%>
	<script> location.href = './select_Board2.jsp';</script>




</body>
</html>