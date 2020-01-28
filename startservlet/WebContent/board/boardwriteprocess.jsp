<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String writer = request.getParameter("writer");
int pw = Integer.parseInt(request.getParameter("pw"));
BoardDAO dao = new BoardDAO();
BoardVO vo = new BoardVO(title,contents,writer,pw);
int cnt = dao.insertBoard(vo);
if(cnt==1){
%>
<jsp:forward page="boardlist.jsp"></jsp:forward>
<%
}
else{
out.println("작성불가");
}
%>
<body>

</body>
</html>