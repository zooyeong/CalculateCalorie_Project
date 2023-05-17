<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5칼로리</title>
</head>
<body>

<%@ include file = "header.jsp" %>

<style>
h1 {
  text-align: center;
}

ul {
  list-style: none;
  margin: 20px 0 0 0;
  padding: 0;
  display: flex;
  justify-content: space-around;
}

li {
  margin-right: 10px;
}

.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  height: 50vh;
}

.form-group {
  display: flex;
  margin-bottom: 10px;
}

.form-group label {
  flex: 1;
  margin-right: 10px;
  text-align: right;
}

.form-group input[type="text"] {
  flex: 2;
}
</style>

<div class="container">
  <h1>TODAY</h1>
  
  <form action='bbs2_proc.jsp'>
  <input type="text" name="id">
  <button type="submit">보내라</button>
  </form>

  <div class="form-group">
    <label for="carbs">탄수화물</label>
    <input type="text" id="carbs" value="0">
    <label for="protein">단백질</label>
    <input type="text" id="protein" value="0">
    <label for="fat">지방</label>
    <input type="text" id="fat" value="0">
     <label for="fat">칼로리</label>
    <input type="text" id="Calorie1" value="0">
  </div>
		
  <div class="form-group">
  <label for="Morning">아침</label>
    <!-- <input type="text" id="Morning1" value="0"> -->
    <label for="food1">음식명</label>
    <input type="text" id="food1" value="0">
    <label for="quantity1">섭취량</label>
    <input type="text" id="quantity1" value="0">
    <a href="bbs2.jsp"><button id="meal_Btn" type="button" style="float: right;">아침</button></a>
  </div>

  <div class="form-group">
  <label for="Lunching">점심</label>
    <!--<input type="text" id="Lunching1" value="0">-->
    <label for="food2">음식명</label>
    <input type="text" id="food2" value="0">
    <label for="quantity2">섭취량</label>
    <input type="text" id="quantity2" value="0">
    <a href="bbs2.jsp"><button id="meal_Btn" type="button" style="float: right;">점심</button></a>
  </div>

  <div class="form-group">
   <label for="Dinner">저녁</label>
    <!--<input type="text" id="Dinner1" value="0">-->
    <label for="food3">음식명</label>
    <input type="text" id="food3" value="0">
    <label for="quantity3">섭취량</label>
    <input type="text" id="quantity3" value="0">
    <a href="bbs2.jsp"><button id="meal_Btn" type="button" style="float: right;">저녁</button></a>
  </div>

  <div class="form-group">
  <label for="">간식</label>
    <!--<input type="text" id="between_meals1" value="0">-->
    <label for="food4">음식명</label>
    <input type="text" id="food4" value="0">
    <label for="quantity4">섭취량</label>
    <input type="text" id="quantity4" value="0">
    <a href="bbs2.jsp"><button id="meal_Btn" type="button" style="float: right;">간식</button></a>
  </div>

  <a href="bbs2_proc.jsp"><button id="meal_Btn" type="button" style="float: right;">Q 음식 찾기</button></a>
  
  
  <!-- <div id="container">
		<h1>음식찾기</h1>
		<form name='searchForm' action='searchResult.jsp' method='post'>	
			<label for="name">음식명</label>
		    <input type="text" id="name" name="name" placeholder="음식명을 입력해주세요"><br>
		    
		    <button id="loginBtn" type="button" onclick="searchChk()">검색하기</button>
		</form> -->
	</div>
</body>
</html>
