<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- http://127.0.0.1:8081/jquery/jquery-3.2.1.min.js에도 있음 -->
<!-- <script scr="http://localhost:8081/startservlet/jquery-3.2.1.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script><!-- jquery항상 최신 버전 사용 -->


<script>
$(document).ready(function(){
/* 	$("#generalbtn").on('click',function(){
		//이동하면서 id, pw를 전달해주는 것이 아니라서 경로에 써줘야함
		location.href="/startservlet/ajax/loginresult.jsp?id=";
		
	}); */
	
	$("#ajaxbtn").on('click',function(){
		//이동하면서 id, pw를 전달해주는 것이 아니라서 경로에 써줘야함
		//location.href="/startservlet/ajax/loginresult.jsp";
		requestAjax();
	});	
});

//ajax는 요청, 응답하는 규칙이 엄함
//요청시, 다음과 같이
//응답시, loginresult.jsp
function requestAjax(){
	$.ajax({ //요청-내화면 계속 + 응답 대기 + 응답 내화면에 추가
		//url, type, data : 요청파라미터를 넘김
		url:'loginresult.jsp',
		type:'get', //get방식, post방식 다 가능
		data:{"id":$("#id").val(), "pw":$("#pw").val()}, //data : 클라이언트가 서버에 요청한 data
		//data넘겨주는 형식도 json형식으로(여러개 이므로 객체형식{}으로 묶음) 
		
		//응답을 받아오는 규칙
		dataType:'text',
		success:function(server_response){
			var server_json = JSON.parse(server_response);//json형식에 맞게 왔는지 검사 - 맞으면 server_json에 저장
			//server_json : auth, logintime변수가 저장
			if(server_json.auth==true){
				$("#here").html(server_json.auth+":"+server_json.logintime+"시각에 로그인하셨습니다.");
				$("#here").css("color","green");
			}
			else{
				$("#here").html(server_json.auth+": 비정상 로그인입니다.");
				$("#here").css("color","red");
			}
		}, //성공시 - server_response(data) : 서버가 클라이언트에 응답한 data
		error:function(e){alert(e)}, //에러
		complete:function(){} //종료(성공이든지 에러든지 상관없이 실행)	- 서버와의 통신이 끝남
	});
}

</script>
</head>
<body>
<h1> 로그인폼 </h1>
<form action="/startservlet/ajax/loginresult.jsp"><!-- /startservlet/loginresult.mvc -->
아이디<input type="text" name="id" id="id"><br><!-- id속성을 이용해 jquery에서 읽기 -->
암호<input type="password" name="pw" id="pw"><br>
<input type=submit id="generalbtn" value="일반로그인"><br>
<input type=button id="ajaxbtn" value="ajax로그인"><br>
</form>

<!-- 로그인한 결과를 ajax로 받아온 결과를 표시 -->
<!-- ajax 요청은 원래 화면은 그대로 남아있고 일부 화면만 갱신이 됨  -->
<div><h1 id="here"></h1></div>
<h1> 로그인 결과는 윗줄에 표시됩니다. </h1>

</body>
</html>