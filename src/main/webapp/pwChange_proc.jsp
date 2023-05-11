<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<%@ page import="park.oracle.AES256" %>
<%@ page import="java.util.*" %>
<%@ page session = "true" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
		
		String user_pw = request.getParameter("pw");
		String user_pwNew = request.getParameter("pwNew");
		
		MemberDao memberDao = new MemberDao();
		AES256 aes256 = new AES256();
			
		String encPw = aes256.encrypt(user_pw);
		String encPwNew = aes256.encrypt(user_pwNew);
		
		boolean result = memberDao.pwCheck(user_id, encPw);
		
		if(result){
			int updateResult = memberDao.updatePassword(user_id, encPwNew);
			
			if(updateResult == 1){
	%>
				<script>
					alert('비밀번호 변경 성공');
				</script>
	<%
				Date date1 = new Date(session.getLastAccessedTime());
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String lastDate = formatter.format(date1);
				memberDao.updateDate(user_id, lastDate);
			} else{
	%>
				<script>
					alert('비밀번호 변경 실패');
				</script>
	<%
			}
		} else{
	%>
			<script>
				alert('비밀번호 변경 실패! 비밀번호가 일치하지 않습니다');
			</script>
	<%		
		}
	%>
	<script>
		location.href = 'mypage.jsp';
	</script>
</body>
</html>