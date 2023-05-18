<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
  font-family: 'omyu_pretty';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
  font-weight: normal;
  font-style: normal;
}
*{
  margin:0; 
  padding:0;
  box-sizing: border-box;
  list-style: none;
}
li{list-style-type: none;}
a{text-decoration: none; color: black;}
#logo{
  float: left;
  border-bottom:solid 2px black;
  border-top:solid 2px black;
  border-radius:20px;
  padding: 5px;}
#logoText{
  font-family: 'omyu_pretty';
  font-weight: 900;
  font-size: 3rem;
}
#nav{
  float: right;
  font-family: 'omyu_pretty';
  font-weight: 900;
  font-size: 1.5rem;
}
#header{
  height: 200px;
  padding: 50px;
  content: '';
  display: block;
  clear: both;
}
.nav_item{
  display: inline-block;
  margin-left: 50px;
}
button{
  font-family: 'omyu_pretty';
  background-color:black;
  border-radius:0.2rem;
  color:white;
  width:70px;
  height:30px;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	session = request.getSession();
	String user_id = (String)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
%>

	<div id="header">
		<div id="logo"><a href="index.jsp" id="logoText">OVENGERS</a></div>
		<div id="nav">		
			<ul>
				<li class="nav_item" id="login"><a href="Login.jsp">로그인</a></li>
				<li class="nav_item" id="user_name" style="display: none"><span><%=user_name%> 님</span></li>
				<li id="logout" style="display: none"><form name="logoutCheckForm" action="logout_proc.jsp" method="post"><button type="button" id="logoutBtn">로그아웃</button></form>
				<li class="nav_item"><a href="mypage.jsp">마이페이지</a></li>
				<li class="nav_item"><a href="joinAgree.jsp">회원가입</a></li>
				<li class="nav_item"><a href="list_Board.jsp?user_id=<%=user_id%>&page=1">다이어리</a></li>
				<li class="nav_item"><a href="">고객센터</a></li>
			</ul>
		</div>
	</div>
	
<%
	boolean login = user_id == null ? false : true;
	
	if(login){
%>
		<script>
			document.getElementById('login').style.display='none';
			document.getElementById('user_name').style.display='inline-block';
			document.getElementById('logout').style.display='inline-block';
			
			document.getElementById('logoutBtn').addEventListener('click', ()=>{
				let form = document.logoutCheckForm;
					
				if(confirm('로그아웃 하시겠습니까?')){
					form.submit();
				}
			});
		</script>
<% } %>
	
	
</body>
</html>