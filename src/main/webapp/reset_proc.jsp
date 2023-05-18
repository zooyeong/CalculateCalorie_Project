<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="database.CalDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	CalDao calDao1 = new CalDao();

	
	session = request.getSession();
	String user_id = (String)session.getAttribute("user_id");
	int result = calDao1.deleteToday(user_id);
	
	if (result == 1) {
%>
	    <script>
	    	alert('초기화가 완료되었습니다.');
	    	location.href = "index.jsp";
	    </script>
<%
	}else{
%>
		<script>
			location.href = "index.jsp"; //되돌아가는 케이스
		</script>
<%
	}
%>


</body>
</html>