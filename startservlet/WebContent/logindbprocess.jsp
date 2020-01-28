<%@page import="dao.MemberDAO, vo.MemberVO"%>
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
//2. 처리 : DAO, VO 사용
MemberDAO dao = new MemberDAO();
MemberVO vo = new MemberVO();
vo.setId(id);
vo.setPw(pw);
String str="";
int result = dao.getMember(vo);//1:id,pw | 2:pw x | 3:id x
if(result==1) str = "정상 로그인 되었습니다.";
else if(result ==2) {
str ="비밀번호 오류";
response.sendRedirect//자동으로 이동하게 해놓음(위의 str은 보이지 않음)
("http://127.0.0.1:8082/startservlet/logindb.jsp");
}
else if(result==3) str = "등록된 회원정보가 없습니다.";
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=str %>
</body>
</html>