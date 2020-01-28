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
int seq = Integer.parseInt(request.getParameter("seq"));
String pw = request.getParameter("password");
String hpw = request.getParameter("db_password");
if(!pw.equals(hpw)){
	out.println("<h1>암호를 잘못 입력하셨습니다.<br><a href=\"boarddetail.jsp?seq="+seq+"\">게시글</a></h1>");
%>
<%-- <jsp:forward page="boarddetail.jsp"></jsp:forward> --%>
<%
}
else{
BoardDAO dao = new BoardDAO();
int cnt = dao.deleteBoard(seq);
if(cnt==1){
out.println("<h1>1개의 게시물이 삭제되었습니다.<br><a href=\"start.jsp?menu=boardlist\">게시물리스트로 이동</a></h1>");
}
}
%>
<%-- <h1><%=seq %>번째 게시물을 삭제하였습니다.</h1> --%>
</body>
</html>