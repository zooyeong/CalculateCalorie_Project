<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<%@ page import="park.oracle.AES256" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwChk = request.getParameter("pwChk");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email")
				+ "@" + request.getParameter("emailaddress");
		String phoneNum = request.getParameter("phoneNum");
		
		String agree1 = request.getParameter("agree1");
		String agree2 = request.getParameter("agree2");
		String agree3 = request.getParameter("agree3");
		
		AES256 aes256 = new AES256();
		String encPw = aes256.encrypt(pw);
		String encPwChk = aes256.encrypt(pwChk);
		
		MemberDao memberDao = new MemberDao();
		
		int result = memberDao.insertMemberInfo(id, encPw, encPwChk, name, birth, gender, email, phoneNum);
		memberDao.insertJoinDate(id);
		
		memberDao.insertAgreeCheck(id, agree1, agree2, agree3);
		
		if(result == 1){
	%>
	
		<script>
			alert('회원가입 성공');
		</script>
	<%
		}else{
	%>
		<script>
			alert('회원가입 실패');
		</script>
	<% } %>
		<script>
			location.href = 'Login.jsp';
		</script>	
</body>
</html>