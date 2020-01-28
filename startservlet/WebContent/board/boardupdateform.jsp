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
int seq = Integer.parseInt(request.getParameter("seq"));
String pw = request.getParameter("password");
String hpw = request.getParameter("db_password");
if(!pw.equals(hpw)){
	out.println("<h1>암호를 잘못 입력하셨습니다.<br><a href=\"boarddetail.jsp?seq="+seq+"\">게시글</a></h1>");
%>
<%-- <jsp:forward page="boarddetail.jsp"/> --%>
<%
}
else{
BoardDAO dao = new BoardDAO();
BoardVO vo = dao.getBoardDetail(seq);
%>
<form action = "boardupdateprocess.jsp " method="post">
번호 : <input type="text" name = "idx" value="<%=vo.getSeq() %>" readonly="readonly"><br>
제목 : <input type="text" name="title" value="<%=vo.getTitle() %>"><br>
내용 : <textarea rows="30" name="contents" cols="70"><%=vo.getContents() %></textarea><br>
작성자 : <input type="text" name="writer" value="<%=vo.getWriter() %>"><br>
<input type="submit" value="수정완료">
</form>
<%	
}
%>
</body>
</html>