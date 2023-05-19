<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="choi.dto.BoardDto" %>
<%@ page import="choi.dao.BoardDao" %>
<%@ page import="choi.dto.CategoryDto" %>
<%@ page import="choi.dao.CategoryDao" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Board List</title>
	<style>
		body {
			height: 1000px;
			position: relative;
		}

		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
			list-style: none;
		}

		a {
			text-decoration: none;
		}

		#footer {
			position: absolute;
			bottom: 0;
			width: 100%;
			height: 150px;
			background-color: black;
			display: flex;
			flex-wrap: wrap;
			flex-direction: column;
			justify-content: center;
			padding-left: 10%;
			margin-top: 50px;
			/*   margin-top:50px; */
		}

		#footer li {
			display: inline-flex;
		}

		#footer li a,
		.footer p {
			color: white;
		}

		#footer a {
			font-size: small;
			color: white;
		}

		#footer p {
			font-size: small;
			color: white;
		}

		#sns {
			position: absolute;
			right: 10%;
		}

		th {
			height: 50px;
			border-top: 1px solid rgb(141, 139, 139);
			border-bottom: 1px solid rgb(141, 139, 139);
		}

		td {
			text-align: center;
			height: 40px;
			border-bottom: 1px solid rgb(190, 189, 189);
		}

		.leftAlign {
			text-align: left;
			height: 40px;
			border-bottom: 1px solid rgb(190, 189, 189);
			display: flex;
		}

		.id_width {
			width: 120px;
			text-align: center;
		}

		.post_width {
			width: 90px;
			text-align: center;
		}

		.category {
			width: 120px;
			text-align: center;
		}

		.title_width {
			width: 450px;
			text-align: center;
		}

		.create_width {
			width: 150px;
			text-align: center;
		}

		.view_width {
			width: 80px;
			text-align: center;
		}

		.like_width {
			width: 120px;
			text-align: center;
		}

		table {
			margin: 0 auto;
		}

		.cate_right_Button {
			display: flex;
			height: 50px;
			width: 1240px;
		}

		.category_button {
			display: flex;
			justify-content: left;
			margin-right: 40px;
			height: 50px;
			width: 640px;
			align-items: center;
			margin-left: 60px;
		}

		.right_button {
			display: flex;
			justify-content: end;
			margin-right: 40px;
			height: 50px;
			width: 600px;
			align-items: center;
		}

		.page_no_Link {
			display: flex;
			justify-content: center;
			gap: 10px;
			/* 각 아이템 사이의 간격을 10px로 설정합니다 */
		}

		.colorBlue {
			color: blue;
			font-size: 14px;
			font-weight: bold;
		}

		.rightRight {
			height: 100%;
			margin-right: 20px;
			display: flex;
			align-items: center;
			gap: 7px;
		}

		.page_no_Link {
			margin-top: 10px;
			margin-bottom: 50px;
		}
	</style>
</head>

