<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.removeAttribute("sessionage");
	%>
	<!-- session.invalidate();//session정보 다 사라짐 -->
	<h1>세션 정보를 삭제하였습니다.</h1>
</body>
</html>