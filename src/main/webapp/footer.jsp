<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
}
a{text-decoration: none;}
#footer{
  position: relative;
  width: 100%;
  height: 150px;
  background-color: black;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  justify-content: center;
  padding-left:10%;
/*   margin-top:50px; */
}
#footer li{display: inline-flex;}
#footer li a, .footer p{color: white;}
#footer a{font-size: small; color:white;}
#footer p{font-size: small; color:white;}
#sns{
  position: absolute;
  right:10%;
}
</style>
</head>
<body>
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
	    	<a href="">
		    	<img src="img_park/icon_instagram.png" width="20px" style="filter: invert(100%);">
	    		@ovengers_official
	    	</a><br>
	    	<a href="">
		    	<img src="img_park/icon_facebook.png" width="20px" style="filter: invert(100%);">
	    	   	FACEBOOK
	    	</a><br>
	    	<a href="">
		    	<img src="img_park/icon_youtube.png" width="20px" style="filter: invert(100%);">   	
	    		YOUTUBE
	    	</a>


	    </div>	
	</div>
</body>
</html>