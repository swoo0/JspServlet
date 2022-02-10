<%@page import="com.jsp.dto.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<h1>회원상세보기</h1>	
	
<hr>	

<table border="1px">
	<tr>
		<td>아이디: </td>
		<td>${member.id }</td>
	</tr>
	<tr>
		<td>이름: </td>
		<td>${member.name }</td>
	</tr>
	<tr>
		<td>패스워드: </td>
		<td>${member.pwd }</td>
	</tr>
	<tr>
		<td>주소: </td>
		<td>${member.address }</td>
	</tr>
	<tr>
		<td>email: </td>
		<td>${member.email }</td>
	</tr>
	<tr>
		<td>전화번호: </td>
		<td>${member.phone }</td>
	</tr>

<c:if test="${empty member }">
	<tr>
		<td colspan="6" style="text-align:center;">해당 내용이 없습니다.</td>
	</tr>
</c:if>

</table>
	<input type="button" value="수정" onclick="update_member('${member.id}')" />
	 &nbsp;
	<input type="button" value="삭제" onclick="delete_member('${member.id}')" /> 
	 &nbsp;
	<input type="button" value="목록" onclick="detail_close()" /> 



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
</html>