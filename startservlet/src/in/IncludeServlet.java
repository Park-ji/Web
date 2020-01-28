package in;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/include")
public class IncludeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>include 이전 서블릿 영역입니다</h1>");
		//요청을 받아 여러파일에 분배
		//요청할 url? http://ip:port/startservlet/include(in.IncludeServlet)
		// http://ip:port/startservlet/in1/include1.jsp , 물론 servlet파일도 사용 가능
		//현재 startservlet까지 같으므로 ? /in1.include1.jsp
		RequestDispatcher rd = request.getRequestDispatcher("/in3/include3.jsp");
		rd.include(request,response);
		
		out.println("<h1>include 이후 서블릿 영역입니다</h1>");
	}

}
