<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<th colspan="2" style="background-color: #eeeee; text-align: center;">먹자 먹자</th> 	<!-- 가운데로 옮겨야함.. 성공 무야호!-->
</tr>
</thead>
<tbody>
<tr>
<td>
<form method="post" action="bbs.jsp">
  <input type="text" class="form-control breakfast" placeholder="아침 식사" name="breakfast" maxlength="50">
  <input type="text" class="form-control lunch" placeholder="점심 식사" name="lunch" maxlength="50">
  <input type="text" class="form-control dinner" placeholder="저녁 식사" name="dinner" maxlength="50">
  <input type="text" class="form-control other" placeholder="기타" name="other" maxlength="50">
  <input type="text" class="form-control snack" placeholder="간식" name="snack" maxlength="50">
  <input type="submit" class="btn btn-primary pull-right" value="음식 입력">
</form>
</tr>
<tr>
<!--  <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2500" style="height:350px;"></textarea></td> 		-->
</tr>
</tbody>
</table>

</div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>