<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<form name='personAddForm' action='addPerson_proc.jsp' method="post">
	<div class="mb-3">
		<label for="formGroupExampleInput2" class="form-label">NAME</label> 
		<input type="text" class="form-control" name="name"
			id="inputName" placeholder="Another input placeholder">
	</div>
	
	<button id="insertBtn" type="button" class="btn btn-primary">추가</button>
	
	</form>


<script>
document.getElementById('insertBtn').addEventListener('click', () => {
	
    let form = document.personAddForm;
    
    let inputName = document.getElementById('inputName');
    if(inputName.value == ""){
    	alert('이름은 필수입니다');
    	inputName.focus();
    } else {
    	if (confirm('추가 하시겠습니까?')) {
	        form.submit();
	    }
    }
});


</script>

</body>
</html>