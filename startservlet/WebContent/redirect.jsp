<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%="정상 호출되었습니다."%></h1>
<%response.sendRedirect
("http://127.0.0.1:8082/startservlet/logindb.jsp");
//출력내용 변경
%>
<!-- <a href = "logindb.jsp">링크</a> -->
</body>
</html>