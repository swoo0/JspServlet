<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title></title>
<head>
</head>
	
<body>

<div class="register-page" style="min-height: 570.8px;">
  <div class="register-box">
    <div class="register-logo">
      <a href="#"><b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원 등록</font></font></b><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></a>
    </div>

    <div class="card">
      <div class="card-body register-card-body">
<!--         <p class="login-box-msg"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원 등록</font></font></p> -->
      
        <form action="insertMember" method="post">
        
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="아이디" name="id" id="checkId" required title="영문, 숫자, 4~8자리 입력가능" pattern="^[a-zA-Z][a-zA-Z0-9]{3,7}$">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-user"></span>
              </div>
            </div>
          </div>
          
          <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="비밀번호" name="pwd" id="checkPwd" required title="대/소문자,특수문자,숫자 포함 8자리 이상 입력 가능" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}$">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
          
          <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="비밀번호 재입력" name="pwd2" id="checkPwd2" required title="대/소문자,특수문자,숫자 포함 8자리 이상 입력 가능" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}$">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-lock"></span>
              </div>
            </div>
          </div>
          
          <div class="input-group mb-3">
            <input type="text" autocomplete="off" class="form-control" placeholder="이름" name="name" id="checkName" required title="한글 2~5 자리 입력 가능" pattern="^[가-힣]{2,5}$">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-user"></span>
              </div>
            </div>
          </div>
          
          <div class="input-group mb-3">
            <input type="tel" class="form-control" placeholder="전화번호" name="phone" id="checkPhone" required title="010-0000-0000 형식으로 입력 가능합니다" pattern="^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-user"></span>
              </div>
            </div>
          </div>
      
          <div class="input-group mb-3">
            <input type="email" class="form-control" placeholder="이메일" name="email" id="checkEmail" required title="aaa@aaa.com 형식으로 입력 가능합니다." pattern="^[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}$">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-envelope"></span>
              </div>
            </div>
          </div>
          
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="주소" name="address" id="checkAddr" required>
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
	  	          <button type="button" class="btn btn-primary btn-block" onclick="window.close()"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">취소</font></font></button>
	  	        </div>
              </div>
              
            </div>
            <!-- /.col -->
          </div>
        </form><!-- /.form-box -->
      </div><!-- /.card body -->

    </div><!-- /.card -->
  </div><!-- /.register-box -->
</div><!-- register-page -->

<script>
</script>

</body>