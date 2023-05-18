<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.CalDao" %>
<%@ page import="park.dto.CalDto" %>
<%@ page import="park.dto.TodayDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
<style>
#container{width:100%;}
#container > form > input{width:25%; height: 40px;}
#searchBtn{width: 10% !important;}
#registerBtn{width: 15% !important; height:50px !important;}
</style>
</head>
<body onload="todayUpdate()">
<%@ include file = "header.jsp" %>
<%

	CalDao calDao = new CalDao();
	List<TodayDto> todayDtoList = calDao.selectCalInfoBySysdate(user_id);
		
	double todayCarbohydrate = 0;
	double todayProtein = 0;
	double todayFat = 0;
	double todayCalorie = 0;
	if(todayDtoList != null){
		for(TodayDto val : todayDtoList){
				
			todayCarbohydrate += val.getCarbohydrate();
			todayProtein += val.getProtein();
			todayFat += val.getFat();
			todayCalorie += val.getCalorie();
				
		}
 	}
%>

	<div id="container">
		<h1>TODAY</h1>
		<form name='searchForm' action='today_proc.jsp' method='post'>
			탄수화물<span id="carbohydrate">0</span>
			단백질<span id="protein">0</span>
			지방<span id="fat">0</span>
			칼로리<span id="calorie">0</span><br>
			<label for="name">음식명</label>
		    <input type="text" id="name" name="name" placeholder="음식명을 입력해주세요">
		    <button id="searchBtn" type="button" onclick="searchChk()">검색하기</button>
		    
		    <label for="eatAmount">섭취량</label>
		    <input type="text" id="eatAmount" name="eatAmount" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
		    
		    <button id="registerBtn" type="button" onclick="submitChk()">등록하기</button>
		</form>
	</div>
	
	<script>
		function searchChk(){
			let name = document.getElementById('name');
			
			if(name.value == ""){
				alert('음식명을 입력해주세요');
			} else{
				window.name = "parentForm";
				window.open("searchMenuResult.jsp?name="+name.value
						, "searchForm", "width=1200, height=600, resizable = no, scrollbars = no");
			}
		};
		
		function submitChk(){
			let name = document.getElementById('name');
			let eatAmount = document.getElementById('eatAmount');
			let searchForm = document.searchForm;
			
			if(name.value == ""){
				alert('음식명을 입력해주세요');
			} else if(eatAmount.value == ""){
				alert('음식명을 입력해주세요');
			} else{
				searchForm.submit();
			}
		}
		
		function todayUpdate(){
			document.getElementById('carbohydrate').innerHTML = '<%=todayCarbohydrate %>';
			document.getElementById('protein').innerHTML = '<%=todayProtein %>';
			document.getElementById('fat').innerHTML = '<%=todayFat %>';
			document.getElementById('calorie').innerHTML = '<%=todayCalorie %>';
		}
	</script>
</body>
</html>