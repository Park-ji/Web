<%@page import="java.util.ArrayList"%>
<%@page import="cart.ProductDAO"%>
<%@page import="cart.ProductVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 상품 목록은 다음과 같습니다. </h1>
<form action = "/startservlet/cart/cartsave.jsp">
<select name="productname">
<%
ProductDAO dao = new ProductDAO();
ArrayList<ProductVO> list = dao.getProductList();
for(ProductVO vo:list){
	out.println("<option value=\'"+vo.getName()+":"+vo.getCode()+":"+vo.getPrice()+"\'>"+vo.getName()+"</option>");
	//cf, value값에 '키트리컴퓨터:1000'식으로 넘기면 ':'기준으로 split할수 있음
}
%>
</select>
수량 : <input type="text" name="count">
<input type="submit" value="장바구니저장">
</form>
</body>
</html>
