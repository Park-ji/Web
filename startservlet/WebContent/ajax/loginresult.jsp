<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
id pw : hr/hr 로그인 인증
html태그들은 브라우져에 전송되면 안됨 : 주석도 조심할것(주석있어도 되는이유는 브라우저에 전송되어서 브라우저가 해석해서 빼는 것임)

ajax 응답 = json 형태 -> html태그 포함 되면 x
{"A":"VALUE", "":""}

* 전달해줄 변수
auth : true
logintime : 현재시각
==> json 형태로 (jsp파일에서 json 형태는 ""로 String처리하면 됨)
단, 논리값(true, false) 제외

ajax 응답시 규칙은 다음과 같음
 --%>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String result = "";
if(id.equalsIgnoreCase("hr")&&pw.equalsIgnoreCase("HR")){
	result = "{\"auth\":true, \"logintime\":\"2019-12-16 16:12:12\"}";
}
else{
	result = "{\"auth:false\"}";
}
%>
<%Thread.sleep(5000);//5초 기다리고 결과 나오게함 %>
<%=result%>

