<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ?id=java&hobby=음악감상&hobby=영화감상&hobby=먹기 -->
	<h1>id : ${param.id}</h1>
	<!-- == -->
	<h1>id : ${param['id']}</h1>

	<h1>hobby : ${paramValues.hobby[0]}</h1>
	<h1>hobby : ${paramValues.hobby[1]}</h1>
	<h1>hobby : ${paramValues.hobby[2]}</h1>
	<!-- EL에는 반복문이 없음 -->

	<h2>브라우저 정보 : ${header["user-agent"]}</h2>
	<%
		Enumeration<String> e = request.getHeaderNames();
		// Enumeration : 배열, ArrayList와 비슷하지만 Index가 없음
		while (e.hasMoreElements()) { // Enumeration에 데이터가 존재하는지 검사 true/false
			String header = e.nextElement(); //  element를 get
			out.println(header + "=" + request.getHeader(header) + "<br>");
		}
	%>

	<h2> 쿠키정보 : ${cookie.name.value}</h2>		
	<!-- 
	new Cookie("name", "value") 
	${cookie.name.value}	// cookie정보 get
	-->
	
	<!-- 
	request.getRemoteAddr()	// 접속한 클라이언트 ip주소 get
	request.getMethod()		// 웹서버로 요청시, 요청한 방식(get|post) get
	-->
	<%
	pageContext.getRequest().getRemoteAddr();
	%>
	${pageContext.request.remoteAddr}
	
	${requestScope.share}
	
	
</body>
</html>