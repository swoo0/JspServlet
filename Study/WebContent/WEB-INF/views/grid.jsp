<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!-- <script src="js/jquery-3.6.0.min.js"></script> -->
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="css/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/bootstrap/dist/css/adminlte.min.css">

<link rel="stylesheet" href="css/bootstrap/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="css/bootstrap/plugins/jsgrid/jsgrid.min.css">
<link rel="stylesheet" href="css/bootstrap/plugins/jsgrid/jsgrid-theme.min.css">

<link rel="stylesheet" href="css/bootstrap/dist/css/adminlte.min.css?v=3.2.0">


<!-- <script>(function(w,d){!function(a,e,t,r,z){a.zarazData=a.zarazData||{},a.zarazData.executed=[],a.zarazData.tracks=[],a.zaraz={deferred:[]};var s=e.getElementsByTagName("title")[0];s&&(a.zarazData.t=e.getElementsByTagName("title")[0].text),a.zarazData.w=a.screen.width,a.zarazData.h=a.screen.height,a.zarazData.j=a.innerHeight,a.zarazData.e=a.innerWidth,a.zarazData.l=a.location.href,a.zarazData.r=e.referrer,a.zarazData.k=a.screen.colorDepth,a.zarazData.n=e.characterSet,a.zarazData.o=(new Date).getTimezoneOffset(),a.dataLayer=a.dataLayer||[],a.zaraz.track=(e,t)=>{for(key in a.zarazData.tracks.push(e),t)a.zarazData["z_"+key]=t[key]},a.zaraz._preSet=[],a.zaraz.set=(e,t,r)=>{a.zarazData["z_"+e]=t,a.zaraz._preSet.push([e,t,r])},a.dataLayer.push({"zaraz.start":(new Date).getTime()}),a.addEventListener("DOMContentLoaded",(()=>{var t=e.getElementsByTagName(r)[0],z=e.createElement(r);z.defer=!0,z.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(a.zarazData))),t.parentNode.insertBefore(z,t)}))}(w,d,0,"script");})(window,document);</script> -->

</head>
<body>

	<div class="card card-primary" style="width:1100px;">
		<div class="card-header">
			<h3 class="card-title" style="font-size: 30px;">Grid</h3>
		</div>
		<!-- /.card-header -->
		<!-- form start -->
		<form class="form-horizontal" action="updateMember" method="post">
			<div class="card-body" style="padding: 15px 15px 0px 20px">
				<div class="form-group row">
					<div class="col-sm-3">
						<select class="custom-select" name="input_box" id="ibox" style="width:240px;">
							<option value="option">옵션</option>
						</select>
					</div>
					<div class="col-sm-3">
<!-- 						<input type="search" id="search" placeholder="search" style="width:140px;"> -->
						<input type="search" name="search" class="form-control" placeholder="Search" style="width:240px; height:38px">
					</div>
					
					<div class="col-sm-3" style="font-size:20px; vertical-align: middle;" >
						<div class="row md-2">
							<div class="col-sm-6">
								<input type="radio" name="gender" value="남" style="width:20px; height:20px;"> 남
							</div>
							<div class="col-sm-6">
								<input type="radio" name="gender" value="여" style="width:20px; height:20px;"> 여
							</div>
						</div>
					</div>
					
					<div class="col-sm-3" style="font-size:20px;">
					</div>
					
				</div>

				<div class="form-group row">
					<div class="col-sm-3">
						<select class="custom-select" name="country_box" id="ibox" style="width:240px;">
							<option value="woo">국가</option>
						</select>
					</div>
					<div class="col-sm-3">
						<select class="custom-select" name="sity_box" id="ibox" style="width:240px;">
							<option value="woo">도시</option>
						</select>
					</div>
					<div class="col-sm-3">
						<input type="date" name="start" style="width:240px; height:38px; font-size:17px;">
					</div>
					<div class="col-sm-3">
						<input type="date" name="end" style="width:240px; height:38px; font-size:17px;">
					</div>
				</div>

				<div class="from-group row">
					<div class="col-sm-3">
						<div class="row md-2">
							<div class="col-sm-4">
								<button type="submit" class="btn btn-info">조회</button>
							</div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-primary">저장</button>
							</div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-secondary">삭제</button>
							</div>
						</div>
					</div>
					<div class="col-sm-6"></div>
					<div class="col-sm-3">
						<div class="row md-2">
							<div class="col-sm-4">
							</div>
							<div class="col-sm-4">
							</div>
							<div class="col-sm-4">
								<button class="btn btn-success buttons-excel buttons-html5" aria-controls="example1" type="button"><span>Excel</span></button>
								
							</div>
							
						</div>
					</div>
				</div>
			</div> <!-- card-body / -->

