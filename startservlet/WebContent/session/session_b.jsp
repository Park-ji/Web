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
String id= (String)session.getAttribute("memberid");
String name = (String)session.getAttribute("membername");
if(id!=null && name!=null){
%>
<h1>아이디 : <%=id %><br> <%=name %> 회원님의 장바구니 목록입니다.</h1>
<h3> 장바구니 목록입니다. </h3>
<%
}
else{
%>
<h1>로그인 한 적 없음</h1>
<a href="session_a.jsp">로그인 화면 이동</a>
<%
}
%>
</body>
</html>