<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
</head>
<body>
<%@ include file = "header.jsp" %>
<!--  -->
	<div id="container">
		<h1>음식찾기</h1>
		<form name='searchForm' action='searchResult.jsp' method='post'>	
			<label for="name">음식명</label>
		    <input type="text" id="name" name="name" placeholder="음식명을 입력해주세요"><br>
		    
		    <button id="loginBtn" type="button" onclick="searchChk()">검색하기</button>
		</form>
		
		<h1>칼로리계산</h1>
		<form name='calculateForm' action='calculateResult.jsp' method='post'>	
			<label for="name2">음식명</label>
		    <input type="text" id="name2" name="name2" placeholder="음식명을 입력해주세요"><br>
		    <label for="eatAmount">섭취량</label>
		    <input type="text" id="eatAmount" name="eatAmount" placeholder="섭취량을 입력해주세요"><br>
		    <button id="loginBtn" type="button" onclick="calculateChk()">계산하기</button>
		</form>
	</div>

	<script>
		let name = document.getElementById('name');
		let form = document.searchForm;
		
		function searchChk(){
			
			if(name.value == ""){
				alert('음식명을 입력해주세요');
			} else{
				form.submit(); 
			}
		}
		/* form2 */
		let name2 = document.getElementById('name2');
		let eatAmount = document.getElementById('eatAmount');
		let form2 = document.calculateForm;
		
		function calculateChk(){
			if(name2.value == ""){
				alert('음식명을 입력해주세요');
			} else if(eatAmount.value == ""){
				alert('섭취량을 입력해주세요');
			} else{
				form2.submit();
			}
		}
	</script>
</body>
</html>