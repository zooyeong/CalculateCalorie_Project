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
		
		MemberDao memberDao = new MemberDao();

		int check = memberDao.selectPersonInfoListByIdPw(id, pw);
		
		
		if(check == -1){
	%>
	
	<script>
		let result = confirm('아이디가 없습니다. 회원가입 하시겠습니까?');
		if(result == true){			
			location.href = 'JoinMember.jsp';
		} else{
			location.href = 'Login.jsp';
		}
	</script>
	
	<%
		} else if(check == 0){
	%>
	
	<script>
		alert('비밀번호가 다릅니다');
		location.href = 'Login.jsp';
	</script>
	
	<%} else{ %>
	
	<script>
		alert('로그인 성공');
		location.href = 'index.jsp'; //로그인 성공 -> 메인페이지로 이동(수정해야함)
	</script>
	
	<%} %>
</body>
</html>