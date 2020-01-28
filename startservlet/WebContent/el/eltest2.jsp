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
		pageContext.setAttribute("share", "page문자열");
		request.setAttribute("share", "request문자열");
		session.setAttribute("share", "session문자열");
		application.setAttribute("share", "application문자열");
	%>
	<h1>jsp 내장객체로 조회</h1>
	<h3><%=pageContext.getAttribute("share")%></h3>
	<h3><%=request.getAttribute("share")%></h3>
	<h3><%=session.getAttribute("share")%></h3> 
	<h3><%=application.getAttribute("share")%></h3>
	
	<h1>EL 내장객체로 조회</h1>
	<h3>${pageScope.share}</h3>
	<h3>${requestScope.share}</h3>
	<h3>${sessionScope.share}</h3>
	<h3>${applicationScope.share}</h3>
	<!-- 
	EL은 getter 메소드를 생략할 수 있기 때문에 간결하게 표현 가능 
	pageScope.share == pageContext.getAttribute('share')
	-->
	
	<h3>${share}</h3>
	<!-- 객체명을 안주면 page->request->session->application순으로 찾음 -->
</body>
</html>