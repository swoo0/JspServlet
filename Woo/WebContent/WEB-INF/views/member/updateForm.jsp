<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title></title>
<head>
</head>

<body>
	<div class="card card-primary">
	  <div class="card-header">
	    <h3 class="card-title">회원 정보 수정</h3>
	  </div>
	  <!-- /.card-header -->
	  <!-- form start -->
	  <form class="form-horizontal" action="updateMember" method="post">
	    <div class="card-body" style="padding:15px 15px 0px 20px">
	    
	      <div class="form-group row">
	        <label for="inputPassword3" class="col-sm-2 col-form-label">아이디</label>
	        <div class="col-sm-10">
	          <input type="hidden" class="form-control" id="inputPassword3" placeholder="ID" name="id" value="${member.id }">
	          <input type="text" class="form-control" id="inputPassword3" placeholder="ID" value="${member.id }" disabled>
	        </div>
	      </div>
	    
	      <div class="form-group row">
	        <label for="inputPassword3" class="col-sm-2 col-form-label">비밀번호</label>
	        <div class="col-sm-10">
	          <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="pwd" required="required" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}$">
	        </div>
	      </div>
	      
	      <div class="form-group row">
	        <label for="inputPassword3" class="col-sm-2 col-form-label">비밀번호 확인</label>
	        <div class="col-sm-10">
	          <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="pwd2" required="required" pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}$">
	        </div>
	      </div>
	      
	      <div class="form-group row">
	        <label for="inputPassword3" class="col-sm-2 col-form-label">이름</label>
	        <div class="col-sm-10">
	          <input type="text" class="form-control" id="inputPassword3" placeholder="ID" name="name" value="${member.name }" required="required" pattern="^[가-힣]{2,5}$">
	        </div>
	      </div>
	      
	      <div class="form-group row">
	        <label for="inputPassword3" class="col-sm-2 col-form-label">전화번호</label>
	        <div class="col-sm-10">
	          <input type="tel" class="form-control" id="inputPassword3" placeholder="ID"  name="phone" value="${member.phone }" required="required" pattern="^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$">
	        </div>
	      </div>
	      
	      <div class="form-group row">
	        <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
	        <div class="col-sm-10">
	          <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="email" value="${member.email }" required="required" pattern="^[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}$">
	        </div>
	      </div>
	      
	      <div class="form-group row">
	        <label for="inputPassword3" class="col-sm-2 col-form-label">주소</label>
	        <div class="col-sm-10">
	          <input type="text" class="form-control" id="inputPassword3" placeholder="ID" name="address" value="${member.address }" required="required">
	        </div>
	      </div>
	      
	    </div>
	    <!-- /.card-body -->
	    <div class="card-footer">
	      <button type="submit" class="btn btn-primary">수정</button>
	      <button type="submit" class="btn btn-default float-right" onclick="window.close()">Cancel</button>
	    </div>
	    <!-- /.card-footer -->
	  </form>
	</div>
	
</body>