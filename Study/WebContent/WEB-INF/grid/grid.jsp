<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap/dist/css/adminlte.min.css">
</head>
<body>
	
	<div class="card">
	
		<div class="card-header">
			<div class="row mb-2">
				<div class="col-sm-12">
					<h3 class="card-title" style="font-size:30px;">Grid</h3>
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-sm-3">
					<select name="input_box" id="ibox">
						<option value="woo">우</option>
					</select>
				</div>
				<div class="col-sm-3">
					<input type="search" id="search">
				</div>
				<div class="col-sm-6">
					<input type="radio" name="gender" value="남">
					<input type="radio" name="gender" value="여">
				</div>
			</div>
			
			<div class="row mb-2">
				<div class="col-sm-3">
				
				</div>
				<div class="col-sm-3">
				
				</div>
				<div class="col-sm-3">
				
				</div>
				<div class="col-sm-3">
				
				</div>
			</div>
			
			
			<div class="row mb-2">
				<div class="col-sm-12">
				
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-12">
				
				</div>
			</div>	
		</div> <!-- card-header End -->
		
		<div class="card-body">
			<div class="row mb-2">
				<div class="col-sm-12">
					<h3 class="card-title" style="font-size:30px;">Grid</h3>
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-12">
					<h3 class="card-title" style="font-size:30px;">Grid</h3>
				</div>
			</div>
			<div class="row mb-2">
				<div class="col-sm-12">
					<h3 class="card-title" style="font-size:30px;">Grid</h3>
				</div>
			</div>		
		</div>
		
		
	</div><!-- card End -->
	
	
	
	<div class="row mb-2">
	
	</div>
	
	
	

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/css/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/css/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/css/bootstrap/dist/js/adminlte.min.js"></script>
	
</body>
</html>