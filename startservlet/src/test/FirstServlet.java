package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServlet
 */

//Servelet은 보안 중시
//서블릿을 웹서버에 등록하는 방법
//1.(서블릿 3.0부터 추가)
//실제클래스이름은 'FirstServlet'이지만 웹서버 요청호출시(url 내부 형식) '/first'로 적힘 
@WebServlet("/first") //@:annotation -> 즉, annotation 웹서블릿 --> 즉, 앞에 http://...가 생략되어있음
//2. http:ip:port/프로젝트명 생략
//web.xml에서 저장
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
