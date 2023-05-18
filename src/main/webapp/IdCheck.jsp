<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
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
#container{
  margin: 0 auto;
  text-align:center;
  font-family: 'omyu_pretty';}
#checkForm input{
  width:60%;
  height: 30px;
  margin: 5px;
  padding: 0 5px;
  font-family: 'omyu_pretty';
  font-size:1.3rem;}
#useBtn, #cancleBtn, #idChk{
  margin: 30px 0;
  display:inline-block;
  width: 30%;
  height: 30px;
  cursor: pointer;
  background-color:black;
  color: white;
  font-family: 'omyu_pretty';
  font-size:1.2rem;
  border-radius:5px;}
#msg{margin-top:30px; font-size:1.2rem;}
</style>
</head>
<body onload="pValue()">

	<div id="container">
		<h2>아이디 중복체크</h2>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="id" id="userid">
				<input type="hidden" id="idChk" value="중복확인" onclick="idDuplicateChk()">
			</form>
			<div id="msg"></div>
			<input type="button" id="useBtn" value="사용" onclick="sendCheckValue()">
			<input type="button" id="cancleBtn" value="취소" onclick="window.close()">
		</div>
	</div>
	
	<%
	request.setCharacterEncoding("UTF-8");
	
	MemberDao memberDao = new MemberDao();
	
	String id = request.getParameter("userid");
	
	boolean result = memberDao.loginCheck(id);
	
	if(result){
	%>
	
	<script>
		alert("사용할 수 없는 아이디입니다");
		document.getElementById("msg").innerHTML = "사용할 수 없는 아이디입니다"
		document.getElementById("idChk").type = "button";
		document.getElementById("useBtn").type = "hidden";
	</script>
	
	<%} else{ %>
	
	<script>
		alert("사용 가능한 아이디입니다");
		document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다";
		console.log(document.getElementById("userid").value);
		document.getElementById("useBtn").value = "이 ID 사용하기";
	</script>
	
	<%} %>
	
	<script>
		function pValue(){
			document.getElementById("userid").value 
				= opener.document.joinMemberForm.inputId.value;
		}
		
		function sendCheckValue(){
			opener.document.joinMemberForm.inputId.value = document.getElementById("userid").value;
			opener.document.joinMemberForm.idDuplication.value = "idCheck";
			opener.document.joinMemberForm.inputPw.focus();
			if(opener != null){
				opener.chkForm = null;
				self.close();
			}
		}
		
		function idDuplicateChk(){
			opener.document.joinMemberForm.inputId.value = document.getElementById("userid").value;
			location.href = "IdCheck.jsp?userid="+document.getElementById("userid").value;
		}
	</script>
</body>
</html>