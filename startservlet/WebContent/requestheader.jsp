<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>요청 헤더 목록 출력</h1>
<!-- Enumeration : java.util 패키지에 있음
     -> 일종의'배열'이라고 생각하자
     -> 접근할때 인덱스로 접근 하는 것이 아니라 접근하기 위한 메소드가 존재
 -->
<% Enumeration e = request.getHeaderNames();
   while(e.hasMoreElements()){//데이터가 있으면 반복 = 끝까지 반복
	//1. String 제너릭 타입 설정 못하면 강제 형변환
	String headername = (String)e.nextElement();
   	//2. Enumeration<String>
   	String headervalue = request.getHeader(headername);
  //*jsp 스크립 태그는 포함 x
%>   	
   	<%= headername %> = <%= headervalue%><br>
<%    	
   }
%>
</body>
</html>