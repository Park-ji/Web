<%@page import="java.util.Date"%>
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
session.setAttribute("sessionid", "세션테스트");
session.setAttribute("sessionage", 20);
//session의 값은 자바객체 (int는 Integer로 자동 박싱 : new Integer(20)과 같은 의미) - jdk1.5버전 이상
%>
<h1>세션 정보를 저장했습니다.</h1>
<!-- 1970년 1월 1일 기준 -->
<h1>세션 최초 생성 시각 = <%=new Date(session.getCreationTime()) %></h1>
<h1>세션 마지막 사용 시각 = <%=new Date(session.getLastAccessedTime()) %></h1>
<!-- 초단위 -->
<h1>세션 타임아웃 시각 = <%=session.getMaxInactiveInterval()/60 %></h1>
</body>
</html>