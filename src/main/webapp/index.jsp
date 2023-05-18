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
<title>5 칼로리</title>
<link rel="stylesheet" href="park_css.css">
<style>
#container{width:100%; padding-bottom:0; text-align:center;}
#container > form{padding-bottom:0;}
#container > form > input{width:25%; height: 40px;}
#searchBtn{width: 10% !important;}
#registerBtn{
width: 20% !important;
height:70px !important;
font-size: 2rem !important;
background-color: #98FB98;
color: black;
display: block;
text-align: center;}
#claculateBtn{
margin-bottom: 30px;
width:15%;
height:50px;
text-align: center;
font-size:1rem;
}
#reset{
width: 20% !important;
height:70px !important;
font-size: 2rem !important;
}
#carbohydrate, #protein, #fat, #calorie{
font-size: 40px;
color: #98FB98;
font-family: 'omyu_pretty';
}
.tag{
font-family: 'omyu_pretty';
font-size: 30px;
margin-right:10px;
}
img{cursor:pointer;}
#wrapper{
width:40%;
text-align:center;
margin:90px auto;
padding:20px;
border:1px solid black;
}
#wrapper input{
width:40%;
height: 30px;
margin: 5px;
padding-left:2px;
font-family: 'omyu_pretty';
font-size:1.3rem;
color: black;
}
#wrapper input[type="radio"]{
margin-left:5px;
margin-top:10px;
width: 26px;
height: 26px;
cursor: pointer;
appearance: none;
border-radius: 50%;
background: lightgray;
font-size: 22px;
/* text-align: center; */
line-height: 26px;
}
#wrapper input[type="radio"]::before {
content: "\25CE";
color: white;
text-align: center;
}

#wrapper input[type="radio"]:checked {
background-color: black;
color: white;
}
.calSpan{display:inline-block; width:50px;}
#calBtn{
margin:20px;
width:30%;
height:50px;
font-size:2rem;}
#calResult{font-size:2rem;}
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
		
	  		<span class="tag">총 칼로리</span><span id="calorie">0</span><br><br>
	  		<span class="tag">탄수화물</span><span id="carbohydrate">0</span>
	  		<span class="tag">단백질</span><span id="protein">0</span>
	  		<span class="tag">지방</span><span id="fat" >0</span><br><br>
	  		
			<span class="tag">아침</span><label for="name">음식명</label>
			<input type="text" id="name1" name="name1" placeholder="음식명을 입력해주세요">
			<img src="img_park/icon_glass_search.png" width=40px; onclick="searchChk1()">
			    
			<label for="eatAmount">섭취량</label>
			<input type="text" id="eatAmount1" name="eatAmount1" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
			    
			<span class="tag">점심</span><label for="name">음식명</label>
			<input type="text" id="name2" name="name2" placeholder="음식명을 입력해주세요">
			<img src="img_park/icon_glass_search.png" width=40px; onclick="searchChk2()">
			    
			<label for="eatAmount">섭취량</label>
			<input type="text" id="eatAmount2" name="eatAmount2" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
			    
			<span class="tag">저녁</span><label for="name">음식명</label>
			<input type="text" id="name3" name="name3" placeholder="음식명을 입력해주세요">
			<img src="img_park/icon_glass_search.png" width=40px; onclick="searchChk3()">
			    
		    <label for="eatAmount">섭취량</label>
			<input type="text" id="eatAmount3" name="eatAmount3" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
			    
			<span class="tag">간식</span><label for="name">음식명</label>
			<input type="text" id="name4" name="name4" placeholder="음식명을 입력해주세요">
			<img src="img_park/icon_glass_search.png" width=40px; onclick="searchChk4()">
			    
			<label for="eatAmount">섭취량</label>
			<input type="text" id="eatAmount4" name="eatAmount4" placeholder="섭취한 음식을 그램(g) 단위로 입력해주세요"><br>
		    
		    
  			<button id="registerBtn" type="submit">등록하기</button>
			
			<button type="button" id="reset" onclick="resetChk()">초기화</button>
		    
		</form>
<!-- 		<button id="claculateBtn" type="button" onclick="location.href='Calculation.jsp'">내 기초대사량 계산하러 가기</button> -->
	</div>
	<div id="wrapper">
		<h1 style="border-bottom:none;">내 기초대사량 계산하기</h1>
		<span class="calSpan">키</span><input type="text" name="height" id="height"><br>
		<span class="calSpan">몸무게</span><input type="text" name="weight" id="weight"><br>
		<span class="calSpan">나이</span><input type="text" name="age" id="age"><br>
		<span class="calSpan">성별</span>
		남자<input type="radio" name="gender" value="M">
		여자<input type="radio" name="gender" value="F"><br>
		
		<button type="button" onclick="calculate()" id="calBtn">계산</button><br>
		▼ 하루 칼로리 권장량 ▼<div id="result"><span id="calResult">0</span>Kcal</div>
		<!-- 로그인 된 경우 세션에 저장 or 테이블 생성 후 테이블에 저장 -->
	</div>
	
<%@ include file = "footer.jsp" %>	
	
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
		};
		
		function resetChk(){
			let chk = confirm('초기화 시 오늘 기록한 칼로리가 모두 사라집니다.\n삭제하시겠습니까?');
			if(chk){
				location.href="reset_proc.jsp"
			}
		};
		
		let calResult = document.getElementById('calResult');
		function calculate(){
			
			let gender = document.querySelector('input[name="gender"]:checked').value;
			
			let height = document.getElementById('height').value;
			let weight = document.getElementById('weight').value;
			let age = document.getElementById('age').value;
			if(gender == "M"){
				let resultValue = Math.floor(66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age));
				calResult.innerHTML = resultValue;
			}else{
				let resultValue = Math.floor(655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age));
				calResult.innerHTML = resultValue;
			}
		};
	</script>
</body>
</html>