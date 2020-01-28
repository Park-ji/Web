<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>서버이름 : <%=application.getServerInfo() %></h3>
<h3>서버버전 : <%=application.getMajorVersion() %>.<%=application.getMinorVersion()%></h3>
<h3>컨텍스트이름 : <%=application.getContextPath() %></h3>
<%
//브라우저에 나타나는 출력물들이 x
application.log("내가 남기는 정보입니다.");
/* 
12월 06, 2019 1:18:37 오후 org.apache.catalina.core.ApplicationContext log
INFO: 내가 남기는 정보입니다. 
- 서버가 시작될때 정보가 보여지는 것처럼 로그를 남김
- INFO, ERROR 등 정보의 형태를 지정할 수 있음
*/
System.out.println("내가 남기는 출력물입니다.");
//콘솔출력 : 수행결과, 정보, 오류 등 어떤 의도로 출력하는 지 모호하다
%>
<!--
logindb로 url 매핑 서블릿클래스 : src/test/LoginDBServlet 
즉, url에 매핑 되어있는 실제 Servlet의 파일 경로 : application.getRealPath("logindb")
-->
<h3><%=application.getRealPath("application.jsp") %></h3>
<%-- 
<!-- test1:web.xml -->
<h3><%=application.getInitParameter("title") %></h3>
<h3><%=application.getInitParameter("name") %></h3>
 --%>

<!-- test2: 서블릿 저장 변수 -> id:application로 부터 읽어오기 -->
<h1><%=application.getAttribute("id") %></h1>
<!-- 실행은 Servlet먼저 하지 않으면 null이 나옴 (읽어올 값이 없기 때문에)  
물론, 여기서도 setAttribute로 변수 공유할 수 있음 (단, application.을 사용)-->

</body>
</html>















