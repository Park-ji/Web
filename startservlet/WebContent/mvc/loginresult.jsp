<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){

});
</script>
</head>
<body>
<c:if test="${loginstatus==1}">
<h1>${sessionid}님 로그인되셨습니다.</h1><!-- session이용 -->
</c:if>
<%-- <c:set var="result" value="${loginstatus}"></c:set>
<c:choose>
<c:when test="${result==1}"><h3>${vo.id}님 로그인 되었습니다.</h3></c:when>
<c:when test="${result==2}"><h3>암호를 다시 확인해주세요.</h3></c:when>
<c:when test="${result==3}"><h3>해당 정보가 없습니다.</h3></c:when>
</c:choose> --%>
</body>
</html>