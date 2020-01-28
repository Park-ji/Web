<%@page import="java.util.ArrayList"%>
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
<%
ArrayList<ProductVO> list = (ArrayList)session.getAttribute("info");
if(list == null) list = new ArrayList();
//while(request.getParameter("productname")!=null){
String Info[] = request.getParameter("productname").split(":");
ProductVO vo = new ProductVO();
vo.setName(Info[0]);
vo.setCode(Integer.parseInt(Info[1]));
vo.setPrice(Integer.parseInt(Info[2]));
list.add(vo);
session.setAttribute("info",list);
//}
%>
<a href="cartview.jsp">장바구니 보러 가실래요?</a>
</body>
</html>