<!-- 			<div class="card-footer"> -->
			<div class="card-footer">
				<div id="jsGrid1" class="jsgrid" style="position: relative; height: 100%; width: 100%;">
				    <div class="jsgrid-grid-header jsgrid-header-scrollbar">
				        <table class="jsgrid-table">
				            <tr class="jsgrid-header-row">
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 20px;"><input type="checkbox"></th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 30px;">ID</th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 30px;">Name</th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 100px;">Address</th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 50px;">Email</th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 50px;">Phone</th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 30px;">Gender</th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 40px;">Country</th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 40px;">City</th>
				                <th class="jsgrid-header-cell jsgrid-align-center" style="width: 50px;">Restate</th>
				            </tr>
				            <tr class="jsgrid-row">
				                
				            <c:if test="${not empty memberList }">
				            	<c:forEach items="${memberList }" var="member">
				            		<tr class="jsgrid-row" >
				            			<td class="jsgrid-cell jsgrid-align-center" style="width: 20px;"><input type="checkbox"></td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 30px;">${member.id }</td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 30px;">${member.name }</td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 100px;">${member.address }</td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 50px;">${member.email }</td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 50px;">${member.phone }</td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 30px;">${member.gender }</td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 40px;">${member.country }</td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 40px;">${member.city }</td>
						                <td class="jsgrid-cell jsgrid-align-center" style="width: 50px;">${member.restate }</td>
				            		</tr>
				            	</c:forEach>
				            </c:if>
				        </table>
				    </div>     

<!-- 				    <div class="jsgrid-grid-body" style="height: 100%; width: 100%;"> -->
<!-- 				        <table class="jsgrid-table"> -->

<!-- 				        </table> -->
<!-- 				    </div> -->
<!-- 				    <div class="jsgrid-pager-container"> -->
<!-- 				        <div class="jsgrid-pager">Pages: <span class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a -->
<!-- 				                    href="javascript:void(0);">First</a></span> <span -->
<!-- 				                class="jsgrid-pager-nav-button jsgrid-pager-nav-inactive-button"><a -->
<!-- 				                    href="javascript:void(0);">Prev</a></span> <span -->
<!-- 				                class="jsgrid-pager-page jsgrid-pager-current-page">1</span><span class="jsgrid-pager-page"><a -->
<!-- 				                    href="javascript:void(0);">2</a></span><span class="jsgrid-pager-page"><a -->
<!-- 				                    href="javascript:void(0);">3</a></span><span class="jsgrid-pager-page"><a -->
<!-- 				                    href="javascript:void(0);">4</a></span><span class="jsgrid-pager-page"><a -->
<!-- 				                    href="javascript:void(0);">5</a></span> <span class="jsgrid-pager-nav-button"><a -->
<!-- 				                    href="javascript:void(0);">Next</a></span> <span class="jsgrid-pager-nav-button"><a -->
<!-- 				                    href="javascript:void(0);">Last</a></span> &nbsp;&nbsp; 1 of 5 </div> -->
<!-- 				    </div> -->
<!-- 				    <div class="jsgrid-load-shader" style="display: none; position: absolute; inset: 0px; z-index: 1000;"></div> -->
<!-- 				    <div class="jsgrid-load-panel" style="display: none; position: absolute; top: 50%; left: 50%; z-index: 1000;"> -->
<!-- 				        Please, wait...</div> -->
				</div>
				
			</div> <!-- card-footer / -->
		</form> <!-- form / -->
	</div>

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script src="css/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="css/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="css/bootstrap/dist/js/adminlte.min.js"></script>

	<script src="css/bootstrap/plugins/jquery/jquery.min.js"></script>
	
	<script src="css/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	
<!-- 	<script src="css/bootstrap/plugins/jsgrid/demos/db.js"></script> -->
	
	<script src="css/bootstrap/plugins/jsgrid/jsgrid.min.js"></script>
	
	<script src="css/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>
	
<!-- 	<script src="css/bootstrap/dist/js/demo.js"></script> -->


<script>

$(document).on("mouseover", "jsgrid-row", function() {
	$(this).css({
		"background-color" : "lightgray"
	});
});
$(document).on("mouseout", "jsgrid-row", function() {
	$(this).css({
		"background-color" : "white"
	});
});

//   $(function () {
//     $("#jsGrid1").jsGrid({
//         height: "100%",
//         width: "100%",

//         sorting: true,
//         paging: true,

//         data: db.clients,

//         fields: [
//             { name: "Married", type: "checkbox", title: "#", width: 30 },
//             { name: "Name", type: "text", width: 150 },
//             { name: "Age", type: "number", width: 50 },
//             { name: "Address", type: "text", width: 200 },
//             { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" }
//         ]
//     });
//   });
</script>
</body>
</html>