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
</head>
<body>
<%@ include file = "header.jsp" %>

	<%
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name2");
		String eatAmount = request.getParameter("eatAmount");
		double eatAmountD = Double.parseDouble(eatAmount);
		
		CalDao calDao = new CalDao();
		CalDto calDto = calDao.selectCalInfoByName(name);
		
		if(calDto != null){
			double amount = calDto.getAmount();
			double resultAmount = eatAmountD/amount;
			double carbohydrate = Math.round(calDto.getCarbohydrate() * resultAmount);
			double protein = Math.round(calDto.getProtein() * resultAmount);
			double fat = Math.round(calDto.getFat() * resultAmount);
			double calorie = Math.round(calDto.getCalorie() * resultAmount);
	%>
			<div id="container">
				<h1>계산결과</h1>
				<form name='resultForm' action='tempMain.jsp' method='post'>			
					<input type="text" value="식품명 : <%=calDto.getName() %>" disabled><br>
					<input type="text" value="탄수화물 : <%=carbohydrate %>" disabled><br>
					<input type="text" value="단백질 : <%=protein %>" disabled><br>
					<input type="text" value="지방 : <%=fat %>" disabled><br>
					<input type="text" value="칼로리 : <%=calorie %>" disabled><br>
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