<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.testdto" %>
<%@ page import="database.testdao" %>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>5 칼로리</title>
</head>
<body>

<div class="container">
<div class="row">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th  style="background-color:#eeeee, text-align: center;">NO</th>
<th  style="background-color:#eeeee, text-align: center;">식품코드</th>
<th  style="background-color:#eeeee, text-align: center;">식품명</th>
<th  style="background-color:#eeeee, text-align: center;">제공량</th>
<th  style="background-color:#eeeee, text-align: center;">단백질</th>
<th  style="background-color:#eeeee, text-align: center;">지방</th>
<th  style="background-color:#eeeee, text-align: center;">탄수화물</th>
<th  style="background-color:#eeeee, text-align: center;">CALORIE</th>
</tr>


<%
request.setCharacterEncoding("UTF-8"); // 한글 정상 인식을 위해
String id = request.getParameter("bbsTitle");

testdao dao = new testdao();
testdto dto = dao.selectPersonInfoById(id);
%>

<% if (dto != null) { %>
    <%=dto.get식품코드()%>
    <%=dto.get식품명()%>
    <%=dto.get제공량()%>
    <%=dto.get단백질()%>
    <%=dto.get지방()%>
    <%=dto.get탄수화물()%>
    <%=dto.getCALORIE()%>
<% } %>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-striped table-hover">
        <thead>
          <!-- 테이블 헤더 내용 -->
        </thead>
        <tobdy>
          <tr>
            <!-- 테이블 내용 -->
          </tr>
        </tobdy>
      </table>
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
  function rtn(){
    if(confirm("내용을 초기화 하시겠습니까?")){
      document.getElementById("my-form").reset(); // form 태그 초기화
      document.getElementById("player_name").focus(); // 이름 입력 필드에 포커스
    }
  }
</script>

<script>
 //Edit icon click event
            document.querySelector(UISelectors.itemList).resetEventListener('click', itemEditClick);
        
            // Update item event
            document.querySelector(UISelectors.updateBtn).resetEventListener('click', itemUpdateSubmit);
        
            // Delete item event
            document.querySelector(UISelectors.deleteBtn).resetEventListener('click', itemDeleteSubmit);
        
             // Back button event
             document.querySelector(UISelectors.backBtn).resetEventListener('click', UICtrl.clearEditState);
        
             // Clear items event
            document.querySelector(UISelectors.clearBtn).resetEventListener('click', clearAllItemsClick);
          }
</script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>