<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="choi.dto.BoardDto"%>
<%@ page import="choi.dao.BoardDao"%>
<%@ page import="choi.dto.CategoryDto"%>
<%@ page import="choi.dao.CategoryDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CKEditor</title>
<style>
#editor-container .ql-editor {
  height: 400px;
   }
   
  .write_container {
  height: 700px;
  border : 1px solid black;
 
}
.accordion-item {
  border: 1px solid #ddd;
}

.accordion-header {
  cursor: pointer;
  padding: 10px;
}

.accordion-panel {
  display: none;
  padding: 10px;
}

.accordion-item.active .accordion-panel {
  display: block;
}


</style>

</head>

<body>
<!-- Include stylesheet -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">


<div class="write_container">


<input type="button" value="카테고리 설정" onclick="window.location.href='category_Main.jsp'" />
<select>
  <% CategoryDao categoryDao = new CategoryDao();
  List<CategoryDto> categoryList = categoryDao.categoryList();
  for(CategoryDto categoryDto : categoryList){ %>
  	<option>카테고리 선택</option>
    <option><%=categoryDto.getCategory2()%></option>
    <option><%=categoryDto.getCategory3()%></option>
    <option><%=categoryDto.getCategory4()%></option>
    <option><%=categoryDto.getCategory5()%></option>
  <% } %>
</select>

<form method="post" action="write_Board_Proc.jsp">


<input type="text" name="title" id="title" placeholder="제목" />

<!-- Create the editor container -->
<div id="editor-container"></div>
<input type="hidden" name="content" id="content" />
<input type="submit" value="등록" />
<input type="button" value="취소" onclick="window.location.href='https://www.naver.com'" />
</form>
</div>


<!-- Include the Quill library -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>


<!-- Initialize Quill editor -->
<script>
  var quill = new Quill('#editor-container', {
    modules: {
      toolbar: [
        [{ header: [1, 2, false] }],
        ['bold', 'italic', 'underline'],
        ['image', 'code-block']
      ]
    },
    placeholder: 'Compose an epic...',
    theme: 'snow'
  });
 
  var form = document.querySelector('form');
  form.onsubmit = function() {
    var content = document.querySelector('#editor-container .ql-editor').innerHTML;
    document.querySelector('#content').value = content;
  }
</script>
</body>
</html>