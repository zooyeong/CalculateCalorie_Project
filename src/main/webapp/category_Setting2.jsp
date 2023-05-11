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
</head>
<body>


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

<form method="post" action="category_Setting5.jsp">
카테고리5<input type="text" name="category5" id="category5" />
<input type="submit" value="설정완료">
</form>

<form method="post" action="write_Board.jsp">
<input type="submit" value="글쓰기 페이지로">
</form>
<%
request.setCharacterEncoding("UTF-8"); //한글 정상 인식을 위해
String category2 = request.getParameter("category2");


CategoryDao categoryDao = new CategoryDao();
categoryDao.category_Update2(category2);

%>

</body>
</html>