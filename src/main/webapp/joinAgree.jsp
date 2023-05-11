<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
      <form name='joinAgreeForm' action='JoinMember.jsp' method='post'>
        <h1>약관 동의</h1>
        <div>
          <img src="" alt="">
          <p>회원가입 약관동의 및 본인인증단계입니다.</p>
        </div>

        <div>
          <section>
            <h4>모두 동의<input type="checkbox" id="agreeAll"></h4>
          </section>
          <section>
            <h4>홈페이지 이용약관 동의<span>(필수)</span><input type="checkbox" id="agree1" name="agree" value="1"></h4>

            <div>
              <p>본 약관은 오컴퍼니 홈페이지 서비스 이용과 관련하여 필요한 사항을 규정합니다.<br><br>
                제 1 조 목적<br><br>
                1. 오컴퍼니를 운영하는 주식회사 오컴퍼니(이하 '회사'라고 합니다)에서 운영하는 홈페이지 (https://www.ohcompany.co.kr/, 이하 “홈페이지”라고 합니다)는 아래와 같은
                약관에 동의하는 이용자들에게 제공되는 인터넷서비스로, 본 약관은 이용자와 회사 사이에 본 홈페이지 이용에 관한 권리 및 의무를 규정하는 것을 목적으로 합니다.<br><br>
                2. 홈페이지의 모든 자료는 ohcompany 및 자회사, 계열사 혹은 ohcompany에 의해 자격을 취득한 기타 이해 관계자에 의한 저작권, 등록의장, 등록상표 또는 기타
                지적소유권으로 보호되고 있습니다.<br><br>
                3. 본 홈페이지에 포함된 자료는 이용자에게 정보 제공을 위한 목적으로만 제공됩니다. 이용자는 본 홈페이지의 내용에 대하여 어떤 방법으로도 배포, 출판, 전송, 변경, 전시, 모방작품의
                창조 혹은 개발할 수 없습니다. 이용자는 회사의 권한을 보호하여야 하고, 본 홈페이지의 자료를 허가 없이 유용할 수 없습니다. 허가 없이 본 홈페이지의 내용을 유용하는 경우에 회사와
                ohcompany는 이용자에게 법적, 재정적으로 가능한 기타 추가적인 배상을 청구할 수 있습니다.<br><br>
                4. 이용자가 제출하는 자료의 내용에 대한 책임은 전적으로 이용자에게 있습니다. 이용자가 제출하는 자료에 불법, 중상모략, 비난 혹은 비도덕적인 내용이 포함되어서는 안됩니다. 이용자는 본
                홈페이지에 저작권, 등록상표권, 사생활권 혹은 기타 사적 권리 혹은 소유권을 포함하는 제3자의 권리를 침해하는 어떤 자료도 게시하여서는 안됩니다.<br><br>
                5. 이용자의 개인정보 보호 및 보안, 개인정보에 대한 수집, 이용 및 저장과 관련한 관행 및 정책에 대하여는 회사의 개인정보 처리방침에 의합니다. 개인정보 처리방침은 홈페이지에 별도
                게시하고 있습니다.
              </p>

            </div>
          </section>

          <section>
            <h4>개인정보 수집 및 이용동의<span>(필수)</span><input type="checkbox" id="agree2" name="agree" value="2"></h4>
            <div>
              <p>
                본인은 오컴퍼니를 운영하는 주식회사 오컴퍼니(이하 '회사'라 합니다)가 제공하는 회원 서비스(이하 ‘서비스’라 합니다)를 이용하기 위해, 다음과 같이 ‘회사’가 본인의 개인정보를
                수집/이용하는 것에 동의합니다.<br><br>

                ※ 귀하께서는 개인정보 수집·이용에 대한 동의를 거부하실 수 있으나, 동의를 거부하실 경우 회원가입, 서비스 이용 등을 하실 수 없습니다.<br><br>

                1. 개인정보 항목·목적·보유기간<br>
                회원 탈퇴 시 즉시 파기(단, 반복 재가입 등의 방법을 이용한 서비스 부정이용 방지를 위해 이름, ID, DI, 성별, 생년은 탈퇴 후 30일 보관) 또는 관계법령에 의한 별도 보존기간
                (2. 관계법령에 의한 개인정보 보존기간참고)<br><br>
                2. 관계법령에 의한 개인정보 보존기간<br>
                - 서비스이용기록, 접속로그, 접속IP정보 (통신비밀보호법 : 3개월)<br><br>
                - 표시/광고에 관한 기록 (전자상거래법 : 6개월)<br>
                - 계약 또는 청약철회 등에 관한 기록 (전자상거래법 : 5년)<br>
                - 대금결제 및 재화 등의 공급에 관한 기록 (전자상거래법 : 5년)<br>
                - 소비자의 불만 또는 분쟁처리에 관한 기록 (전자상거래법 : 3년)
              </p>
            </div>
          </section>

          <section>
            <h4>광고성 정보 수신동의<span>(선택)</span><input type="checkbox" id="agree3" name="agree" value="3"></h4>
            <div>
              <p>
                목적 : 마케팅 정보 활용(상품정보 및 행사 정보 안내 등)<br>
                항목 : 휴대전화번호, 이메일<br>
                보유 및 이용 기간 : 회원 탈퇴시까지<br><br>
                ※ 귀하께서는 동의를 거부하실 수 있으나, 동의를 거부 하실 경우 마케팅 정보를 받으실 수 없습니다.
              </p>
            </div>
          </section>

          <section>
            <h4>회원가입 유의사항</h4>
            <p>· 반드시 회원님 명의로 된 휴대폰, 아이핀을 이용해주세요.<br>
              · 타인의 개인정보를 도용하여 가입할 경우 향후 적발 시 서비스 이용제한 및 법적 제재를 받으실 수 있습니다.<br>
            </p>
          </section>

        </div>
        <button type="button" onclick="joinNext()">다음</button>
      </form>

    </div>
    
    <script>
    	let agreeAll = document.getElementById('agreeAll');
    	let agree1 = document.getElementById('agree1');
    	let agree2 = document.getElementById('agree2');
    	let agree3 = document.getElementById('agree3');
    	let form = document.joinAgreeForm;
    	
    	agreeAll.addEventListener('click', function () {
            if (agreeAll.checked) {
                agree1.checked = true;
                agree2.checked = true;
                agree3.checked = true;
            } else {
                agree1.checked = false;
                agree2.checked = false;
                agree3.checked = false;
            }
        });
    	
    	function joinNext(){
    		if (agree1.checked && agree2.checked) {
    	        form.submit();
    	    } else {
				alert('필수 약관에 동의해주세요');
    	    }
    	};
    </script>
</body>
</html>