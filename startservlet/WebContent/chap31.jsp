<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="java.util.Date"%>
<!-- 
1. language : 자바 객체를 해석하는 언어
language의 기본 속성이 'java'임 : 즉, language없어도 속성이 지정된 것이나 마찬가지
: jsp태그 안에 있는 언어를 java로 하겠다는 소리

2. *중요* contentType 
: 서블릿 응답 출력 세팅 -> response.setContentType("text/html;charset=utf-8");
브라우져 출력을 할때 설정 ==> tomcat에 html파일을 처리할때 html태그로 해석하고 인코딩 방식을 utf-8로 해라
(servlet처럼 지정하지 않아도 되게끔 선언되어있음)

3. pageEncoding
없어도 됨

4. *중요* import : java api가 어느 패키지에 있는지 알려줌 
 :하나의 속성에 여러개의 값을 넣을 수 있음
4-1>
import = "1,2,3..."
4-2> page지시자를 또 선언해서 import주기
import = "1" 
import = "2"
....
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 3장 예제입니다 </h1><!-- html 문법을 사용함 : 그래서 servlet보다 브라우져에 출력하는것이 편함 -->
<!-- jsp 표현문 태그 : 뒤에 ';'없음  / 또한, 안에 html문법 넣어도 브라우져로 넘어가는 것이기 때문에 사용 가능 -->
<%="<h3>첫번째 예제입니다.</h3>" %><!-- java 문법을 사용함 -->
<h3><%="첫번째 예제입니다."%></h3>
<br>
<% 
//out.println("출력테스트중입니다."); 
System.out.println("콘솔출력");
%>

<% java.util.Date now = new java.util.Date(); %><!-- 현재시간  -->
<!-- 선언문 태그를 사용하지 않고 선언한 예제 -->
현재 시각은 <%= now %> 입니다.
<br>
<%! Date now1 = new Date(); %><!-- 현재시간  -->
<!-- 선언문 태그를 사용 -->
현재 시각은 <%= now %> 입니다.
<%! String member = "멤버변수이므로 모든 메소드 사용 가능"; %>
<% String local = "_jspService메소드에서만 사용 가능"; %>
<%! public void test(){
	System.out.println(member);
	//System.out.println(local); test메서드에서는 사용 불가능 
}
%>
<% test(); %>
<% //member 첫번째 가입 회원 : kitri
	String db_id = "kitri"; //jdbc 연결하는 코드 앞에 생략되었다고 생각해~
%>
<input type=text name="id" value="<%=db_id%>">
</body>
</html>









