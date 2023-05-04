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
	%>
	
	<span>아이디</span> <%=" : "+memberDto.getId() %><br>
	<label for="pw">기존 비밀번호</label>
	<input type="password" id="pw" name="pw" placeholder="password"><br>
	<label for="pwNew">변경할 비밀번호</label>
	<input type="password" id="pwNew" name="pwNew" placeholder="new password"><br>
	<label for="pwChk">비밀번호 확인</label>
	<input type="password" id="pwChk" name="pwChk" placeholder="confirm password">
	<button id="pwChangeBtn" type="button">비밀번호 변경</button><br>
	<span>이름</span> <%=" : "+memberDto.getName() %><br>
	<span>생년월일</span> <%=" : "+memberDto.getBirth() %><br>
	<span>성별</span> <%=" : "+memberDto.getGender() %><br>
	<span>이메일</span> <%=" : "+memberDto.getEmail() %><br>
	<span>휴대폰번호</span> <%=" : "+memberDto.getPhone() %><br>
		
	<script>
		document.getElementById('pwChangeBtn').addEventListener('click', ()=>{
			location.href = 'pwChange_proc.jsp';
		});
	</script>	
</body>
</html>