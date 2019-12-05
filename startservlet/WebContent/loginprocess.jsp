<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
%>
    
<%
//Servlet과 비교하면서 보기
//1. 요청 : id, pw 요청 파라미터변수 입력값(url?.....)
//-> 요청방식을 구분하지 않는다(get,post방식 상관 x)
//cf) Servlet에서
//get 방식 : 요청파라미터 한글 -> 설정 필요 x
//post 방식 : 요청파라미터 한글 -> request.setCharacterEncoding("utf-8");이 필요
//72p. request 내장 객체 

if(request.getMethod().equals("POST")){
//자바스크립트에서는 문자열 비교도 ==로 해도되지만 자바에서는 x
request.setCharacterEncoding("utf-8");//즉, jsp도 post일때 한글이 넘어올수 있으므로 미리 지정해놓기
}
String id = request.getParameter("id");
String pw = request.getParameter("pw");
//2. 처리
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1,h3{display: inline;}
</style>
</head>
<body>

<%-- <% //3. 응답 브라우저 출력
//위치가 여기 있는 이유 ? html태그가 들어가므로 body내부에서 만들어야함
//위의 jsp스크립트 태그에 쓰면 그 이후에 <!DOCTYPE html>로 html문서가 생겨서 안됨 
out.println("<h1>내용</h1>");%> --%>
<h1><%=id %></h1>회원님 암호는
<br>
<h3><%=pw %></h3>입니다.
<br>
<h1>요청방식=<%=request.getMethod()%></h1><br>
<h1>요청클라이언트ip=<%=request.getRemoteAddr()%></h1><br>
<h1>요청uri = <%=request.getRequestURI()%></h1><br>
<h1>컨텍스트명 = <%=request.getContextPath() %></h1><br>
</body>
</html>