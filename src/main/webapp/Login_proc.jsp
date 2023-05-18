<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="park.dao.MemberDao" %>
<%@ page import="park.dto.MemberDto" %>
<%@ page import="park.dto.ManageDto" %>
<%@ page import="park.oracle.AES256" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = memberDao.selectMemberInfoById(id);
		ManageDto manageDto = memberDao.selectManageInfo(id);
		int status = manageDto.getStatus();
		
		boolean chk_result = memberDao.loginCheck(id);
		
		if(!chk_result){
	%>
	
	<script>
			let result = confirm('아이디가 없습니다. 회원가입 하시겠습니까?');
			if(result == true){			
				location.href = 'JoinMember.jsp';
			} else{
				history.go(-1);
			}		
	</script>
	
	<%
		} else{
			switch(status){
			case 1://정상회원 > 로그인 성공
				AES256 aes256 = new AES256();
				String encPw = aes256.encrypt(pw);
				
				if(memberDto.getPassword().equals(encPw)){
					session.setAttribute("user_id", id);
					session.setAttribute("user_name", memberDto.getName());
					session.setMaxInactiveInterval(3600); //1시간
	%>
					<script>
						alert('<%=memberDto.getName() %>님 환영합니다.');
					</script>
	<%	
					Date date = new Date(); //현재시간
					Date date1 = new Date(session.getLastAccessedTime());
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String lastDate = formatter.format(date1);
					memberDao.updateAccessedDate(id, lastDate); //최근접속시간 update
					
					Timestamp pwChnDate = manageDto.getPw_change_date();
					Calendar cal = Calendar.getInstance();
					cal.setTimeInMillis(pwChnDate.getTime());
					cal.add(Calendar.DATE, 90); //pwChnDate+90일
				
					if(date.after(cal.getTime())){
	%>
						<script>
							location.href = 'alertPwChange.jsp';
							//90일 경과 -> 비밀번호 변경 페이지로 이동
						</script>	
	<%
					}else{
	%>
						<script>
							location.href = 'index.jsp'; //로그인 성공 > 메인페이지로 이동
						</script>	
	<%				
					}
				} else{//비밀번호 불일치
	%>
					<script>
						alert('비밀번호가 다릅니다.');
						history.go(-1);
					</script>
	<%			
				}
				break;
			case 2:
	%>
				<form name='tempForm' id='tempForm' action='temp_proc.jsp' method='post'>
					<input type="hidden" id="tempId" name="tempId">
				</form>
				<script>
					let result = confirm('아이디 <%=manageDto.getId()%>는(은) 휴면 계정입니다.\n계정을 활성화하시겠습니까?');
					if(result == true){
						let form = document.tempForm;
						form.submit();						
					}else{						
						history.go(-1);
					}
					
				</script>
	<%
				break;
			case 3:
	%>
				<script>
					alert('아이디 <%=manageDto.getId()%>는(은) 탈퇴 계정입니다.');
					history.go(-1);
				</script>	
	<%
				break;
			default:
	%>
				<script>
					history.go(-1);
				</script>	
	<%
				break;
			}
		}
	%>
</body>
</html>