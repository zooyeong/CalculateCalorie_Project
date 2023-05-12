<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.testdto" %>
<%@ page import="database.testdao" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>5 칼로리</title>
</head>
<body>

<div class="container">
<div class="row">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th style="background-color:#eeeee; text-align: center;">NO</th>
<th style="background-color:#eeeee; text-align: center;">식품코드</th>
<th style="background-color:#eeeee; text-align: center;">식품명</th>
<th style="background-color:#eeeee; text-align: center;">제공량</th>
<th style="background-color:#eeeee; text-align: center;">단백질</th>
<th style="background-color:#eeeee; text-align: center;">지방</th>
<th style="background-color:#eeeee; text-align: center;">탄수화물</th>
<th style="background-color:#eeeee; text-align: center;">CALORIE</th>
</tr>
</thead>
<tbody>
<%
request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
String id = request.getParameter("bbsTitle");

testdao dao = new testdao();
testdto dto = dao.selectPersonInfoById(id);
%>

<% if (dto != null) { %>
	<tr>
    <td><%=dto.getNO()%></td>
    <td><%=dto.get식품코드()%></td>
    <td><%=dto.get식품명()%></td>
    <td><%=dto.get제공량()%></td>
    <td><%=dto.get단백질()%></td>
    <td><%=dto.get지방()%></td>
    <td><%=dto.get탄수화물()%></td>
    <td><%=dto.getCALORIE()%></td>
	</tr>
<% } %>
</tbody>
</table>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <form id="my-form">
       <div>
  <a href="#" class="btn btn-primary center" onclick="rtn()">RESET</a>
</div>
	<!-- form 내용 -->
      </form>
      <button onclick="location.href='Write.jsp'" class="btn btn-primary pull-right">칼로리 입력</button>
    </div>
  </div>
</div>

<script>
function rtn() {
  document.getElementById("rtn-form").reset();
}
</script>




      
   