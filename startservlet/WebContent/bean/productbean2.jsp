<%@page import="vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- request객체가 넘어왔으므로 -->
<%-- <% 
vo.ProductVO vo = (vo.ProductVO)request.getAttribute("vo"); 
if(vo==null){vo= new ProductVO();}
%> 
<h3><%=vo.getCode() %></h3>
<h3><%=vo.getName() %></h3>
<h3><%=vo.getPrice() %></h3>
<h3><%=vo.getDetail() %></h3> --%>

<!-- 위의 코드를 간소화하는 법 : java bean사용 -->
<!-- 아래의 코드는 productbean.jsp에도 있음
1) productbean.jsp ==> 즉, form에서 정보만 받아와서 저장
vo라는 이름으로 객체를 만들기만함(request가 없으므로)+ 만들고 vo라는 변수명으로 vo객체 넣음
 + setProperty로 form에서 넘어온 정보를 저장 + forward로 객체 넘겨줌)
2) productbean2.jsp ==> 받은 정보 출력
이제는 vo객체가 있으므로 만들어진 vo객체를 사용 
 -->
<jsp:useBean id="vo" class="vo.ProductVO" scope="request"></jsp:useBean>
<!-- requset에 vo가 있는지 확인해보고 없으면 만듦(위의 코드 내용을 다 포함하는 태그) -->
 <h3><jsp:getProperty name="vo" property="code"/></h3>
 <h3><jsp:getProperty name="vo" property="name"/></h3>
 <h3><jsp:getProperty name="vo" property="price"/></h3>
 <h3><jsp:getProperty name="vo" property="detail"/></h3>

</body>
</html>