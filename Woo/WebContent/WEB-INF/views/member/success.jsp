<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title></title>
<head>
</head>
<body>

<script>
	window.onload = function(){
		alert("성공 !");
		opener.parent.location.reload();
		console.log(opener.parent)
		window.close();
	}
</script>
	
</body>
</html>