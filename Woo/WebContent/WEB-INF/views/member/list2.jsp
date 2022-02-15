<%@page import="com.jsp.dto.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">

<title></title>

</head>
<body>

	<div class="card">
	  <div class="card-header">
	  	<div class="row mb-2">
	  	  <div class="col-sm-12">
	    	<h3 class="card-title" style="font-size: 30px">회원 리스트</h3>
		  </div>
		</div>

		<hr>
		
	  	<div class="row mb-2" style="height:30px">
	  	
	  	  <div class="col-sm-2">
		    <div style="width: 100px;">
		      <button type="button" class="btn btn-block bg-gradient-primary" onclick="insert_member()">회원 등록</button>
		    </div>
	      </div>  
	     
	      <div class="col-sm-10">  
		    <div class="card-tools" style="float:right">
		      <div class="input-group input-group-sm" style="width: 300px;">
		        <div class="form-group" style="height: 35px">
		          <select class="form-control" style="height: 35px">
		            <option>검색구분</option>
		            <option>아이디</option>
		            <option>이름</option>
		            <option>이메일</option>
		          </select>
		        </div>
		        <input type="text" name="table_search" class="form-control" placeholder="Search" style="height: 35px">
		        <div class="input-group-append">
		          <button type="submit" class="btn btn-default" style="height: 35px">
		            <i class="fas fa-search"></i>
		          </button>
		        </div>
		      </div>
		    </div>
	  	  </div>
	  	  
	  	</div>
	  	  
	  </div> <!-- card-header end -->
	</div> <!-- card end -->
	    
	  <!-- /.card-header -->
	  <div class="card-body" style="padding: 0.7rem;">
	    <table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>아이디</th>
	          <th>패스워드</th>
	          <th>이름</th>
	          <th>전화번호</th>
	          <th>email</th>
	          <th>주소</th>
	        </tr>
	      </thead>
	      <tbody>
            <c:if test="${not empty memberList }">
               <c:forEach items="${memberList }" var="member">
                   <tr class="backColor" style="cursor: pointer;" onclick="detail('${member.id }');">
                       <td>${member.id }</td>
                       <td>${member.name }</td>
                       <td>${member.pwd }</td>
                       <td>${member.address }</td>
                       <td>${member.email }</td>
                       <td>${member.phone }</td>
                   </tr>
               </c:forEach>
           </c:if>
	      </tbody>
	    </table>
	  </div>
	  <!-- /.card-body -->
	  <div class="card-footer clearfix">
	    <ul class="pagination pagination-sm m-0 float-right">
	      <li class="page-item"><a class="page-link" href="#">«</a></li>
	      <li class="page-item"><a class="page-link" href="#">1</a></li>
	      <li class="page-item"><a class="page-link" href="#">2</a></li>
	      <li class="page-item"><a class="page-link" href="#">3</a></li>
	      <li class="page-item"><a class="page-link" href="#">»</a></li>
	    </ul>
	  </div>

	<script>
	
		function insert_member() {
			window.open('insertMember', '700', '600')
		}

		function detail(member_id) {
			window.open('detail?id=' + member_id, '700', '600')
		}

		
		$(document).on('mouseover', '.backColor', function() {
			$(this).css({
				"background-color" : "lightgray"
			});
		});
		$(document).on('mouseout', '.backColor', function() {
			$(this).css({
				"background-color" : "white"
			});
		});
		
		
	</script>


	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

</body>
</html>