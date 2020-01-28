<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cart.ProductDAO"%>
<%@page import="cart.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<!-- 반복문 -->
	<h1>정수의 합을 계산</h1>
	<%-- 	
	<%
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum = sum + i;
		}
	%> 
--%>
	<!-- == -->
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="10" step="1">
		<h3>${i}:${ sum = sum + i }</h3>
	</c:forEach>

	<!-- 배열내용 조회 -->
	<h1>배열 내용 조회</h1>
	<%
		String[] colors = { "빨강", "파랑", "녹색", "검정", "흰색" };
		pageContext.setAttribute("el_colors", colors);
	%>
	<%-- 
	${pageScope.el_colors} == ${el_colors}
	--%>
	<c:forEach items="${el_colors}" var="col">
		<h3>${col}</h3>
	</c:forEach>
	<!-- 
	items 자체가 배열이라 인덱스를 도는 i가 필요 없음
	향상된 for문(=foreach문) 같은 느낌
	-->

	<!-- 상품정보조회 -->
	<h1>상품정보조회</h1>
	<%
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductVO> list = dao.getProductList();
		pageContext.setAttribute("el_list", list);
	%>
	<c:forEach items="${el_list}" var="productvo">
		<h3>${productvo.code}:${productvo.name}:${productvo.price}</h3>
	</c:forEach>

	<!-- 색상정보조회 -->
	<h1>색상정보조회</h1>
	<%
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("빨강","red");
		map.put("파랑","blue");
		map.put("녹색","green");
		map.put("흰색","white");
		map.put("검정","black");
		pageContext.setAttribute("el_map", map);
	%>
	<c:forEach items="${el_map}" var="map" varStatus="vs">
		<h3>count : ${vs.count}, index : ${vs.index}</h3> 
		<h3>${map}의 개별 값 : key = ${vs.current.key}, value = ${map.value}</h3>
	</c:forEach>
	<!-- 
	Map은 순서를 보장하지 않는다. 
	varStatus : 주로 인덱스 조회할 때 사용
	vs.count = 1~반복횟수
	vs.index = 0~반복횟수-1
	vs.current = 현재객체
	vs.first = 첫번째 값인지 검사 boolean return
	vs.last = 마지막 값인지 검사 boolean return
	-->
	<%-- 
	map.getkey() = ${map.key} 
	map.getValue(key) = ${map.value} 
	--%>
	
	<!-- 
	위 방식으로 사용하면 선언과 조회를 다른 페이지에서 하는 경우
	조회페이지에서는 import가 필요없음!
	-->
	
</body>
</html>