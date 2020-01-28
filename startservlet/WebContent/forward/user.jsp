<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getParameter("id") %> 회원님 환영합니다.<br>
회원 메뉴는 다음과 같습니다.<br>
<ol>
<%
String menu[] = (String[])request.getAttribute("menu");
int len = menu.length; 
for(int i=0;i<len;i++){
	%>
	<li><%=menu[i]%></li>
<%
}
%>
</ol>
<!-- 1. 자기정보조회<br>
2. 장바구니<br>
3. 자기정보수정<br>
4. 다른회원조건검색<br> -->
</body>
</html>