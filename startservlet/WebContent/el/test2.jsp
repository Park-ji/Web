<%@page import="cart.ProductVO"%>
<%@page import="cart.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
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
	<%
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductVO> list = dao.getProductList();
		pageContext.setAttribute("el_list", list);
	%>
	<c:set var="type" value="${param.type}" />
	<c:set var="word" value="${param.word}" />

	<c:forEach items="${el_list}" var="productvo">
		<c:if test="${param.type.equals('상품명')}">
			<c:if test="${productvo.name.contains(word)}">
				<h3>${productvo.name} - ${productvo.price} - ${productvo.exp}</h3>
			</c:if>
		</c:if>
		<c:if test="${type.equals('가격')}">
			<c:if test="${productvo.price ge word}">
				<h3>${productvo.name} - ${productvo.price} - ${productvo.exp}</h3>
			</c:if>
		</c:if>
		<c:if test="${type.equals('상품정보')}">
			<c:if test="${productvo.exp.contains(word)}">
				<h3>${productvo.name} - ${productvo.price} - ${productvo.exp}</h3>
			</c:if>
		</c:if>
	</c:forEach>
</body>
</html>