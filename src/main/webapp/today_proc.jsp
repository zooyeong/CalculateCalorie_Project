<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="database.CalDao" %>
<%@ page import="database.CalDto" %>
<%@ page import="database.TodayDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	session = request.getSession();
	String id = (String)session.getAttribute("user_id");
	String name1 = request.getParameter("name1");
	String name2 = request.getParameter("name2");
	String name3 = request.getParameter("name3");
	String name4 = request.getParameter("name4");
	
	String eatAmount1 = request.getParameter("eatAmount1");
	double eatAmountD1 = 0.0;

	try {
	    eatAmountD1 = Double.parseDouble(eatAmount1);
	} catch (NumberFormatException e) {
	    // Handle the error or ignore it
	    // You can add logging or error handling code here
	}

	String eatAmount2 = request.getParameter("eatAmount2");
	double eatAmountD2 = 0.0;

	try {
	    eatAmountD2 = Double.parseDouble(eatAmount2);
	} catch (NumberFormatException e) {
	    // Handle the error or ignore it
	}

	String eatAmount3 = request.getParameter("eatAmount3");
	double eatAmountD3 = 0.0;

	try {
	    eatAmountD3 = Double.parseDouble(eatAmount3);
	} catch (NumberFormatException e) {
	    // Handle the error or ignore it
	}

	String eatAmount4 = request.getParameter("eatAmount4");
	double eatAmountD4 = 0.0;

	try {
	    eatAmountD4 = Double.parseDouble(eatAmount4);
	} catch (NumberFormatException e) {
	    // Handle the error or ignore it
	}
	
	CalDao calDao = new CalDao();
	CalDto calDto1 = calDao.selectCalInfoByName(name1);
	CalDto calDto2 = calDao.selectCalInfoByName(name2);
	CalDto calDto3 = calDao.selectCalInfoByName(name3);
	CalDto calDto4 = calDao.selectCalInfoByName(name4);
	
	
	
	if(calDto1 != null){
		if(id != null){
			
			String code = calDto1.getCode();
			double amount = calDto1.getAmount();
			double resultAmount = eatAmountD1/amount;
			double carbohydrate = Math.round(calDto1.getCarbohydrate() * resultAmount);
			double protein = Math.round(calDto1.getProtein() * resultAmount);
			double fat = Math.round(calDto1.getFat() * resultAmount);
			double calorie = Math.round(calDto1.getCalorie() * resultAmount);
			calDao.insertToday(id, code, carbohydrate, protein, fat, calorie, eatAmountD1);
		} else{
%>
			<script>			
				alert('로그인 후 이용가능합니다');
			</script>
<%
		}
		

%>		
		<script>
			location.href="index.jsp";		
		</script>
<%
	}else{
%>
		<script>
			alert('음식명을 확인해주세요');
			history.go(-1);
		</script>
<%
	}
		
%>



<%
if(calDto2 != null){
		if(id != null){
			
			String code = calDto2.getCode();
			double amount = calDto2.getAmount();
			double resultAmount = eatAmountD2/amount;
			double carbohydrate = Math.round(calDto2.getCarbohydrate() * resultAmount);
			double protein = Math.round(calDto2.getProtein() * resultAmount);
			double fat = Math.round(calDto2.getFat() * resultAmount);
			double calorie = Math.round(calDto2.getCalorie() * resultAmount);
			calDao.insertToday(id, code, carbohydrate, protein, fat, calorie, eatAmountD2);
		} else{
%>
			<script>			
				alert('로그인 후 이용가능합니다');
			</script>
<%
		}
		

%>		
		<script>
			location.href="index.jsp";		
		</script>
<%
	}else{
%>
		<script>
			alert('음식명을 확인해주세요');
			history.go(-1);
		</script>
<%
	}
		
%>

<%
if(calDto3 != null){
		if(id != null){
			
			String code = calDto3.getCode();
			double amount = calDto3.getAmount();
			double resultAmount = eatAmountD3/amount;
			double carbohydrate = Math.round(calDto3 .getCarbohydrate() * resultAmount);
			double protein = Math.round(calDto3.getProtein() * resultAmount);
			double fat = Math.round(calDto3.getFat() * resultAmount);
			double calorie = Math.round(calDto3.getCalorie() * resultAmount);
			calDao.insertToday(id, code, carbohydrate, protein, fat, calorie, eatAmountD3);
		} else{
%>
			<script>			
				alert('로그인 후 이용가능합니다');
			</script>
<%
		}
		

%>		
		<script>
			location.href="index.jsp";		
		</script>
<%
	}else{
%>
		<script>
			alert('음식명을 확인해주세요');
			history.go(-1);
		</script>
<%
	}
		
%>


<%
if(calDto4 != null){
		if(id != null){
			
			String code = calDto4.getCode();
			double amount = calDto4.getAmount();
			double resultAmount = eatAmountD4/amount;
			double carbohydrate = Math.round(calDto4.getCarbohydrate() * resultAmount);
			double protein = Math.round(calDto4.getProtein() * resultAmount);
			double fat = Math.round(calDto4.getFat() * resultAmount);
			double calorie = Math.round(calDto4.getCalorie() * resultAmount);
			calDao.insertToday(id, code, carbohydrate, protein, fat, calorie, eatAmountD4);
		} else{
%>
			<script>			
				alert('로그인 후 이용가능합니다');
			</script>
<%
		}
		

%>		
		<script>
			location.href="index.jsp";		
		</script>
<%
	}else{
%>
		<script>
			alert('음식명을 확인해주세요');
			history.go(-1);
		</script>
<%
	}
		
%>
</body>
</html>