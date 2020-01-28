<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script scr="jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){

});
</script>
</head>
<body>
<h1>${sessionid}님의 게시물 리스트는 다음과 같습니다.</h1>
<%-- <%
ArrayList<BoardVO> list = (ArrayList<BoardVO>)request.getAttribute("list");
for(int i=0;i<list.size();i++){
	out.println("<h3>"+list.get(i).getTitle()+"</h3>");
}
%> --%>
<!-- 
위:jsp / 아래 : el문(jstl태그)
* jstl태그일때는 import할 필요도 없음!!
 -->
<c:forEach items="${list}" var='vo'>
<h3>${vo.title}</h3>
</c:forEach>
</body>
</html>








