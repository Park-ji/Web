package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RequsetServlet")
public class RequsetServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L; -> 지워도 됨
	
	/*
	 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { // TODO Auto-generated method
	 * stub super.doPost(req, resp); }
	 */
	//즉 doPost나 doGet은 메서드 이름만 다름
	
	//doGet 오버라이딩 : 상위 메서드의 매개변수와 같은 매개변수가 넘어가야함
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://ip:port/프로젝트명/RequestServlet
		//위와 같은 형식으로 요청이 들어왔을 때, 브라우저로 'Hello' 출력하는 예제
		
		
		//[과정 1]: 요청파라미터값 입력
		//만약 servlet을 실행하면 값이 넘어온것이 없기때문에 url에 직접 작성해서 값을 넘겨줘야함
		//그래서 requestform.html을 보냄
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String[] hobby = request.getParameterValues("hobby");
		
		//[과정 2]: 적절한 요청 처리 ex, db의 id가 존재하는지 검사할때 사용
		
		//[과정 3] : 요청 처리 결과를 클라이언트로 리턴 = 응답함
		//1. 브라우저 출력 -> 2번째 매개변수
		//1)
		response.setContentType("text/html;charset=utf-8");
		//2)
		PrintWriter out  = response.getWriter();
		//3)
		out.println("<h2>아이디: "+id+ "</h2>");
		out.println("<h2>암호: "+pw+ "</h2>");
		out.println("<h2>이름: "+name+ "</h2>");
		for(int i=0;i<hobby.length;i++) {
		out.println("<h2>취미: "+(i+1)+"번째="+ hobby[i]+ "</h2>");
		}
		//2. 현재 서버 내부에 출력
		System.out.println("콘솔출력");
	}

}








