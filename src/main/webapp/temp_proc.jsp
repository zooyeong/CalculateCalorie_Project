<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<%@ page import="park.dto.ManageDto" %>
<%@ page import="park.oracle.AES256" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDao memberDao = new MemberDao();
	String id = request.getParameter("tempId");
	
	Date date = new Date(); //현재시간
	Date date1 = new Date(session.getLastAccessedTime());
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String lastDate = formatter.format(date1);
	memberDao.updateAccessedDate(id, lastDate); //최근접속시간 update
	memberDao.updateStatus1(id); //정상계정으로 status 변경
%>

<script>
	alert('계정이 활성화되었습니다.\n로그인 창으로 이동합니다.');
	location.href = "Login.jsp"
</script>
</body>
</html>