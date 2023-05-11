<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String phoneNum = request.getParameter("phoneNum");
	
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto;
	
	memberDto = memberDao.selectId(name, phoneNum);
	
	boolean result = memberDto == null ? false : true;
	
	if(result){
%>
		<script>
			alert('있음');
		</script>
<%
		String id = memberDto.getId();
		int length = id.length() - 4;
		String answer = "";
		
		for(int i=0; i<length; i++){
			answer += "*";
		}
		
		String resultId = id.substring(0,4) + answer;
		
%>
		<p>회원가입 시 사용한 아이디는 <%=memberDto.getId() %> 입니다.</p>
		<a href="selectPw.jsp">비밀번호 찾기</a>
<%	
	}else{
%>
		<script>
			alert('일치하는 회원 정보가 없습니다');
			location.href = "selectId.jsp"
		</script>
<%
	}
%>
</body>
</html>