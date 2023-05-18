<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5 칼로리</title>
<link rel="stylesheet" href="park_css.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>



</style>
</head>
<body>
<%@ include file = "header.jsp" %>
<div>
	키<input type="text" name="height" id="height"><br>
	몸무게<input type="text" name="weight" id="weight"><br>
	성별<br>
	남자<input type="radio" name="gender" value="M">
	여자<input type="radio" name="gender" value="F"><br>
	나이<input type="text" name="age" id="age"><br>
	
	<button type="button" onclick="calculate()">계산</button><br>
	하루 칼로리 권장량<div id="result">1300</div> <!-- 1300kcal 이라 가정. -->
	<!-- 로그인 된 경우 세션에 저장 or 테이블 생성 후 테이블에 저장 -->
	
	<div class="progress" style="width:70%; height: 30px;">
		<div id="bar" class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
	</div>
	아침<input type="text" id="breakfast"><br><!-- value는 음식 칼로리 값으로 가정 -->
	점심<input type="text" id="lunch"><br><!-- value는 음식 칼로리 값으로 가정 -->
	저녁<input type="text" id="dinner"><br><!-- value는 음식 칼로리 값으로 가정 -->
	간식<input type="text" id="between"><br><!-- value는 음식 칼로리 값으로 가정 -->
	<button type="button" onclick="calorie()">제출</button><br>
	</div>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
	<script>
		let result = document.getElementById('result');
		function calculate(){
			
			let gender = document.querySelector('input[name="gender"]:checked').value;
			
			let height = document.getElementById('height').value;
			let weight = document.getElementById('weight').value;
			let age = document.getElementById('age').value;
			if(gender == "M"){
				let resultValue = Math.floor(66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age));
				result.innerHTML = resultValue;
			}else{
				let resultValue = Math.floor(655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age));
				result.innerHTML = resultValue;
			}
		};
		
		function calorie(){
			let breakfast = document.getElementById('breakfast').value;
			let lunch = document.getElementById('lunch').value;
			let dinner = document.getElementById('dinner').value;
			let between = document.getElementById('between').value;
			
			let progress_bar = document.getElementById('bar');
			let percent = (breakfast*100/result.innerHTML)
						+ (lunch*100/result.innerHTML)
						+ (dinner*100/result.innerHTML)
						+ (between*100/result.innerHTML);
			progress_bar.style.width = percent+"%";
		};
	</script>
</body>
</html>