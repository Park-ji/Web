<%@page import="java.util.HashMap"%>
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
//http://localhost:8081/startservlet/el/jstl4.jsp
//http://localhost:8081/startservlet/login.jsp
$(document).ready(function(){
	
});
</script>
</head>
<body>
<% 
//색상표 Map
HashMap<String, String> map = new HashMap<String, String>(); //(key, value)한쌍
//key는 중복 x, value는 o 
map.put("빨강","red");
map.put("노랑","yellow");
map.put("초록","green");
map.put("녹색","green");
map.put("파랑","blue");
map.put("보라색","purple");
map.put("보라","purple");
pageContext.setAttribute("col_map", map);
%>

	<c:forTokens var="col" items="빨강,주황;노랑:초록-파랑/남색,보라색" delims="/-;:,">
		<c:set var="color" value="black"></c:set>
		<c:forEach items="${col_map}" var="c" varStatus="cs">
			<c:choose>
				<c:when test="${col==c.key}">
					<c:set var="color" value="${c.value}" />
				</c:when>
			</c:choose>			
		</c:forEach>
		<h1 style="color: ${color}">${col}</h1>
	</c:forTokens>
	<c:url var="test" value="test2.jsp">
	<c:param name="type" value="가격"/>
	<c:param name="word" value="30000"/>
	</c:url>
	
	<h1> ${test }</h1>
	<%-- <c:import url="${test }"/> <!-- include 효과 --> --%>
	<%-- <c:redirect url="${test }"/> <!-- forward 효과 --> --%>
</body>
</html>