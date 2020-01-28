<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	꼭 여기에 선언해야 하는 것은 아니고 태그를 사용하기 전에만 선언하면 된다
	그렇지만 일반적으로 여기에 선언문을 모아둠 
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	
});
</script>
</head>
<body>
	
<%--
 	<c:set var="i" value="10" />
	<!-- 얘는 연산을 하면 알아서 형을 바꿔주기도 하고 아니면 String? -->
	<h1>${i}</h1>
	<!-- == -->
	<%
	String i = "10";
	pageContext.setAttribute("i", i);
	%>
	<h1><%=i %></h1> 
--%>
	
	<% int sample = 100; %>
	<%-- 1. 변수 선언 : ${} --%>
	<c:set var="i" value="<%=sample%>" />
	<!-- jsp 변수 sample을 el 변수 i로 변경한 것과 같음 -->
	<h1>${i}</h1>

	<!-- 2. 화면 출력 -->
	<c:out value="${i}"/>
	
	<!-- 3. 변수 삭제 -->
	<c:remove var="i"/>
	<!-- jstl로 만들어진 변수는 el 표현으로만 사용할 수 있음? -->
	
</body>
</html>