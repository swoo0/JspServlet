<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">

<title></title>
</head>
<body>
	
<body class="register-page" style="min-height: 570.8px;">
<div class="register-box">
  <div class="register-logo">
    <a href="../../index2.html"><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원 등록</font></font></b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
<!--       <p class="login-box-msg"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원 등록</font></font></p> -->

      <form action="insertMember" method="post">
      
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="아이디" name="id" id="checkId">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="비밀번호" name="pwd" id="checkPwd">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="비밀번호 재입력" name="pwd2" id="checkPwd2">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="이름" name="name" id="checkName">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="tel" class="form-control" placeholder="전화번호" name="phone" id="checkPhone">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>

        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="이메일" name="email" id="checkEmail">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="주소" name="address" id="checkAddr">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        
        <div class="row">
          <div class="col-8" >
            <div class="icheck-primary" style="width: 400px">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms"><font style="vertical-align: inherit;"><a href="#"><font style="vertical-align: inherit;">약관</font></a><font style="vertical-align: inherit;"> 
               에 동의합니다</font></font><a href="#"><font style="vertical-align: inherit;"></font></a>
              </label>
            </div>
            <div style="width: 210px">
              <div style="width: 100px; float: left" >
                <button type="submit" class="btn btn-primary btn-block"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">등록</font></font></button>
              </div>
              <div style="width: 100px; float: right">  
		        <button type="submit" class="btn btn-primary btn-block" onclick="window.close()"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">취소</font></font></button>
		      </div>  
		        <button type="button" id="sendBtn" class="btn btn-primary btn-block"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">test</font></font></button>
            </div>
            
          </div>
          <!-- /.col -->
        </div>
      </form>

    </div>
   	<div style="width: 100px">
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<script>

	function valid() {
// 			event.preventDefault(); // submit 이벤트를 막아 페이지 리로드를 방지
	
		// 유효성 검증 (validation check) - id
		let idValue = $('#checkId').val().trim();
	
		// 길이체크 - id
		if (idValue.length < 1) {
			noProc($('#checkId'), "아이디를 입력하세요.");
			return false;
		}
		// 패턴체크 - id
		let regId = /^[a-zA-Z][a-zA-Z0-9]{3,7}$/;
		if (regId.test(idValue)) {
			okProc($('#checkId'));
		} else {
			noProc($('#checkId'), "영문, 숫자, 4~8자리 입력가능");
			return false;
		}
		
		// 유효성검증 - pass
		let passValue = $('#checkPwd').val().trim();
		if (passValue.length < 1) {
			noProc('#checkPwd', "비밀번호를 입력하세요");
			return false;
		}
		let regPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}$/;
		if (regPass.test(passValue)) {
			okProc($('#checkPwd'));
		} else {
			noProc($('#checkPwd'), "대/소문자,특수문자,숫자 포함 8자리 이상 입력 가능");
			return false;
		}
		
		
		// 유효성 검증 - name	
		let nameValue = $('#checkName').val().trim();
		if (nameValue.length < 1) {
			noProc($('#checkName'), "이름을 입력하세요");
			return false;
		}
		let regName = /^[가-힣]{2,5}$/;
		if (regName.test(nameValue)) {
			okProc($('#checkName'));
		} else {
			noProc($('#checkName'), "한글 2~5 자리 입력 가능");
			return false;
		}
		
		// 전방탐색(?=) : 찾을 문자를 선택하는 기호 ' ?=기준문자' 를 지정한다.
		// . 문자를 의미
		// * 0회이상 반복을 의미
		// ? 앞에 위치하는 문자가 0또는 1회 일치
		// ?=.*? 가 뜻하는 내용 >>
		// 임의의 문자(./영문대소문자, 숫자, 특수문자를 나타냄) 
		// 그 중 최소한으로 일치하는 패턴을 찾음.
	
		
		//유효성검증 - hp
		let hpValue = $('#checkPhone').val().trim();
		if (hpValue.length < 1) {
			noProc('#checkPhone', "번호를 입력하세요");
			return false;
		}
		let regHp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
		if (regHp.test(hpValue)) {
			okProc($('#checkPhone'));
		} else {
			noProc($('#checkPhone'), "형식에 맞게 입력하세요");
			return false;
		}
	
		// 유효성검증 - mail
		let mailValue = $('#checkEmail').val().trim();
		if (mailValue.length < 1) {
			noProc('#checkEmail', " 메일을 입력하세요");
			return false;
		}
		// [0-9a-zA-Z]		 >>  mailid
		// +@[0-9a-zA-Z] 	 >>  @naver  @gmail
		// +(\.[a-z]+){1,2}  >>  .com    .co.kr
		
		let regMail = /^[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}$/;
		if (regMail.test(mailValue)) {
			okProc($('#checkEmail'));
		} else {
			noProc($('#checkEmail'), "형식에 맞게 입력하세요");
			return false;
		}
		
// 		let formData = $('form').serialize();
		
// 		$.ajax({
// 			url		: '/webPro/Member',
// 			type	: 'post',
// 			data	: formData,
// 			success	: function(){},
// 			error	: function(xhr) {
// 				alert(xhr.status);
// 			},
// 			dataType : 'json'
// 		});
	}
	
	$('#sendBtn').on('click', valid());

</script>

	
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>	

<div class="goog-te-spinner-pos"><div class="goog-te-spinner-animation"><svg xmlns="http://www.w3.org/2000/svg" class="goog-te-spinner" width="96px" height="96px" viewBox="0 0 66 66"><circle class="goog-te-spinner-path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle></svg></div></div></body>
	
	
</body>
</html>