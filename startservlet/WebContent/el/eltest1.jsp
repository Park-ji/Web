<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	
	<!-- 1 -->
	<h1>'<%=request.getParameter("id")%>'</h1>
	<!-- == -->
	<h1>'${param.id}'</h1>	
	
	<!-- 2 -->
	<h1>'<%=Integer.parseInt(request.getParameter("age"))+1%>'</h1>
	<!-- == -->
	<h1>'${param.age+1}'</h1>	
	<!-- 
	차이점 (EL 기준)
	1. null일 경우 무시(화면에 출력도 X) 
		-> NullPointerException 예외처리가 필요없음
	2. 숫자 연산시 	형변환 과정 필요 X
		-> 숫자가 아닌 값이 들어와도 NumberFormatException 발생하지 않음
			-> 형변환 메소드를 사용하지 않기때문에
	--> 
--%>
	
	<% int i = 10; %>
	<h3>표현문 태그 = <%= i %></h3>
	<h3>EL = ${ i }</h3>
	<!-- 자바 - EL 변수 공유 X -->
	
	<% pageContext.setAttribute("ii", i); %>
	<!-- 
	pageContext : 현재 페이지의 내장객체를 가져오는 객체? 
	JSP 페이지가 서블릿으로 변환될 때 기본객체들을 생성하는데에 사용
	-->
	<h3>EL = ${ ii }</h3>
	<!-- pageContext에 set을 해주면 자바 변수를 EL표현식으로 사용 가능 -->
	
	<h3>EL = ${ j = 10 }</h3>
	<!-- 변수 선언과 동시에 출력도 해줌, 세미콜론(;) 필요 X -->
	
	<h3>EL = ${ j + 100 }</h3>
	<!-- j에 다시 저장하지 않아도 출력  가능 -->
	
	<h3>EL = ${ k = 3.14 }</h3>
	<h3>EL = ${ h = 'a' }</h3>
	<h3>EL = ${ l = "java" }</h3>
	<h3>EL = ${ t = true }</h3>	
	<!-- 자바에서 가능한 모든 자료형 가능 -->
	
	<h3>EL = ${ n = null }</h3>
	<!-- null 값을 가질 수는 있지만 공백으로 처리하기 때문에 화면에 표시되지는 않음 -->
	
	<h3>EL = ${ a = 10; b = 20 }</h3>
	<!-- 
	한 EL문 안에서 여러개의 변수를 선언할 때는 중간에만 세미콜론으로 구분을 줌, 마지막 문장엔 세미콜론 X
	선언은 가능하지만 표현은 마지막 1개만 해줌 
	-> 출력 결과값 : EL = 20
	-->
	
	<%-- <h3>EL = ${ 100 div 10 }</h3> --%>
	<!-- 
	/는 문장의 종료태그와 혼동될 수 있기 때문에 div로 사용해도 됨
	javascript처럼 정수/정수 = 실수가 된다.
	-->
	<h3>EL = ${ 100 mod 10 }</h3>
	<!-- %는 문장의 자바태그와 혼동될 수 있기 때문에 mod로 사용해도 됨 -->
	
	<h3>EL = ${ '10' + 20 }</h3>
	<!-- 
	java에서는 String의 +연산이 가능하기 때문에 1020으로 출력
	EL은 +연산자가 산술연산밖에 못하기 때문에 30출력
	-->
<%-- 	<h3>EL = ${ '10' += 20 }</h3>
	<!-- 
	String +연산하려면 += 사용하여야함 
	-> 출력 결과값 : 1020 --> --%>
	
<%-- 
	<h3>EL = ${ '십' + 20 }</h3>
	<!-- String은 산술연산을 할 수 없기 때문에 오류 발생 --> 
--%>

	<%-- <h3>EL = ${ null + 20 }</h3> --%>
	<!-- 
	null은 화면에 공백으로 출력되지만
	연산을 할 때는 long타입의 0을 리턴
	-> 출력 결과값 : EL = 20
	-->
	
	<h3>EL = ${ 10 gt 20 }</h3>
	<h3>EL = ${ 10 lt 20 }</h3>
	<h3>EL = ${ 10 eq 20 }</h3>
<%-- 	<h3>EL = ${ 10 ne 20 }</h3> --%>
	<h3>EL = ${ 10 ge 20 }</h3>
	<h3>EL = ${ 10 le 20 }</h3>
	<!-- 
	부등호(<>)도 태그에 많이 사용 되기 때문에 gt(>), lt(<)로 사용 가능
	eq(==), ne(!=), ge(>=), le(<=)도 있음
	-->
	
	<h3>EL = ${ iii = null }</h3>
	<h3>EL = ${ empty iii }</h3>
	<!-- empty : 비어있는 객체인지 검사 = null, 빈문자열, 0 검사 -->
	
	<% 
		int j = 10;
		String result = j > 10 ? "크다" : "작거나 같다";
		out.println(result);
	%>
	
	
	<h3>EL = ${ empty null ? "비어있다" : "값이있다" }</h3>
		
	<!-- 
	null 검사시 iii == null도 가능하긴 하지만 empty 사용하는 것이 좋음
	EL에서 조건 삼항 연산자 사용 가능
	-->
	
	<h3>EL = \${el표현식}</h3>
	<!-- EL표현식을 문자 그대로 사용하고 싶으면 \를 붙이면 됨 = 자바와 동일 -->
	
	<h3>EL = ${ vo.name }</h3>
	<!-- getter메소드만 위와 같이 표현 가능 == vo.getName() -->
	
	<h3>EL = ${ Math.random()*100 }</h3>
	<!--
	위와 같은 경우에 자바에서 Math객체를 생성하지 않고  Math클래스 호출로 바로 사용
	-> random이 static메소드이기 때문에 
	EL(3.0)에서도 자바와 동일하게 사용 가능
	-->
	
	<!-- 
	연산자 우선순위
	()>산술(*, /, % > +, -)>비교>논리>조건삼항>할당
	-->
	
</body>
</html>