<%@page import="com.jsp.dto.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>list</title>	
<head>
</head>

<body>

	<!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>회원목록</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
				        <li class="breadcrumb-item">
				        	<a href="list.do">
					        	<i class="fa fa-dashboard"></i>회원관리
					        </a>
				        </li>
				        <li class="breadcrumb-item active">
				        	목록
				        </li>		        
	    	  		</ol>
	  			</div>
	  		</div>
	  	</div>
	</section>

	<div class="card">
	  <div class="card-header">
		
	  	<div class="row mb-2" style="height:30px">
	  	  <div class="col-sm-2">
		    <div style="width: 100px;">
		      <button type="button" class="btn btn-block bg-gradient-primary" onclick="OpenWindow('registForm.do?cw=t','회원등록',800,800);">회원 등록</button>
		    </div>
	      </div>  
	      <div class="col-sm-10">  
		    <div class="card-tools" style="float:right">
		      <div class="input-group input-group-sm" style="width: 300px;">
		        <div class="form-group" style="height: 35px">
		        
		          <!-- sort num -->
		          <select class="form-control" style="height: 35px">
		            <option>정렬개수</option>
		            <option>2개</option>
		            <option>3개</option>
		            <option>5개</option>
		          </select>
		          
		          <!-- search bar -->
		          <select class="form-control" style="height: 35px">
		            <option>검색구분</option>
		            <option>아이디</option>
		            <option>이름</option>
		            <option>이메일</option>
		          </select>
		        </div>
		        <!-- keyword -->
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
                  <td>${member.pwd }</td>
                  <td>${member.name }</td>
                  <td>${member.email }</td>
                  <td>${member.phone }</td>
                  <td>${member.regDate }</td>
          	    </tr>
              </c:forEach>
            </c:if>
	      </tbody>
	    </table>
	  </div> <!-- /.card-body end -->
	  
	  <div class="card-footer clearfix">
	    <ul class="pagination pagination-sm m-0 float-right">
	      <li class="page-item"><a class="page-link" href="#">«</a></li>
	      <li class="page-item"><a class="page-link" href="#">1</a></li>
	      <li class="page-item"><a class="page-link" href="#">2</a></li>
	      <li class="page-item"><a class="page-link" href="#">3</a></li>
	      <li class="page-item"><a class="page-link" href="#">»</a></li>
	    </ul>
	  </div><!-- card-footer end -->
	
	</div> <!-- card end -->
	
	<script>
		function insert_member() {
			window.open('insertForm.do', '800', '700', '')
		}

		function detail(member_id) {
			window.open('detail.do?id=' + member_id, '800', '700', '')
// 			window.open('detail.do', '800', '700', '')
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

</body>