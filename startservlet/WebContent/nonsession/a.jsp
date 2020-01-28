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
String id = request.getParameter("id");
//memeber id 존재, pw 맞는지 확인한 과정 생략
%>
<h1><%=id %> 회원님의 메뉴는 다음과 같습니다.</h1>
<h3>
<ul>
<li><a href="c.jsp?id=<%=id%>">게시물 작성</a></li>
<!-- c로 넘어갈때 a에서 받은 id값이 넘어가는 것이 x -->
<!-- 따라서 href로 넘길때 파라미터를 같이 넘겨야함 -->
<!-- 위와 같은 방법은 공유가 아니라 손수 넘겨주는 것임 : 정보가 지속되는 것이 아님-->
<!-- 보내야되는 파라미터가 많아지면? 손수 넘기는데 한계가 있음 -->
<li><a href="b.jsp?id=<%=id%>">장바구니 목록</a></li>
<li>로그아웃</li>
</ul>
</h3>
</body>
</html>