<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="choi.dto.BoardDto"%>
<%@ page import="choi.dao.BoardDao"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="choi.dto.CategoryDto"%>
<%@ page import="choi.dao.CategoryDao"%>

<%
String uploadPath = request.getRealPath("upload");;

int size = 10 * 1024 * 1024;

String fileename1 = "";

try {
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr", new DefaultFileRenamePolicy());

	Enumeration files = multi.getFileNames();

	String file1 = (String) files.nextElement();
	fileename1 = multi.getFilesystemName(file1);
	//out.println("Uploaded file path: " + uploadPath + "/" + fileename1);
	
} catch (Exception e) {
	e.printStackTrace();
}


%>
<!DOCTYPE html>

<head>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
  <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<meta charset="UTF-8">
<title>게시글 등록 & 수정 페이지</title>
<style>

.filebox label {
  display: flex; /* 수평/수직 가운데 정렬 적용 */
  justify-content: center;
  align-items: center; /* 수직 가운데 정렬 적용 */
  color: #fff;
  background-color: #999999;
  cursor: pointer;
  height: 40px;
  width: 1130px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

#editor-container {
	height:430px;
	width:1130px;
}

.ql-toolbar {
  width: 1130px;
}

.custom-btn {
  width: 130px;
  height: 40px;
  border-radius: 5px;
  background: transparent;
  cursor: pointer;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
}

.bodyContainer {
	width: 100%;
	display:flex;
	justify-content: center;
  align-items: center;
}

#preview1 {
  width: 1130px;
  height: 120px;
  overflow: hidden; /* 크기를 벗어나는 부분은 숨기도록 지정 */
  display: flex;
  justify-content: center;
  align-items: center;
  border: 1px solid gray;
  margin: 0 auto;
}

#preview1 img {
  max-width: 100px;
  max-height: 100px;
}

.delete-button{
width:30px;
height:15px;
}

#title{
width:935px;
height:30px;
}

.centeralign {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  margin-top:50px;
}

#catesele{
height:30px;
}
#catesele1 {
height:30px;
}

.wc{
	display:flex;
	justify-content: center;
  align-items: center;
  margin-top:30px;
  margin-bottom: 60px;
  gap:50px;
}


</style>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>


</head>


<body>

<%@ include file = "header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	session = request.getSession();
	String userId = request.getParameter("user_id");
	String userId2 = (String)session.getAttribute("user_id");
%>
<%
  if(userId2 == null) {
%>
  <script>
    alert("로그인 하십시오.");
    location.href = "Login.jsp";
  </script>
<%
    return;
  }
%>


<% if (!userId2.equals(userId)) { %>
  <script>
    alert("접근할 수 없습니다.");
    location.href = "Login.jsp";
  </script>
<%
    return;
  }
%>

<% 
String postNoParam = request.getParameter("post_no");
int post = Integer.parseInt(postNoParam);
%>

<form name="write_form" id="write_form" action='write_Board_Proc.jsp?post_no=<%=post%>' method="post" enctype="multipart/form-data"  accept-charset="UTF-8">
	<div class="centeralign">
	<div class="bodyContainer">

	<input type="button" id="catesele" value="카테고리 설정" onclick="window.open('category_Main.jsp', '카테고리 설정', 'width=400,height=400');">
	
	<select id="catesele1" name="category">
    <% CategoryDao categoryDao = new CategoryDao();
    List<CategoryDto> categoryList = categoryDao.categoryList(userId2);%>
    <option disabled selected>카테고리 선택</option>
    <%for(CategoryDto categoryDto : categoryList){ %>
    
    <option ><%= categoryDto.getCategory2() %></option>
    <option ><%= categoryDto.getCategory3() %></option>
    <option ><%= categoryDto.getCategory4() %></option>
    <option ><%= categoryDto.getCategory5() %></option>
    <% } %>
</select>




<input type="text" name="title" id="title" placeholder="제목" />
</div>

<!-- Create the editor container -->
<div id="editor-container"></div>

