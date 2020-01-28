<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script scr="jquery-3.2.1.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	$("#pagebtn").on('click',function(){
		requestAjax();
	});	

});

function requestAjax(){
	$.ajax({ 
		url:'boardadd.jsp',
		type:'get', 
		data:{"pagenum":$("#pagenum").val()},
		//dataType:'text',
		//서버 처리
		success:function(server_data){
			server_array = JSON.parse(server_data);
			//$('#addinglist').append("<table border=3>");
			for(var i=0;i<server_array.length;i++){
				$("tr:last").after//tr태그중에 마지막(tr:last) 뒤에(after) 추가하기
				("<tr><td>"
				+server_array[i].seq+"</td><td>"
				+server_array[i].title+"</td><td>"
				+server_array[i].viewcount
				+"</td></tr>");
			}
			//$('#addinglist').append("</table>");
		},
		error:function(e){alert(e)}, 
		complete:function(){}
	});
}

</script>
</head>
<body>

<%
BoardDAO dao = new BoardDAO();
ArrayList<BoardVO> list = dao.getBoardList(1, 5);
%>
<form action="">
페이지번호 : <input type="text" id="pagenum">
<input type="button" id="pagebtn" value="게시물추가">
<br>
<table border=3>

<%
int len = list.size();
for(int i=0;i<len;i++){
	BoardVO vo = new BoardVO();
	vo = list.get(i);
%>
<%-- out.println
("<tr><td>" + list.get(i).getSeq()+"</td><td>" +  list.get(i).getTitle()
	+ "</td><td>" + list.get(i).getViewcount() + "</td></tr>");
} --%>
	<tr>
	<td><%=vo.getSeq() %></td>
	<td><a href="boarddetail.jsp?seq=<%=vo.getSeq()%>"><%=vo.getTitle() %></a></td>
	<!-- 경로? start.jsp가 기준임/ 또한, a태그 get방식밖에 사용 불가 -->
	<%-- <td><%=vo.getWriter() %></td> --%>
	<td><%=vo.getViewcount() %></td>
	</tr>
<%	
}
%>
<div id="addinglist"></div>
</table>
</form>
</body>
</html>