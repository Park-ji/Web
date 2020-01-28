<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! 
public void getId(PageContext pc) throws IOException{
//out, request를 선언문태그내에서 인식하지 못함 
//이유? out, request는 _jspService()내부에 선언된 메소드(즉, 지역변수임)
//해결 방법? 매개변수로 PageContext타입을 받음
//1> pc.getRequest(); //내자신이 가지고 있는 Requset내장 객체를 받아옴
//2> pc.getOut(); //내자신이 가지고 있는 Out내장 객체를 받아옴
//try{
pc.getOut().println(pc.getRequest().getParameter("id"));
//}catch(Exception e){}
}
%>

<% getId(pageContext);//메소드 호출
//매개변수로 pageContext를 넘김
%>
<%-- <%=request.getParameter("id") %>
<!-- request내장객체로 id읽어와서 브라우저에 출력 --> --%>
</body>
</html>