<input type="hidden" name="content" id="content" />

  <div class="filebox">
  <input type="file" name="fileename1" onchange="previewImage(event, 'preview1')" id="fileename1">
    <label for="fileename1">이미지첨부</label> 
    
  </div>
</div>

<div id="preview1"></div>
  <div class="wc">
    <input type="submit" value="등록" class="bTn custom-btn" onclick="validateForm(event)" />
    <input type="button" value="취소" class="bTn custom-btn" onclick="window.location.href='https://www.naver.com'" />
  </div>
</form>

<script>
  function validateForm(event) {
    var selectedOption = document.getElementById("catesele1").value;
    if (selectedOption === "카테고리 선택") {
      event.preventDefault(); // 기본 제출 동작을 막습니다.
      alert("옵션을 선택해주세요!"); // 경고창을 띄웁니다.
    }
  }
</script>


<!-- Initialize Quill editor -->
<script>
  var quill = new Quill('#editor-container', {
    modules: {
      toolbar: [
        [{ header: [1, 2, false] }],
        ['bold', 'italic', 'underline']  
      ]
    },
    placeholder: 'Compose an epic...',
    theme: 'snow'
  });
 
  document.querySelector('#write_form').onsubmit = function() {
	    var content = quill.root.innerHTML;
	    document.querySelector('#content').value = content;
	  };
</script>

<script>
	document.getElementById('insertBtn').addEventListener('click', () => {
		
	    let form = document.personAddForm;
	    
	    let inputName = document.getElementById('title');
	    if(inputName.value == ""){
	    	alert('이름은 필수입니다');
	    	inputName.focus();
	    } else {
	    	if (confirm('추가 하시겠습니까?')) {
		        form.submit();
		    }
	    }
	});
	
	function previewImage(event, previewId) {
		  var input = event.target;
		  if (input.files.length > 1) {
		    input.value = null; // 파일 선택 초기화
		    alert("한 개의 파일만 첨부할 수 있습니다.");
		    return;
		  }
		  
		  // 파일 선택자 엘리먼트
		  const fileInput = event.target;

		  // 미리보기할 이미지가 들어갈 엘리먼트
		  const preview = document.getElementById(previewId);

		  // 선택한 파일 객체
		  const file = fileInput.files[0];

		  // FileReader 객체 생성
		  const reader = new FileReader();

		  // 파일 읽기가 완료되면 호출될 함수
		  reader.onload = function(event) {
		    // 이미지 삽입
		    const img = document.createElement('img');
		    img.src = event.target.result;
		    preview.innerHTML = '';
		    preview.appendChild(img);

		    // 이미지와 삭제 버튼을 감싸는 div 생성
		    const container = document.createElement('div');
		    container.className = 'preview-container';
		    container.appendChild(img);

		    // 삭제 버튼 생성
		    const cancelButton = document.createElement('button');
		    cancelButton.type = 'button';
		    cancelButton.textContent = '삭제';
		    cancelButton.className = 'delete-button';
		    cancelButton.onclick = function() {
		      removeImage(container);
		    };

		    // 이미지 경로를 container 객체의 속성으로 저장
		    container.imagePath = '/CalculateCalorie_Project/upload/' + encodeURIComponent(file.name);

		    container.appendChild(cancelButton);

		    // 미리보기 영역에 이미지와 삭제 버튼 추가
		    preview.appendChild(container);

		    // 게시물 내용에 이미지 경로 삽입
		    //const content = document.getElementById('content');
		    // content.value += '<img src="' + container.imagePath + '">';
		  };

		  // 파일을 읽기 시작
		  reader.readAsDataURL(file);
		}

		function removeImage(container) {
		  // input file 초기화
		  const fileInput = document.querySelector('input[type="file"]');
		  fileInput.value = '';

		  // 미리보기 이미지 삭제
		  container.parentElement.removeChild(container);

		  // textarea에서 이미지 태그 삭제
		  const content = document.getElementById('content');
		  if (container.imagePath) {
		    content.value = content.value.replace('<img src="' + container.imagePath + '">', '');
		  }
		}
		
	
		
	</script>
<%@ include file = "footer.jsp" %>
</body>

</html>