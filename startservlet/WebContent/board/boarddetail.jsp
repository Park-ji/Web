<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$(":submit").on('click',function(){/* :submit -> submit 버튼 */	
		if($(this).val()=='수정'){
			$("#f").attr("action","boardupdateform.jsp");
		}
		else if($(this).val()=="삭제"){
			$("#f").attr("action","boarddelete.jsp");
		}
	});
});
</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int seq = Integer.parseInt(request.getParameter("seq"));
BoardDAO dao = new BoardDAO();
BoardVO vo = dao.getBoardDetail(seq);
%>
<h1>게시물 상세조회 결과</h1>
<h3>번호 : <%=vo.getSeq() %></h3>
<h3>제목 : <%=vo.getTitle() %></h3>
<h3>내용 : <%=vo.getContents() %></h3>
<h3>작성자 : <%=vo.getWriter() %> </h3>
<h3>작성시간 : <%=vo.getTime() %></h3>
<h3>조회수 : <%=vo.getViewcount() %></h3>
<form id="f" action="" method="post"><!-- start.jsp와 같은 경로에 있음  -->
글암호 : <input type="password" id="pw" name="password">
<input type="hidden" name="seq" value="<%=vo.getSeq()%>">
<input type="hidden" id="hpw" name="db_password" value="<%=vo.getPassword() %>">
<input type = "submit" id="updatebtn" value="수정">
<input type = "submit" id="deletbtn" value="삭제">
</form>
<a href="boardlist.jsp">뒤로</a>
<!-- 번호, 제목, 내용, 작성시간, 조회수 -->
<!-- 
form 
암호
수정 삭제
- 수정 버튼 클릭시 boardupdateform.jsp 이동
boardupdateform.jsp
암호 : db 조회 암호 같은지 확인

1> 같으면 
번호 -  xxx
제목 - 수정 이전 내용 출력한 후에 입력가능 (input)
내용 - 수정 이전 내용 출력한 후에 입력가능(textarea)
작성자 - 수정 이전 내용 출력한 후에 입력가능(input)
boardupdateprocess.jsp 전달
제목, 내용, 작성자 수정 전달
BoardDAO : public int updateBoard(번호, 제목, 내용, 작성자) sql update 작성

2> 같지 않으면 boarddetail.jsp 이동

삭제 버튼 클릭시 boarddelet.jsp 이동
암호 : db 조회 암호 같은지 확인
1> 같으면? 삭제
BoardDAO : public int deletBoard(번호) 게시물 삭제 sql
2> 같지 않으면?
 -->

</body>
</html>