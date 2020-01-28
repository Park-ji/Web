package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/context")
public class ServletContextTestServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//web.xml : 현재 컨텍스트 모든 파일들 변수 공유(name, title)
		//javax.servlet.ServletContext타입
		//ex, db연결할때 ojdbc와 같이 긴 내용을 공유할때 같은경우 사용
		ServletContext c = getServletContext(); //이 코드 중요(해석방법 아래와 같음)
		//1. ServletContext가 이미 존재하는 확인(이유? ServletContext는 계속 만드는 것이 아님)
		//: 존재하지 않으면 객체 생성
		//2. ServletContext가 존재하면 ? 생성된 객체를 리턴 받음
		
		//test 1: web.xml에 저장된 변수를 공유할때
//		String title = c.getInitParameter("title");
//		String name = c.getInitParameter("name");
//		out.println("<h1>"+title+":"+name+"</h1>");
		

		//test2 : 서블릿과 jsp 파일들 공유할 때
		//-> id변수 ServletContextTestServlet 저장해서 공유
		c.setAttribute("id", "ServletContextTestServlet");//두번째 매개변수 : 자바객체이면 다 ok
		//의미? 현재 파일 공유함
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
	}

}
