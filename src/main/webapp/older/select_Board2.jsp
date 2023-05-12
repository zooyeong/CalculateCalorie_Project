<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="choi.dto.BoardDto"%>
<%@ page import="choi.dao.BoardDao"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>


<%
String uploadPath = request.getRealPath("upload");;

int size = 10 * 1024 * 1024;

String fileename1 = "";
String filename2 = "";

try {
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr", new DefaultFileRenamePolicy());

	Enumeration files = multi.getFileNames();

	String file1 = (String) files.nextElement();
	fileename1 = multi.getFilesystemName(file1);
	//out.println("Uploaded file path: " + uploadPath + "/" + fileename1);
	
	String file2 = (String) files.nextElement();
	filename2 = multi.getFilesystemName(file2);
} catch (Exception e) {
	e.printStackTrace();
}


%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>게시글 등록 & 수정 페이지</title>
<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>


</head>


<body>
	

<form name="write_form" action='write_proc.jsp' method="post" enctype="multipart/form-data"  accept-charset="UTF-8">
		<div class="board_writer_container">
			<div class="board_write">
				<label for="title2"> 제목 
				<input type="text" class="form-control" name="title"
				id="title">
				<textarea id="content" name="content" ></textarea>
  <div>
    <input type="file" name="fileename1" onchange="previewImage(event, 'preview1')">
    <input type="file" name="filename2" onchange="previewImage(event, 'preview2')">
  </div>


<div id="preview1"></div>
<div id="preview2"></div>

			
				<input type="submit" id="insertBtn" value="작성완료">
</div>

	</form>


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
		    preview.appendChild(img);

		    // 이미지와 삭제 버튼을 감싸는 div 생성
		    const container = document.createElement('div');
		    container.className = 'preview-container';
		    container.appendChild(img);

		    // 삭제 버튼 생성
		    const cancelButton = document.createElement('button');
		    cancelButton.type = 'button';
		    cancelButton.textContent = '삭제';
		    cancelButton.onclick = function() {
		      removeImage(container);
		    };

		    // 이미지 경로를 container 객체의 속성으로 저장
		    container.imagePath = '/CalculateCalorie_Project/upload/' + encodeURIComponent(file.name);

		    container.appendChild(cancelButton);

		    // 미리보기 영역에 이미지와 삭제 버튼 추가
		    preview.appendChild(container);

		    // 게시물 내용에 이미지 경로 삽입
		    const content = document.getElementById('content');
		    content.value += '<img src="' + container.imagePath + '">';
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

</body>

</html>