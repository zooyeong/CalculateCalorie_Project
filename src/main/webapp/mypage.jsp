<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<%@ page import="java.util.*" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
<style>
#kakaoDisabled{cursor:Default !important;}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	if(login){
		try{
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.selectMemberInfoById(user_id);
			
			String birth = memberDto.getBirth().substring(0,10);
			String gender = memberDto.getGender();
			if(gender == null){
				gender = "";
			}
			String email = memberDto.getEmail();
			if(email.equals("@")){
				email = "";
			}
%>
		<div id="container">			
			<h1>My Page</h1>
			<form name='pwChangeForm' action='pwChange_proc.jsp' method='post'>
				<label for="inputId">아이디</label>
				<input type="text" name="inputId" value="<%=memberDto.getId() %>" disabled><br>
				<label for="pw">현재 비밀번호</label>
				<input type="password" id="pw" name="pw" placeholder="password"><br>
				<label for="pwNew">변경할 비밀번호</label>
				<input type="password" id="pwNew" name="pwNew" placeholder="new password"><br>
				<label for="pwChk">비밀번호 확인</label>
				<input type="password" id="pwChk" name="pwChk" placeholder="confirm password"><br>
				<label for="inputName">이름</label>
				<input type="text" name="inputName" value="<%=memberDto.getName() %>" disabled><br>
				<label for="inputPhone">휴대폰번호</label>
				<input type="text" name="inputPhone" value="<%=memberDto.getPhone() %>" disabled><br>
				<label for="inputBirth">생년월일</label>
				<input type="text" name="inputBirth" value="<%=birth %>" disabled><br>
				<label for="inputGender">성별</label>
				<input type="text" name="inputGender" value="<%=gender %>" disabled><br>
				<label for="inputEmail">이메일</label>
				<input type="text" name="inputEmail" value="<%=email %>" disabled><br>
				
				<button id="pwChangeBtn" type="button" onclick="pwCheck()">비밀번호 변경</button>
				<button id="withdrawBtn" type="button" onclick="location.href='withdraw.jsp'">회원탈퇴</button>
					
			</form>		
		</div>
			
		<script>
			let form = document.pwChangeForm;
			function pwCheck(){
				let pw = document.getElementById('pw');
				let pwNew = document.getElementById('pwNew');
				let pwChk = document.getElementById('pwChk');
				let reg = new RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$");
				if(pw.value == ""){
					alert('비밀번호를 입력해주세요');
					pw.focus();
				} else if(pwNew.value == ""){
					alert('변경할 비밀번호를 입력해주세요');
					pwNew.focus();
				} else if(pwChk.value == ""){
					alert('비밀번호를 재확인해주세요');
					pwChk.focus();
				} else if(pw.value == pwNew.value){
					alert("기존 비밀번호와 동일합니다");
					pwNew.focus();
				} else if(pwNew.value != pwChk.value){
					alert('입력한 비밀번호가 다릅니다. 비밀번호를 재확인해주세요');
					pwChk.focus();
				} else if(!reg.test(pwNew.value)){
					alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다");
					pwNew.focus();
				} else if(pwNew.value.search(" ") != -1){
					alert("비밀번호는 공백을 포함할 수 없습니다");
					pwNew.focus();
				} else{
					form.submit();
				}
			}
		</script>	
<%		
		}catch(Exception e){
%>
			<div id="container">			
				<h1>My Page</h1>
				<form>
					<label for="inputId">아이디</label>
					<input type="text" name="inputId" value="<%=user_id %>" disabled><br>
					<label for="inputName">이름</label>
					<input type="text" name="inputName" value="<%=user_name %>" disabled><br>
					<button id="kakaoDisabled">카카오 계정</button>
				</form>	
			</div>			
<%
		}
	}else{
%>
		<script>
			alert("로그인 후 이용하시기 바랍니다.");
			location.href = "Login.jsp";
		</script>
<%} %>
		
</body>
</html>