<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "/startservlet/forwardlogin" method = "post">
<!-- get과 post일때 각각의 시작주소가 다르기때문에 절대경로로 줌
1. get방식일때는 LoginServlet먼저 시작하면 시작주소가 servlet기준이라서 forwardlogin만 써도 됬지만
2. post방식일때는 login.jsp가 먼저 실행되어야만하므로 시작주소가 login.jsp기준임 : ../forwardlogin
3. 그래서 ../forwardlogin해버리면 다시 1번의 경우에 못찾아감(상위경로로 빠져서) -->
아이디 <input type = "text" name = "id"><br>
암호 <input type="password" name = "pw"><br>
<input type="submit" value="로그인">
</form>
</body>
</html>