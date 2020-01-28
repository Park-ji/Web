<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록페이지</title>
</head>
<body>
<h1> 상품등록페이지</h1>
<form action="productbean.jsp">
상품코드: <input type=text name="code"><br>
상품명: <input type=text name="name"><br>
상품가격: <input type=text name="price"><br>
상품설명: <input type=text name="detail"><br>
<input type="submit" value="상품등록">
<!-- 이름지어주는 규칙을 jsp : name = javaVO클래스 : 변수명   -->



</form>
</body>
</html>