<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="e.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String num = request.getParameter("num"); 
int num_int = Integer.parseInt(num);
out.println("<h1>"+num_int/10+"</h1>");
%>
</body>
</html>