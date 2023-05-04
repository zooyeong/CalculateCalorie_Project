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
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = memberDao.selectPersonInfoListById(id);
		
		boolean chk_result = memberDao.loginCheck(id);
		
		if(!chk_result){
	%>
	
	<script>
			let result = confirm('아이디가 없습니다. 회원가입 하시겠습니까?');
			if(result == true){			
				location.href = 'JoinMember.jsp';
			} else{
				history.go(-1);
			}		
	</script>
	
	<%
		} else{
			if(memberDto.getPassword().equals(pw)){
	%>
				
	<script>
				alert('로그인 성공');
	</script>

	<%
				session.setAttribute("user_id", id);
				session.setAttribute("user_name", memberDto.getName());
	%>
	<script>
				location.href = 'index.jsp'; //로그인 성공 -> 메인페이지로 이동(수정해야함)
	</script>	
	<%
			} else{
	%>
	
	<script>
				alert('비밀번호가 다릅니다');
				history.go(-1);
	</script>
	
	<%
			}
		}
	%>
</body>
</html>