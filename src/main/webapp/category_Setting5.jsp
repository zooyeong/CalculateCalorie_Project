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
    
}
</style>
</head>
<body>

<div class="container">
<form method="post" action="category_Setting2.jsp">
카테고리2<input type="text" name="category2" id="category2" />
<input type="submit" value="설정완료">
</form>

<form method="post" action="category_Setting3.jsp">
카테고리3<input type="text" name="category3" id="category3" />
<input type="submit" value="설정완료">
</form>

<form method="post" action="category_Setting4.jsp">
카테고리4<input type="text" name="category4" id="category4" />
<input type="submit" value="설정완료">
</form>

<form method="post" action="select_Board2.jsp">
카테고리5<input type="text" name="category5" id="category5" />
<input type="submit" value="설정완료">
</form>


<input type="button" value="창 닫기" onclick="window.close();">

<p> *주의사항* </p>
<p> 카테고리 설정 후 글쓰기 페이지에서 새로고침하여야 적용 됩니다.</p>
</div>

<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String category5 = request.getParameter("category5");


CategoryDao categoryDao = new CategoryDao();
categoryDao.category_Update5(category5);

%>

</body>
</html>