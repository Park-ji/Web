<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(session!=null && session.getAttribute("sessionage")!=null){ %>
<h1>아이디 = <%=session.getAttribute("sessionid")%></h1>
<h1>내년나이 = <%=(Integer)session.getAttribute("sessionage")+1 %></h1>
<!-- getAttribute로 받아오면 Object형이므로 -> 형변환 해줘야함 -->
<!-- session은 response,request 필요 x(브라우져에 보여지는 것이 아니라 내부에서 공유되므로) -->
<%
}
if(session.getAttribute("장바구니")!=null){
%>
<h1>장바구니 목록 = <%=session.getAttribute("장바구니") %></h1>
<%
}
else{
%>
<h1>세션정보가 없습니다.</h1>
<%
}
%>
</body>
</html>