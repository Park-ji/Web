<%@page import="java.net.*"%>
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
String id= request.getParameter("id");
String name = "로그인한적 없음";
session.setAttribute("memberid", id);
session.setAttribute("membername", "이회원");
if(session.getAttribute("memberid")!=null && session.getAttribute("membername")!=null){
id=(String)session.getAttribute("memberid");
name=(String)session.getAttribute("membername");
%>
<h1> 아이디 <%=id %>인 <%=name%>회원님의 메뉴는 다음과 같습니다.</h1>
<h3>
<ul>
<li><a href="cookie_c.jsp?">게시물 작성</a></li>
<li><a href="cookie_b.jsp?id=<%=id%>">장바구니 목록</a></li>
<li>로그아웃</li>
</ul>
</h3>
<%
}
else{
%>
<h1><%=name %></h1>
<%
}
%>

</body>
</html>