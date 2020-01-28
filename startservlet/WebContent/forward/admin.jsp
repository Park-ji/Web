<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getParameter("id") %>관리자님 환영합니다.<br>
관리자 메뉴는 다음과 같습니다.<br>
<ol>
<%
//String[] m = request.getParameterValues("menu");
String menu[] = (String[])request.getAttribute("menu");
int len = menu.length; 
for(int i=0;i<len;i++){
	%>
	<li><%=menu[i]%></li>
<%
}
%>
</ol>
<!-- 1. 모든 회원조회<br>
2. 회원강제탈퇴<br> -->
</body>
</html>