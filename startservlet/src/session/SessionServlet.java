package session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SessionServlet")
public class SessionServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//sessionset.jsp의 sessionid, sessionage를 읽어오기
		//Servlet에서는 내장객체가 없으므로 만들어야함
		HttpSession session = request.getSession();//늘 세션을 만드는 것 x = 없으면 만들고 있으면 갖다씀
		/*
		 * 1. 현재 서블릿 실행 이전 브라우저 내부에서 sessionset.jsp 실행한 적 있나
		 * 1-1. 있다? sessionset.jsp가 생성해놓은 session내장객체를 그대로 전달받아서 사용하자
		 * 그래도 전달? sessionid, sessionage 정보도 같이 전달
		 * 1-2. 없다? session이라는 이름으로(위에서 정한 변수명) session객체 생성 
		 * */
		//1-1의 상황, 1-2의 상황의 대비
		String sessionid="세션에서 전달받은 아이디 없음";
		int sessionage = 0;
		if(session.getAttribute("sessionid")!=null) {
			sessionid = (String)session.getAttribute("sessionid");
		}
		if(session.getAttribute("sessionage")!=null) {
			sessionage = (Integer)session.getAttribute("sessionage");
		}
		session.setAttribute("장바구니", "상품10개 들어있어요");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>"+sessionid+":"+sessionage+"</h1>");
	}

}
