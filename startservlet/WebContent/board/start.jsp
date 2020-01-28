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
String menu = request.getParameter("menu");
String path = "";
if(menu==null){
	menu="boardlist";
}
if(menu.equals("boardlist")){
	path="/board/boardlist.jsp";//=현재 컨텍스트 기준으로 board폴더안의 boardlist.jsp를 의미
	//path="boardlist.jsp"; -> 현재는, 위와 경로 같은 의미
}
if(menu.equals("boardwrite")){
	path="/board/boardwriteform.jsp";
}
%>
<jsp:forward page="<%=path %>"/>
</body>
</html>