<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="database.CalDao" %>
<%@ page import="database.CalDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="park_css.css">
<style>
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
input{text-align:center;}
a{
  color: black;
  cursor: pointer;
  text-decoration: none;
}
h2{
  text-align: center;
  font-family: 'omyu_pretty';
  font-size: 2rem;
}
form{padding:10px !important;}
</style>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		
		CalDao calDao = new CalDao();
		List<CalDto> calDtoList = calDao.selectCalInfoBySpecName(name);
		CalDto calDto = calDao.selectCalInfoByName(name);
		
		if(calDtoList != null){
	%>
			<div id="container">
			<h1>음식찾기</h1>	
			<h2>찾는 음식을 클릭해주세요</h2>
	
	<%
			for(CalDto val : calDtoList){
	%>
				<form id='resultForm'>
				<a href="javascript:void(0);" onclick="returnMain(this)"><%=val.getName() %></a>
				<span style="font-size:0.8rem;">(1인분 당 칼로리 : <%=val.getCalorie() %>)</span>
				</form>
	<%
			}
	%>
			</div>
	<%
		} else{
	%>
			<script>
				alert('일치하는 음식이 없습니다');
				history.go(-1);
			</script>
	<%
		}
	%>
	
	<script>
		function returnMain(obj){
			opener.document.searchForm.name4.value = obj.innerHTML;

			if(opener != null){
				opener.resultForm = null;
				self.close();
			}
		}
		
	
	</script>

</body>
</html>