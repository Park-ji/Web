<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
제목, 내용, 작성자, 암호 입력받고 글저장
* 번호 추가 
1> select max(seq) from board + 1 
2> sequence 이용
* 작성시간 : sysdate
boardwriteprocess.jsp로 전달
BoardVO 타입 객체 생성
BoardDAO.insertBoard(BoardVO vo)
boardlist.jsp 자동 이동
-->
<%request.setCharacterEncoding("utf-8"); %>
<form action = "boardwriteprocess.jsp " method="post">
제목 : <input type="text" name="title" ><br>
내용 : <textarea rows="30" name="contents" cols="70"></textarea><br>
작성자 : <input type="text" name="writer"><br>
암호 : <input type="password" name="pw"><br>
<input type="submit" value="글저장">
</form>

</body>
</html>