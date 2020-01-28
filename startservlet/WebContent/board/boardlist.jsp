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
<!-- 조회수는 >=의 조건 -->
<form action="boardlist.jsp">
<!--ex)boardlist.jsp?pagenum="1"&item="제목"&searchword="자바" -->
검색항목 : 
<select name="item">
<option>모두</option>
<option>제목</option>
<option>내용</option>
<option>작성자</option>
<option>조회수</option>
</select>
검색어 : <input type=text name="searchword">
<input type="submit" value="검색">
</form>

<h1>게시물 리스트</h1> 
<table>
<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th></tr>

<%
request.setCharacterEncoding("utf-8");

String item= request.getParameter("item");
String searchword = request.getParameter("searchword");
String pageString = request.getParameter("pagenum");
if(pageString == null) {pageString = "1";}
int currentpage = Integer.parseInt(pageString);
int recordPerPage = 5;

BoardDAO dao = new BoardDAO();
ArrayList<BoardVO> list;

if(item!=null && searchword!=null){
	//BoardDAO : getBoardList(item,searchword)
	list = dao.getBoardList(item, searchword);
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
	<a href="boardlist.jsp">원래 리스트</a>
<%
}
else{
//String pageString = request.getParameter("pagenum");
//if(pageString == null) {pageString = "1";}
//pagenum 파라미터 전달 x -> int는 null비교 x이므로 String으로 받음
//int currentpage = Integer.parseInt(pageString); //사용자가 보려고 하는 페이지
//int recordPerPage = 5;//한 페이지마다 보여줄 레코드 개수(개발자가 맘대로 정함)
//BoardDAO dao = new BoardDAO();
//ArrayList<BoardVO> list = new ArrayList<BoardVO>();
//ArrayList<BoardVO> list = dao.getBoardList(); //전체 게시물 조회
list = dao.getBoardList(currentpage, recordPerPage);

//사용자가 정한 해당페이지의 해당갯수만큼 게시물 조회
//ex, dao.getBoardList(1,5); -> 1페이지에서 5개 보여줘
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
<%
//페이지수를 알기위해서는? 전체개시물 갯수와 개발자가 정한 한페이지에 보일 수(ex, 5)가 필요함
//BoardDAO dao =new BoardDAO() -> 위에 선언
int total = dao.getTotalBoard();//전체 개시물 갯수
int pagenum = total/recordPerPage;
if((total%recordPerPage)!=0) pagenum++;
for(int i=1;i<=pagenum;i++){
%>
<a href="/startservlet/board/boardlist.jsp?pagenum=<%=i%>"><%=i%></a>&nbsp;
<%
}
}
%>


</body>
</html>








