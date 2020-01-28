<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script scr="jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){

});
</script>
</head>
<body>
<!-- <form action="/startservlet/encoding" method="post"> --><!-- html태그에서는 포트까지 생략되어있는 것('/') -->
<form action="/startservlet/nonencoding" method="post">
이름 : <input type="text" name = "name">
<input type = submit value="전송">
</form>
</body>
</html>