<body>

	<%@ include file="header.jsp" %>
	
	<%-- 파라미터ID & 세션ID 변수 지정  --%>
	<% request.setCharacterEncoding("UTF-8"); session=request.getSession(); 
		String userId=request.getParameter("user_id"); 
		String userId2=(String)session.getAttribute("user_id"); %>
		
	<%--  세션아이디 유무로 로그인 확인  --%>	
	<% if(userId2==null) { %>
		<script>
			alert("로그인 하십시오.");
			location.href = "Login.jsp";
		</script>
	<% return; } %>
	
	<table>
		<thead>
			<tr>
				<th class="id_width">아이디</th>
				<th class="post_width">글 번호</th>
				<th class="category">카테고리</th>
				<th class="title_width">제목</th>
				<th class="create_width">작성일</th>
				<th class="view_width">조회수</th>
				<th class="like_width">추천</th>
			</tr>
		</thead>
		
		<tbody>
			<div class="cate_right_Button">
			
			<%--  세션아이디 유무로 로그인 확인  --%>  
				<div class="category_button">
					<% CategoryDao categoryDao=new CategoryDao(); 
					List<CategoryDto> categoryList = categoryDao.categoryList(userId);%>
					<%for(CategoryDto categoryDto : categoryList){ %>
						<form action="list_Board.jsp?user_id=<%=user_id%>&page=1" method="post">
							<button type="submit" name="category" value="<%= categoryDto.getCategory2() %>">
								<%= categoryDto.getCategory2() %>	
							</button>
						</form>
						<form action="list_Board.jsp?user_id=<%=user_id%>&page=1" method="post">
							<button type="submit" name="category" value="<%= categoryDto.getCategory3() %>">
								<%= categoryDto.getCategory3() %>					
							</button>						
						</form>											
						<form action="list_Board.jsp?user_id=<%=user_id%>&page=1" method="post">
							<button type="submit" name="category" value="<%= categoryDto.getCategory4() %>">
								<%= categoryDto.getCategory4() %>					
							</button>						
						</form>						
						<form action="list_Board.jsp?user_id=<%=user_id%>&page=1" method="post">
							<button type="submit" name="category" value="<%= categoryDto.getCategory5() %>">
								<%= categoryDto.getCategory5() %>					
							</button>						
						</form>							
					<% } %>									
				</div>
							
				<div class="right_button">
					<% if (userId2.equals(userId)) { %>				
					<button onclick="location.href='select_Board2.jsp?user_id=<%=userId2%>'">글쓰기</button><% } %>					
				</div>
				
			</div>														
			<% String pageNoStr=request.getParameter("page"); int pageNo=Integer.parseInt(pageNoStr);
			   String category=request.getParameter("category"); BoardDao boardDao=new BoardDao();
			   List<BoardDto> boardList;

			   if (category != null && !category.isEmpty()) {
				   boardList = boardDao.boardCategory(userId, pageNo, category);				 
			   } else {				
				   boardList = boardDao.boardInfoList(userId, pageNo);			
			   }	
			   
			   for(BoardDto item : boardList) { 			
			   String imgYes=item.getContent_img();
			   if (imgYes !=null && !"<img src='upload/null' />".equals(imgYes)) {
			   		imgYes="<img src='https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.icons8.com%2Fcolor%2F452%2Fpaint-net.png&type=sc960_832' width='20' height='20'>";						
		       } else { 
			   		imgYes="" ; } %>							
				<tr>
					<td><%=userId%></td>
					<td><%=item.getPost_no()%></td>
					<td><%=item.getCategory()%></td>
					
					<td class="leftAlign"><a href="read_Board.jsp?post_no=<%=item.getPost_no()%>&user_id=<%=userId%>">
					<%-- 제목 --%>
						<div class=rightRight><%=item.getTitle()%>
					<%-- 이미지  --%>
							<div class=rightRight><%= imgYes %></div>
						</div>
					</a></td>
					
					<td><%=item.getCreated_date()%></td>
					<td><%=item.getViews()%></td>										
					<td class="colorBlue"><% int like=item.getTotal_like(); %>									
						<% if (like !=0) { %>									
						<%=like%>										
						<% } else { } %>									 									
					</td>										
				</tr>											
				<% } %>												
		</tbody>													
	</table>														
														
	<% int pageSize=10; int totalCount=boardDao.page_No(userId); int totalPageCount=(int)
	   Math.ceil((double) totalCount / pageSize); %>
		<div class="page_no_Link">											
		<% for (int i=1; i <=totalPageCount; i++) { String pageLink="?page=" + i + "&user_id=" + userId; if (category !=null && !category.isEmpty()) { pageLink +="&category=" + category; } %>
			<a class="spaceBar" href="<%= response.encodeURL(pageLink) %>">[<%= i %>]</a>
		<% } %>																											
		</div>												
						
		<div id="footer">
			<ul>
				<li><a href="">개인정보처리방침 | </a></li>
				<li><a href="">서비스이용약관 | </a></li>
				<li><a href="">멤버십이용약관 | </a></li>
				<li><a href="">주디카드이용약관 | </a></li>
				<li><a href="">고객문의 | </a></li>
				<li><a href="">고객설문 | </a></li>
				<li><a href="">사이트맵 | </a></li>
				<li><a href="">BI 소개</a></li>
			</ul>			

			<p>법인명 : (주)오컴퍼니 대표자 : 오조원 사업자등록번호 : 961-11-59611 고객센터 : 1544-9611</p>				
			<p>주소 : 충청남도 천안시 동남구 대흥로 215 대표전화 : 1544-9611 가맹문의 : 1544-1196</p>
			<p>COPYRIGHTⓒ 2015 OCOMPANY ALL RIGHTS RESERVED</p>
			<div id="sns">
				<a href=""><img src="img_park/icon_instagram.png" width="20px" style="filter: invert(100%);">
				@ovengers_official</a><br>
				<a href=""><img src="img_park/icon_facebook.png" width="20px" style="filter: invert(100%);">
				FACEBOOK</a><br>
				<a href=""><img src="img_park/icon_youtube.png" width="20px" style="filter: invert(100%);">
				YOUTUBE</a>
			</div>							
		</div>								
													
</body>

</html>