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
<!-- vo.ProductVO 객체 생성. 값 저장 - 저장 -->
<%-- <%
	ProductVO vo = new ProductVO();

%>
<h3><%=vo.getCode() %></h3>
<h3><%=vo.getName() %></h3> 
<%
vo.setCode(1000);
vo.setName("컴퓨터");
vo.setPrice(100000);
vo.setDetail("안사도되요");
%>
<h3><%=vo.getCode() %></h3>
<h3><%=vo.getName() %></h3> 
<h3><%=vo.getPrice() %></h3> 
<h3><%=vo.getDetail() %></h3>  --%>
<!-- scope="page": 공유하지 않는다의 의미(나만 사용함)/cf) ctrl+space해서 나오는 목록중 다른 색깔?기본값
request.setAttribute("vo",vo)의 의미 = scope="request"(즉, 자바문장 간소화됨)-->

<!-- 1. request속성 , productbean2.jsp -->
<%-- <jsp:useBean id="vo" class="vo.ProductVO" scope="request"/>  --%> <!-- id="변수"  class = "패키지명.클래스명" (import가 되었어도 줘야함)  -->
<!-- 
scope="request"에서
request 속성은
vo.ProductVO vo = (vo.ProductVO)request.getAttribute("vo");
if(vo==null){
vo = new ProductVO();
request.setAttribute("vo",vo);와 같은 동작
}
* 즉, 서로 객체 공유할때 사용(ex, foward시)
 -->
 
 <!-- 2. application속성 - productbean3.jsp -->
 <jsp:useBean id="vo" class="vo.ProductVO" scope="application"/>
 
<h3>상품코드(설정이전)"<jsp:getProperty name="vo" property="code"/></h3> 
 <!-- vo객체를 생성한 것을 getter 메소드를 생각해주면 됨 property = getCode (code 이니셜은 대문자로 자동변경해준다.)  -->
<h3>상품명(설정이전)<jsp:getProperty name="vo" property="name"/></h3> 


<!-- 숫자여도 "" 붙여줘야함  -->
<!-- vo.setCode(Integer.parseInt("1000")) 
parm : parameter / 
vo.setCode(Integer.parseInt(request.getParameter(\"code\")))

html 태그 -- jsp -- vo 의 수행과정을 다 한거다.

form 전달 데이터중 같은 이름의 파라미터값 전달

html 태그 input name값 -- jsp -- vo 변수명
-->
<%-- 
<jsp:setProperty property="code" name="vo"/> <!-- prduct name의값과 property가 같으면 param생략가능  -->
<jsp:setProperty property="name" name="vo"/>
<jsp:setProperty property="price" name="vo"/>
<jsp:setProperty property="detail" name="vo"/> --%>


<jsp:setProperty property="*" name="vo"/>
<!-- form에서 읽어온 정보를 vo에 저장(set)  -->


<h3>상품코드(설정이후):<jsp:getProperty property="code" name="vo" /> </h3>
<h3>상품명(설정이후):<jsp:getProperty property="name" name="vo" /> </h3>
<h3>상품가격(설정이후):<jsp:getProperty property="price" name="vo" /> </h3>
<h3>상품설명(설정이후):<jsp:getProperty property="detail" name="vo" /> </h3>


<jsp:forward page="productbean2.jsp"/>
<!-- forward시? 위의 출력문 무시 + request객체를 함께 넘겨짐 -->
</body>
</html>

