<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<form action="test2.jsp">
	<select name="type">
		<option>상품명</option>
		<option>가격</option>
		<option>상품정보</option>
	</select>
	검색어 : <input type="text" name="word">
	<input type="submit" value="검색">
	</form>
</body>
</html>