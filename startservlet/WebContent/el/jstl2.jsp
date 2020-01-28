<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<c:if test="${empty param.id}">
		<h1>id 변수를 입력해주세요.</h1>
	</c:if>
	<c:if test="${!empty param.id}">
		<h1>${param.id}회원님환영합니다.</h1>

	<!-- 
	age 파라미터 받아서 
	0-15 : 중학생 이하입니다.
	16-19 : 고등학생 입니다.
	20 이상 : 성인인증 되었습니다.
	-->
		<c:choose>
			<c:when test="${param.age ge 0 && param.age le 15}">
				<h2>중학생 이하입니다.</h2>
			</c:when>
			<c:when test="${param.age >= 16 && param.age <= 19}">
				<h2>고등학생입니다.</h2>
			</c:when>
			<c:when test="${param.age >= 20}">
				<h2>성인인증 되었습니다.</h2>
			</c:when>
			<c:otherwise>
				<h2>나이 오류입니다.</h2>
			</c:otherwise>
		</c:choose>
	</c:if>
	
	<!-- 
	id에 jsp문자가 포함 되어 있는지 확인 
	param.id.indexOf("jsp")		// index를 반환
	param.id.contains("jsp")	// boolean값 반환
	-->
	<c:if test="${param.id.indexOf('jsp') >= 0}">
		<h2>jsp를 포함했습니다.</h2>
	</c:if>
	<c:if test="${param.id.contains('jsp')}">
		<h2>jsp가 포함된 ${param.id}회원님 환영합니다.</h2>
	</c:if>

</body>
</html>