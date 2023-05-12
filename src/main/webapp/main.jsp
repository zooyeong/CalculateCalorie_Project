<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List" %>
<%@ page import="database.testdto" %>
<%@ page import="database.testdao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
      <thead>
         <tr>
            <th>USER_ID</th>
            <th>Post_NO</th>
            <th>TITLE</th>
            <th>CONTENT</th>
            <th>CREATED_DATE</th>
            <th>UPDATED_DATE</th>
            <th>VIEWS</th>
            <th>TOTAL_LIKE</th>
         </tr>
      </thead>
      <tbody>
         <%
            testdao testDao = new testdao();
            List<testdto>  testdaoList = testDao.selecttestdaofoList();
            
            for(testdto item : testdaoList){
         %>
            <tr>
               <td><%=item.getNO()%></td>
               <td><%=item.get식품코드()%></td>
               <td><%=item.get식품명()%></td>
               <td><%=item.get제공량()%></td>
               <td><%=item.get단백질()%></td>
               <td><%=item.get지방()%></td>
               <td><%=item.get탄수화물()%></td>
               <td><%=item.getCALORIE()%></td>
            </tr>
         <%
            }
         %>
      </tbody>
   </table>
</body>
</html>