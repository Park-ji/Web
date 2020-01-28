<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<%
//Enumeration<String> e = request.getHeaderNames();
String result="";
String clientip = request.getRemoteAddr();
//response.setHeader("Access-Control-Allow-Headers", "Date");
//String date = request.getHeader("Date");
Date date = new Date();
String uri = request.getRequestURI();
String agent = request.getHeader("User-Agent");
String browser = "";
if(agent.indexOf("Chrome")>-1) browser ="Chrome";
else if(agent.indexOf("msie")>-1) browser = "Explorer";
result = "클라이언트ip:"+clientip+"\n접속시간:"+date+"\n호출했던 uri :"+uri
+ "\n브라우저 이름 : "+browser;
try{
//System.out.println(new File("").getAbsolutePath());
//FileWriter fw = new FileWriter("C:\\Users\\KITRI\\git\\Web\\startservlet\\log.txt",true);
FileWriter fw = new FileWriter("C:\\Users\\KITRI\\git\\Web\\startservlet\\log.txt");
fw.write(result);
fw.close();
}catch(IOException e){
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>