<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {border:2px solid blue;}
th, td {border:2px solid blue;}
</style>
</head>
<body>
<h1>게시물 리스트</h1>
<table>
<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>
<%
request.setCharacterEncoding("utf-8");
BoardDAO dao = new BoardDAO();
//ArrayList<BoardVO> list = new ArrayList<BoardVO>();
ArrayList<BoardVO> list = dao.getBoardList();
int len = list.size();
for(int i=0;i<len;i++){
	BoardVO vo = new BoardVO();
	vo = list.get(i);
	%>
	<tr>
	<td><%=vo.getSeq() %></td>
	<td><a href="boarddetail.jsp?seq=<%=vo.getSeq()%>"><%=vo.getTitle() %></a></td>
	<!-- 경로? start.jsp가 기준임/ 또한, a태그 get방식밖에 사용 불가 -->
	<td><%=vo.getWriter() %></td>
	<td><%=vo.getViewcount() %></td>
	</tr>
<%	
}
%>
<!-- <tr><td>1</td><td><a href="">제목1</a></td><td>작성자1</td><td>조회수</td></tr> : 이런식으로 db에서 받아오기 -->
<!-- 
BoardDAO 
BoardVO
:컬럼 변수, getter/setter, 생성자, toString()오버라이딩 
- BOARD 테이블

getBoardList()
writeBoard()
updateBoard() -->
</table>
</body>
</html>