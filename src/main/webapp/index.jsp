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

	CalDao calDao1 = new CalDao();
	List<TodayDto> todayDtoList = calDao1.selectCalInfoBySysdate(user_id);
		
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
			<label for="name">아침  음식명</label>
		    <input type="text" id="name1" name="name1" placeholder="음식명을 입력해주세요">
		    <button id="searchBtn" type="button" onclick="searchChk1()">검색하기</button>
		    
		    <label for="eatAmount">섭취량</label>
		    <input type="text" id="eatAmount1" name="eatAmount1" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
		    
		    <label for="name">점심  음식명</label>
		    <input type="text" id="name2" name="name2" placeholder="음식명을 입력해주세요">
		    <button id="searchBtn" type="button" onclick="searchChk2()">검색하기</button>
		    
		    <label for="eatAmount">섭취량</label>
		    <input type="text" id="eatAmount2" name="eatAmount2" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
		    
		    <label for="name">저녁  음식명</label>
		    <input type="text" id="name3" name="name3" placeholder="음식명을 입력해주세요">
		    <button id="searchBtn" type="button" onclick="searchChk3()">검색하기</button>
		    
		    <label for="eatAmount">섭취량</label>
		    <input type="text" id="eatAmount3" name="eatAmount3" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
		    
		    <label for="name">간식  음식명</label>
		    <input type="text" id="name4" name="name4" placeholder="음식명을 입력해주세요">
		    <button id="searchBtn" type="button" onclick="searchChk4()">검색하기</button>
		    
		    <label for="eatAmount">섭취량</label>
		    <input type="text" id="eatAmount4" name="eatAmount4" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
		    
		    <button id="registerBtn" type="submit" style="display: block; margin: 0 auto; margin-right:5px; ">등록하기</button>
		     
		    </form>
	</div>
	
	
<%
if (request.getMethod().equals("POST")) {
  // 버튼이 클릭되었을 때 실행될 코드
  
  int result = calDao1.deleteToday();
  if (result > 0) {
%>
    <script>
      location.reload();
    </script>
<%
  }
}
%>

<form method="post" action="">
  <button type="submit" style="position: relative; top: -140px; left: 5px; width: 150px; height: 60px;">삭제</button>
</form>
	
	
	
	
	
	
	
	
	
	
	<script>
		function searchChk1(){
			let name = document.getElementById('name1');
			
			if(name.value == ""){
				alert('음식명을 입력해주세요');
			} else{
				window.name = "parentForm";
				window.open("searchMenuResult.jsp?name="+name.value
						, "searchForm", "width=1200, height=600, resizable = no, scrollbars = no");
			}
		};
		
		function searchChk2(){
			let name = document.getElementById('name2');
			
			if(name.value == ""){
				alert('음식명을 입력해주세요');
			} else{
				window.name = "parentForm";
				window.open("searchMenuResult2.jsp?name="+name.value
						, "searchForm", "width=1200, height=600, resizable = no, scrollbars = no");
			}
		};
		
		function searchChk3(){
			let name = document.getElementById('name3');
			
			if(name.value == ""){
				alert('음식명을 입력해주세요');
			} else{
				window.name = "parentForm";
				window.open("searchMenuResult3.jsp?name="+name.value
						, "searchForm", "width=1200, height=600, resizable = no, scrollbars = no");
			}
		};
		
		function searchChk4(){
			let name = document.getElementById('name4');
			
			if(name.value == ""){
				alert('음식명을 입력해주세요');
			} else{
				window.name = "parentForm";
				window.open("searchMenuResult4.jsp?name="+name.value
						, "searchForm", "width=1200, height=600, resizable = no, scrollbars = no");
			}
		};
		

		function todayUpdate(){
			document.getElementById('carbohydrate').innerHTML = '<%=todayCarbohydrate %>';
			document.getElementById('protein').innerHTML = '<%=todayProtein %>';
			document.getElementById('fat').innerHTML = '<%=todayFat %>';
			document.getElementById('calorie').innerHTML = '<%=todayCalorie %>';
		}
	</script>
</body>
</html>