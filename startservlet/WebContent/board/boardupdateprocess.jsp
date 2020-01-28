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
<body>
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String writer = request.getParameter("writer");
int seq = Integer.parseInt(request.getParameter("idx"));

BoardDAO dao = new BoardDAO();
BoardVO vo = new BoardVO();
int cnt = dao.updateBoard(seq, title, contents, writer);
if(cnt == 1){
	out.println("<h1> 수정되었습니다.<br><a href=\"start.jsp?menu=boardlist\">게시물리스트로 이동</a></h1>");
}
else{
	out.println("<h1> 수정불가</h1>");	
}
%>
<%-- <h1><%=vo.getSeq() %>번 내용을 수정하였습니다.</h1> --%>
</body>
</html>