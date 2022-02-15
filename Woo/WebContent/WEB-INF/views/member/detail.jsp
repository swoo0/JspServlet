<%@page import="com.jsp.dto.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<title>detail</title>
<head>
</head>

<body>
	<div class="card" style="width:700px; margin: 10px">
      <div class="card-header">
        <h3 class="card-title" style="font-size: 30px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원정보 상세보기</font></font></h3>
      </div>
      <!-- /.card-header -->
      <div class="card-body" style="padding:15px 15px 10px 15px">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th style="width: 150px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">#</font></font></th>
              <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">정보</font></font></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">아이디:</font></font></td>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${member.id }</font></font></td>
            </tr>
            <tr>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이름: </font></font></td>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${member.name }</font></font></td>
            </tr>
            <tr>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">패스워드: </font></font></td>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${member.pwd }</font></font></td>
            </tr>
            <tr>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">전화번호: </font></font></td>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${member.phone }</font></font></td>
            </tr>
            <tr>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">email: </font></font></td>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${member.email }</font></font></td>
            </tr>
            <tr>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">주소: </font></font></td>
              <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${member.address }</font></font></td>
            </tr>
          </tbody>
        </table>
      </div>
	  <div style="width: 210px; margin: 0px 0px 15px 15px">
	    <div style="width: 100px; float: left" >
	      <button type="button" class="btn btn-block bg-gradient-primary" onclick="update_member('${member.id }')">수정</button>
	    </div>
	    <div style="width: 100px; float: right">
	  	<button type="button" class="btn btn-block bg-gradient-primary" onclick="delete_member('${member.id }')">삭제</button>
	    </div>
	  </div>	
    </div>

	<script>
		function update_member(member_id) {
			window.open('updateMember?id=' + member_id, '700', '600')
		}
		
		function delete_member(member_id) {
			var str = confirm("정말 삭제하시겠습니까?");
			if (str) {
				location.href="deleteMember?id=" + member_id;
			}
		}
		
		function detail_close() {
			window.close();
		}
	</script>

</body>