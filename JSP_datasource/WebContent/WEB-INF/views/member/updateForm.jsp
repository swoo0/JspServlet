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

	
<h1>회원 정보 수정</h1>	
	
<hr>	

<form action="updateMember" method="post">
	<table>
		<tr>
			<td>아이디: </td>
			<td><input type="hidden" name="id" value="${member.id }">${member.id }</td>
		</tr>
		<tr>
			<td>이름: </td>
			<td><input type="text" name="name" value="${member.name }"></td>
		</tr>
		<tr>
			<td>패스워드: </td>
			<td><input type="password" name="pwd" value="${member.pwd }"></td>
		</tr>
		<tr>
			<td>주소: </td>
			<td><input type="text" name="address" value="${member.address }"></td>
		</tr>
		<tr>
			<td>email: </td>
			<td><input type="email" name="email" placeholder="xxx@xxx.xxx" value="${member.email }"></td>
		</tr>
		<tr>
			<td>전화번호: </td>
			<td><input type="tel" name="phone" placeholder="010-xxxx-xxxx" value="${member.phone }"></td>
		</tr>
	</table>
	
	<input type="submit" value="등록">
	<input type="button" value="취소" onclick="window.close()" />
	
</form>	
	
<script>


</script>	
	
	
	
</body>
</html>