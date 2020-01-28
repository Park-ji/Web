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
$(document).ready(function(){

});
</script>
</head>
<body>
<%-- 
1. ${applicationScope.getAttribute("time")}
2. getter메소드 -> ${applicationScope.time}
3. applicationScope속성은 생략 가능
(cf, jsp에서는 'application'이 내장객체 / jstl에서는 'applicationScope'이 내장객체)
 --%>
 
<!-- el표현식의 변수명은 한글로 주게 되면 읽어오지 못함 -->
<%-- ${time}<br>
${location}<br>
${개발자}<br><!-- 에러 발생  --> --%>

<%=application.getAttribute("time") %><br>
<%=application.getAttribute("location") %><br>
<%=application.getAttribute("개발자") %><br>
</body>
</html>