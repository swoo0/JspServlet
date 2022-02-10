<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	
<h1>회원 등록</h1>	
	
<hr>	

<form action="insertMember" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<th>email</th>
			<td><input type="email" name="email" placeholder="xxx@xxx.xxx"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="phone" placeholder="010-xxxx-xxxx"></td>
		</tr>
	</table>

	
	<input type="submit" value="등록">
	<input type="button" value="취소" onclick="window.close()" />
	
</form>	
	
</body>
</html>