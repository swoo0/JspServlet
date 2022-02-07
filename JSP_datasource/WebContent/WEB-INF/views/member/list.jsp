<%@page import="com.jsp.dto.MemberVO"%>
<%@page import="java.util.List"%>
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
	
<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>패스워드</th>
		<th>주소</th>
		<th>email</th>
		<th>전화번호</th>
	</tr>
	
<%
	List<MemberVO> memberList = (List<MemberVO>) request.getAttribute("memberList");
	for (MemberVO member : memberList) {
	pageContext.setAttribute("member", member);
%>
	<tr>
<%-- 		<td><%=member.getId() %></td> --%>
		<td>${member.id }</td>
		<td>${member.name }</td>
		<td>${member.pwd }</td>
		<td>${member.address }</td>
		<td>${member.email }</td>
		<td>${member.phone }</td>
	</tr>
<%		
	}
%>	
	
</table>

</body>
</html>