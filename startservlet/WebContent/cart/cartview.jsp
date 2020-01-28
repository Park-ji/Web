<%@page import="cart.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 현재 장바구니 목록입니다. </h1>
<table>
<%
ArrayList<ProductVO> list = (ArrayList<ProductVO>)session.getAttribute("info");
//int sum=0;
if(list == null) out.println("<h1>저장된 목록이 없습니다.</h1>");
else{
	for(ProductVO vo : list){
		//out.println("<h1>"+count+"번째</h1>");
		out.println("<tr><td>상품코드</td><td>"+vo.getCode()+"</td></tr>");
		out.println("<tr><td>상품이름</td><td>"+vo.getName()+"</td></tr>");
		out.println("<tr><td>상품가격</td><td>"+vo.getPrice()+"</td></tr>");
		out.println("<br>");
		//sum+=vo.getPrice();
	}
}
%>
<a href="productlist.jsp">상품 더 고르실래요?</a>
<%-- <tr><td>합계</td><td><%=sum %></td></tr> --%>
</table>
</body>
</html>