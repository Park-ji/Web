<%@page import="vo.MemberVO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>홈페이지 방문을 환영합니다.</h1>
<% request.setCharacterEncoding("utf-8"); %>
<%=request.getParameter("id")%>를 브라우저에서 전달받았습니다.

<%-- 
안에 사용할 내용 없으면
<jsp:include page="include2.jsp"/>
이렇게 끝내도 됨--%>

<%-- <jsp:include page="/in2/include2.jsp"></jsp:include>
<jsp:include page="../in2/include2.jsp"></jsp:include> --%>

<!-- 현재 파일에서 include2.jsp 실행시 전달변수 포함-->
<!-- request공유하는 파일과만 parmeter공유시, include전에 공유선언 -->
<% 
MemberVO vo = new MemberVO();
vo.setId(request.getParameter("id"));
vo.setPw("1111");
vo.setName("이자바");
vo.setPhone("010-222-3333");
vo.setEmail("a@b.om");
vo.setIndate("2019-12-09");
request.setAttribute("vo", vo);
%>
<!-- request자체가 include하는 페이지로 들어감
현재, MemberVO타입의 객체를 생성해서 request라는 내장객체에 저장해놓음 
inlcude는 request, response을 공유하고 있기때문에 request가 자체가 전달됨-->
<%-- <jsp:param value="vo" name="MemberVO객체내용"/> --%>
<jsp:include page="/in2/include2.jsp">
<jsp:param value="<%= request.getParameter(\"id\").toUpperCase()%>" name="id"/>
<jsp:param value="id의 이름" name="name"/>
</jsp:include>

	<%-- <jsp:param value="servletjsp" name="id"/> 
	해당부분 주석? 새롭게 주는 것이 아니라 
	include1.jsp가 받은 파라미터값을 넘김 + 또한, 안에 포함된 내용 없으면
	바로 끝내야함</jsp:include>로 말고 ==> 버전에 따라 다름 + 
	또한, 받은 데이터를 가공할때 주로 사용(위의 Uppercase()예제 참고) , 이때, "가 ""안에 있으므로 \"로서 표현해야함
	--%>
<%-- </jsp:include> --%>




<h3>현재 시각은 <%=new Date().toLocaleString() %></h3>
</body>
</html>








