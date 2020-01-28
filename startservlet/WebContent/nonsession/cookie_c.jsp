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
Cookie[] coo = request.getCookies();//지속적으로 정보를 저장해놓은 공간에서 꺼내옴
String id=null;
String name=null;
for(int i=0;i<coo.length;i++){
if(coo[i].getName().equals("cookieid")){
	id=coo[i].getValue();
}
if(coo[i].getName().equals("cookiename")){
	name=coo[i].getValue();
}
}
%>
<h1><%=id %> 회원님 글쓰기가 가능합니다. </h1>
<h3><jsp:include page="/board/boardwriteform.jsp"></jsp:include> </h3>
<!-- 위의 include는 html태그안에 사용하므로 /로 시작하면 앞에 컨텍스트명까지 생략되는것으로 간주  -->
</body>
</html>