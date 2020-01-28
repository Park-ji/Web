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
<h1><%=id %> 회원님 글쓰기가 가능합니다. </h1>
<h3><jsp:include page="/board/boardwriteform.jsp"></jsp:include> </h3>
<!-- 위의 include는 html태그안에 사용하므로 /로 시작하면 앞에 컨텍스트명까지 생략되는것으로 간주  -->
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