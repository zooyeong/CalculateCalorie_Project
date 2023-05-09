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
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		MemberDao memberDao = new MemberDao();
		
		MemberDto memberDto = memberDao.selectPersonInfoListById(user_id);
		try {
			if(memberDto == null){
				
	%>
	<script>
		alert("로그인을 해주세요");
		location.href = "Login.jsp";
	</script>
	<%
			}else{
	%>
				<form name='pwChangeForm' action='pwChange_proc.jsp' method='post'>
				
					<span>아이디</span> <%=" : "+memberDto.getId() %><br>
					<label for="pw">기존 비밀번호</label>
					<input type="password" id="pw" name="pw" placeholder="password"><br>
					<label for="pwNew">변경할 비밀번호</label>
					<input type="password" id="pwNew" name="pwNew" placeholder="new password"><br>
					<label for="pwChk">비밀번호 확인</label>
					<input type="password" id="pwChk" name="pwChk" placeholder="confirm password">
					<button id="pwChangeBtn" type="button" onclick="pwCheck()">비밀번호 변경</button><br>
					<span>이름</span> <%=" : "+memberDto.getName() %><br>
					<span>생년월일</span> <%=" : "+memberDto.getBirth() %><br>
					<span>성별</span> <%=" : "+memberDto.getGender() %><br>
					<span>이메일</span> <%=" : "+memberDto.getEmail() %><br>
					<span>휴대폰번호</span> <%=" : "+memberDto.getPhone() %><br>
				</form>
					
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
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	%>
	
</body>
</html>