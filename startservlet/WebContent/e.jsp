<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=exception.getClass().getName()%><br>
<%=exception.getMessage() %><br>
<%
if(request.getAttribute("javax.servlet.error.request_uri").equals("/startservlet/number.jsp")){
	response.sendRedirect("b.jsp");
}
%>
<!--request.getAttribute("javax.servlet.error.request_uri") : 에러가 발생된 파일  -->
</body>
</html>