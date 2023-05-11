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
	String name = request.getParameter("name");
	String phoneNum = request.getParameter("phoneNum");
	
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto;
	
	memberDto = memberDao.selectPw(id, name, phoneNum);
	
	boolean result = memberDto == null ? false : true;
	
	if(result){
		String pw = memberDto.getPassword();
		AES256 aes256 = new AES256();
		String decPw = aes256.decrypt(pw);
		
		int length = decPw.length() - 4;
		String answer = "";
		
		for(int i=0; i<length; i++){
			answer += "*";
		}
		
		String resultPw = decPw.substring(0,4) + answer;
%>
		<p>회원가입 시 사용한 비밀번호는 <%=resultPw %> 입니다.</p>
		<a href="Login.jsp">로그인하러 가기</a>
<%	
	}else{
%>
		<script>
			alert('일치하는 회원 정보가 없습니다');
			location.href = "selectPw.jsp"
		</script>
<%
	}
%>
</body>
</html>