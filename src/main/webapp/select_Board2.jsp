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
<style>


label {
	display: block;
	/* 라벨을 블록 요소로 설정하여, 한 줄에 하나씩 표시 */
	margin-bottom: 10px;
	/* 아래쪽 여백 10px 설정 */
	font-size: 18px;
	/* 폰트 크기 설정 */
}

td {
	width: 30px;
	height: 30px;
}

.Calendar {
	text-align: center;
	background-color: white;
	height: auto;
	width: 400px;
	margin: 0 auto;
	border-radius: 5px;
	box-shadow: 0px 40px 30px -20px rgba(0, 0, 0, 0.3);
}

.Calendar>thead>tr:first-child>td {
	font-family: 'Questrial', sans-serif;
	font-size: 1.1em;
	font-weight: bold;
}

.Calendar>thead>tr:last-child>td {
	font-family: 'Questrial', sans-serif;
	font-weight: 600;
}

.Calendar>tbody>tr>td>p {
	font-family: 'Montserrat', sans-serif;
	height: 45px;
	width: 45px;
	border-radius: 45px;
	transition-duration: .2s;
	line-height: 45px;
	margin: 2.5px;
	display: block;
	text-align: center;
}

.pastDay {
	color: lightgray;
}

.today {
	background-color: #F5D042;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

.futureDay {
	background-color: #FFFFFF;
	cursor: pointer;
}

.futureDay:hover {
	background: #eee;
}

.futureDay.choiceDay, .today.choiceDay {
	background: #0A174E;
	color: #fff;
	font-weight: 600;
	cursor: pointer;
}

#content {
	width: 800px;
	height: 300px;
	overflow-y: scroll;
}

.board_write {
	width: 900px;
	height: 550px;
	border: 1px solid black;
}

.board_writer_container {
	width: 900px;
	height: 700px;
	border: 1px solid black;
}

img {
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


<script>
	window.onload = function() {
		buildCalendar();
	} // 웹 페이지가 로드되면 buildCalendar 실행

	let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
	let today = new Date(); // 페이지를 로드한 날짜를 저장
	today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화

	// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
	function buildCalendar() {
		let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
		let lastDate = new Date(nowMonth.getFullYear(),
				nowMonth.getMonth() + 1, 0); // 이번달 마지막날

		let tbody_Calendar = document.querySelector(".Calendar > tbody");
		document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
		document.getElementById("calMonth").innerText = leftPad(nowMonth
				.getMonth() + 1); // 월 숫자 갱신

		while (tbody_Calendar.rows.length > 0) { // 이전 출력결과가 남아있는 경우 초기화
			tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
		}

		let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가           

		for (let j = 0; j < firstDate.getDay(); j++) { // 이번달 1일의 요일만큼
			let nowColumn = nowRow.insertCell(); // 열 추가
		}

		for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay
				.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

			let nowColumn = nowRow.insertCell(); // 새 열을 추가하고

			let newDIV = document.createElement("p");
			newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력

			nowColumn.appendChild(newDIV);

			if (nowDay.getDay() == 6) { // 토요일인 경우
				nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
			}

			if (nowDay > today) {
				newDIV.className = "pastDay";
			}

			else if (nowDay.getFullYear() == today.getFullYear()
					&& nowDay.getMonth() == today.getMonth()
					&& nowDay.getDate() == today.getDate()) { // 오늘인 경우           
				newDIV.className = "today";
				newDIV.onclick = function() {
					choiceDate(this);
				}
			} else {
				newDIV.className = "futureDay";
				newDIV.onclick = function() {
					choiceDate(this);
				}
			}

		}
	}

	// 날짜 선택
	function choiceDate(newDIV) {
		if (document.getElementsByClassName("choiceDay")[0]) { // 기존에 선택한 날짜가 있으면
			document.getElementsByClassName("choiceDay")[0].classList
					.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
		}
		newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가

		//년, 월, 일 데이터 가져오기
		const selectedDate = new Date(nowMonth.getFullYear(), nowMonth
				.getMonth(), newDIV.innerHTML);
		console.log(nowMonth.getFullYear(), (selectedDate.getMonth() + 1),
				selectedDate.getDate());
	}

	// 이전달 버튼 클릭
	function prevCalendar() {
		nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1,
				nowMonth.getDate()); // 현재 달을 1 감소
		buildCalendar(); // 달력 다시 생성
	}
	// 다음달 버튼 클릭
	function nextCalendar() {
		nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1,
				nowMonth.getDate()); // 현재 달을 1 증가
		buildCalendar(); // 달력 다시 생성
	}

	// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
	function leftPad(value) {
		if (value < 10) {
			value = "0" + value;
			return value;
		}
		return value;
	}
</script>
</head>


<body>
	<div>
		<table class="Calendar">
			<thead>
				<tr>
					<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
					<td colspan="5"><span id="calYear"></span>년 <span
						id="calMonth"></span>월</td>
					<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
				</tr>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

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