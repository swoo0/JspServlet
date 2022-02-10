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
<style>
tr {
	cursor: pointer;
}
</style>

<title></title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">


</head>
<body>

	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">회원리스트</h3>

				<div class="card-tools">
					<div class="input-group input-group-sm" style="width: 150px;">
						<input type="text" name="table_search"
							class="form-control float-right" placeholder="Search">

						<div class="input-group-append">
							<button type="submit" class="btn btn-default">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.card-header -->
			<div class="card-body table-responsive p-0">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>패스워드</th>
							<th>주소</th>
							<th>email</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${not empty memberList }">
							<c:forEach items="${memberList }" var="member">
								<tr onclick="detail('${member.id }');">
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
		</div>
		<!-- /.card -->
	</div>



	<input type="button" value="회원 등록" onclick="insert_member()" />

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="searchType">
		<option value="">검색구분</option>
		<option value="id">아이디</option>
		<option value="name">이름</option>
		<option value="email">이메일</option>
	</select>
	<input type="text" value="" />
	<button>검색</button>

	


	<script>
		function insert_member() {
			window.open('insertMember', '700', '600')
		}

		function detail(member_id) {
			window.open('detail?id=' + member_id, '700', '600')
		}
	</script>


	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

</body>
</html>