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
<h1><%=id %> 회원님의 장바구니 목록입니다.</h1>
<h3> 장바구니 목록입니다. </h3>
</body>
</html>