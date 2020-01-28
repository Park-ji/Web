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
int cnt = (int)application.getAttribute("cnt");
cnt++;
application.setAttribute("cnt", cnt);
//application.setAttribute("cnt1", cnt);
%>

<%="우리 사이트에"+cnt+"번 접속하셨습니다."%>


</body>
</html>