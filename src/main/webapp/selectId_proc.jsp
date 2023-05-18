<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
<link rel="stylesheet" href="park_align_css.css">
<style>
#container{text-align:center;}
#container button{width:30%; height:50px; font-size:1.5rem; cursor:pointer;}
#container p{margin:50px;}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>
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
<%@ include file = "align.jsp" %>
		<div id="container" style="height:600px; padding-top:50px;">
			<h1>아이디 찾기 결과</h1>
			<p>회원가입 시 사용한 아이디는 <span style="font-weight:bold;"> <%=memberDto.getId() %> </span>입니다.</p>
			<button type="button" onclick="location.href='selectPw.jsp'">비밀번호 찾기</button>
		</div>
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
<%@ include file = "footer.jsp" %>	
</body>
</html>