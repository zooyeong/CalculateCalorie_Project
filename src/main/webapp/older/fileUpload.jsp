<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%
String uploadPath = request.getRealPath("upload");


int size = 10 * 1024 * 1024;

String fileename1 = "";
String filename2 = "";

try {
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr", new DefaultFileRenamePolicy());

	Enumeration files = multi.getFileNames();

	String file1 = (String) files.nextElement();
	fileename1 = multi.getFilesystemName(file1);
	
	String file2 = (String) files.nextElement();
	filename2 = multi.getFilesystemName(file2);
} catch (Exception e) {
	e.printStackTrace();
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
	img{
	width: 100px;
	height: 100px; 
	}
	
	.container {
		position: relative;
		display: inline-block;
		margin-right: 10px;
	}
	
	.container img {
		width: 100px;
		height: 100px;
	}
	
	.container .cancel {
		position: absolute;
		top: -10px;
		right: -10px;
		background-color: #ccc;
		border-radius: 50%;
		width: 20px;
		height: 20px;
		font-size: 16px;
		font-weight: bold;
		text-align: center;
		cursor: pointer;
	}
	

</style>


</head>
<body>

	<form name="fileUpload" method="post" enctype="multipart/form-data">

<div class="container">
		<img  src="upload/<%=fileename1%>"> 
		<div  class="cancel" onclick="removeImage(this)">x</div>
	</div>
	<div class="container">
		<img  src="upload/<%=filename2%>">
		<div  class="cancel" onclick="removeImage(this)">x</div>
	</div>
		
		
	<div>
		<input type="file" name="fileename1"> 
		<br>
		<input type="file" name="filename2">
		<input type="submit" value="이미지 업로드">
	</div>

	</form>

<script>
	function removeImage(cancelButton) {
		var container = cancelButton.parentElement;
		var imgSrc = container.querySelector("img").src;
		container.parentElement.removeChild(container);
	}
</script>

</body>
</html>