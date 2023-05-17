<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="database.CalDao" %>
<%@ page import="database.CalDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
<style>
input{text-align:center;}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>

	<%
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		
		CalDao calDao = new CalDao();
		CalDto calDto = calDao.selectCalInfoByName(name);
		
		if(calDto != null){
	%>
			<div id="container">
				<h1>음식찾기</h1>
				<form name='resultForm' action='tempMain.jsp' method='post'>			
					<input type="text" value="식품명 : <%=calDto.getName() %>" disabled><br>
					<input type="text" value="제공량 : <%=calDto.getAmount() %>" disabled><br>
					<input type="text" value="탄수화물 : <%=calDto.getCarbohydrate() %>" disabled><br>
					<input type="text" value="단백질 : <%=calDto.getProtein() %>" disabled><br>
					<input type="text" value="지방 : <%=calDto.getFat() %>" disabled><br>
					<input type="text" value="칼로리 : <%=calDto.getCalorie() %>" disabled><br>
					<button type="submit" onclick="location.href='tempMain.jsp'">다시 검색하기</button>
				</form>
			</div>
	<%
		} else{
	%>
			<script>
				alert('일치하는 음식이 없습니다');
				history.go(-1);
			</script>
	<%
		}
	%>
	

</body>
</html>