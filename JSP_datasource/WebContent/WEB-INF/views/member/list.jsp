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
<style>
tr {
	cursor : pointer;
}
</style>

<title></title>
</head>
<body>
	
<table border="1px">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>패스워드</th>
		<th>주소</th>
		<th>email</th>
		<th>전화번호</th>
	</tr>
	
<%-- <%
	List<MemberVO> memberList = (List<MemberVO>) request.getAttribute("memberList");
	for (MemberVO member : memberList) {
	pageContext.setAttribute("member", member);
%> --%>

<c:if test="${not empty memberList }">
	 <c:forEach items="${memberList }" var="member">
	<tr class="mline" onclick="detail('${member.id }');" >
<%-- 		<td><%=member.getId() %></td> --%>
		<td>${member.id }</td>
		<td>${member.name }</td>
		<td>${member.pwd }</td>
		<td>${member.address }</td>
		<td>${member.email }</td>
		<td>${member.phone }</td>
	</tr>
	</c:forEach>
</c:if>

<c:if test="${empty memberList }">
	<tr>
		<td colspan="6" style="text-align:center;">해당 내용이 없습니다.</td>
	</tr>
</c:if>
<%-- <%		
	}
%>	 --%>
	
</table>


<script>

function detail(memId) {
	window.open('detail?id=' + memId, '800', '700')
}

var sel = document.querySelector(".mline");


</script>

</body>
</html>