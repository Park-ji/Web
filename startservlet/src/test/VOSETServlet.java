package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.MemberVO;

@WebServlet("/voset")
public class VOSETServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//vo.MemberVO 클래스 : MEMBER 테이블 컬럼들 변수 -> setter, getter
		//1. MemberVO 객체 생성 : context/context/이자바/0110-9999-8888/ja@a.com/2019-12-06
		MemberVO vo = new MemberVO("context","context","이자바","0110-9999-8888","ja@a.com", "2019-12-06");
		
		//3. voget.jsp에서 확인 가능하도록 공유 - Servlet에는 내장객체가 없으므로 구현
		//getServletContext는 HttpServlet에서 상속받아서 사용됨
		ServletContext c = getServletContext();
		c.setAttribute("member", vo); //객체를 공유할 수 있음 -> 여기서는 vo객체를 공유
		
		//2. 브라우저에 응답 결과 출력
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>MemberVO 객체를 하나 생성했습니다.</h1>");
		out.println("<h1>생성된 객체의 정보는 voget.jsp 파일에서 확인하세요.</h1>");
	
	}

}
