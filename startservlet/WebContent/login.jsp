<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale=1.0"/>
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	
});//ready end
</script>
</head>
<body>
<form action='<%=request.getContextPath()+"/loginprocess.jsp" %>' method="get">
<!-- action할 jsp파일의 프로젝트가 계속 바껴도 상관없 -->
<!-- 
1. Servlet처럼 url매핑하는 것이 아님 -> 파일명을 작성함 
2. jsp는 메소드 방식이라는 것이 없기 때문에 get, post방식 다 처리가능
-->
아이디<input type ="text" name="id"><br>
암호<input type="password" name="pw"><br>
<input type="submit" value="로그인">
</form>

<a href = "loginprocess.jsp?id=한&pw=12">이동</a>
<!-- a태그로 설정 : 무조건 get방식
즉, post방식은 form태그에서밖에 못함
 -->
</body>
</html>