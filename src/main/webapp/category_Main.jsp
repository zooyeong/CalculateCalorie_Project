<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="choi.dto.CategoryDto"%>
<%@ page import="choi.dao.CategoryDao"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.container{
display:flex;
	flex-direction: column;
	align-items: center; /* 수평 가운데 정렬 적용 */
	justify-content: center; /* 상하 가운데 정렬 적용 */
	width:400px;
	height:300px;
}

.container2{
	display:flex;
	flex-direction: column;
	align-items: center; /* 수평 가운데 정렬 적용 */
	justify-content: center;
	width:400px;
	height:100px;
	border-top:1px solid black;
}

.container form {
margin-top:10px;
}


</style>

</head>
<body>

<div class="container">

<h1>Category Setting</h1>
<%//카테고리 설정 입력 받기 %>
<form method="post" action="category_Setting2.jsp">
<input type="text" name="category2" id="category2" placeholder="Category1" />
<input type="submit" value="설정완료">
</form>
<%//카테고리 설정 입력 받기 %>
<form method="post" action="category_Setting3.jsp">
<input type="text" name="category3" id="category3" placeholder="Category2" />
<input type="submit" value="설정완료">
</form>
<%//카테고리 설정 입력 받기 %>
<form method="post" action="category_Setting4.jsp">
<input type="text" name="category4" id="category4" placeholder="Category3" />
<input type="submit" value="설정완료">
</form>
<%//카테고리 설정 입력 받기 %>
<form method="post" action="category_Setting5.jsp">
<input type="text" name="category5" id="category5" placeholder="Category4" />
<input type="submit" value="설정완료">
</form>
<br>
<input type="button" value="초기화" onclick="var resetWindow = window.open('reset_categories.jsp', 'reset_categories_window', 'width=280,height=50'); window.close(); ">
<input type="button" value="창 닫기" onclick="window.close();">
</div>

<div class="container2">
<p> *주의사항* </p>
<p> 카테고리를 처음 설정하신다면 초기화를 눌러주세요.</p>

</div>
<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String userId2 = (String)session.getAttribute("user_id");

CategoryDao categoryDao = new CategoryDao();
categoryDao.category_default_Insert(userId2);
%>

</body>
</html>