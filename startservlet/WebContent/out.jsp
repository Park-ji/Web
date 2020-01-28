<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
buffer="8kb"
autoFlush="true"
%> 
<!-- contenType과 pageEncoding값 같으면 pageEncoding 생략 가능 -->
<!-- 
page 지시문 : buffer(생략해도 기본값 설정되어있음)
cf) buffer를 none으로 지정해놓으면 ? 아래 코드에 buffer관련 코드 있기 때문에 error!
- 기본값 : 8kb(단위는 반드시 kb) /8kb=8192
* cf) out.println(<!DOCT...)-> 이런식으로 저장중인거임, 현재
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% out.println("out 객체 이용하여 출력"); %><br>
<!-- 10번을 작성할때 출력되는 것이 아니라 서버에 모아둠 -->
<%= "표현문 태그를 이용하여 출력" %><br>
<%= "버퍼총크기 = "+ out.getBufferSize() %><br>
<%= "남아있는버퍼크기 = "+out.getRemaining() %><br>
<%-- <% out.flush();
//out.flush() : '버퍼가 꽉 찼으니까, 일단 여기까지 클라이언트한테 보내겠'다의 의미
//그러면, 매번 확인해야함? no(방법? page지시문의 autoFlush속성 'true'로 지정)
//즉, autoFlush속성 있으면 out.flush()안해줘도 ok
%>
 --%><%= "남아있는버퍼크기 = "+out.getRemaining() %>
<% out.clearBuffer();
//버퍼내용을 클라이언트에 보내지 않고 버퍼를 삭제함 : 즉, 클라이언트에게 정보 가지 x
//= 아무것도 출력되지 않음 : '페이지 소스보기'로 확인 가능
%>
<%
if(true){
//자바 스크립트릿태그에서 표현문 태그는 포함을 못함 
%>
<%="if문 실행 출력" %>
<%
}
%>

<%
if(true){
	out.println("if문실행 출력");
} 
%>

</body>
</html>





















