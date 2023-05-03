<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
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
		String email = request.getParameter("email");
		String phoneNum = request.getParameter("phoneNum");
		
		MemberDao memberDao = new MemberDao();
		
		int result = memberDao.insertMemberInfo(id, pw, pwChk, name, birth, gender, email, phoneNum);
		
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
			location.href = 'index.jsp'; //메인페이지로 이동(수정해야함)
		</script>	
</body>
</html>