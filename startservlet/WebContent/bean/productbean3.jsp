<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
applicaton내장객체에 setAttribute을 한다의 의미? 현재 jsp 실행 컨텍스트의 모든 jsp와 공유
application.setAttribute("vo",vo);
cf) request내장객체 : 현재 요청처리에 관련된 jsp끼리만 공유 - include,forward된 파일끼리
	request.setAttribute("vo",vo);
 -->
 <jsp:useBean id="vo" class="vo.ProductVO" scope="application"/>
 <h3><jsp:getProperty name="vo" property="code"/></h3>
 <h3><jsp:getProperty name="vo" property="name"/></h3>
 <h3><jsp:getProperty name="vo" property="price"/></h3>
 <h3><jsp:getProperty name="vo" property="detail"/></h3>
</body>
</html>