package forward;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/forward")
public class FowardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>forward 이전 서블릿 영역입니다</h1>");

		RequestDispatcher rd = request.getRequestDispatcher("/forward/forward3.jsp");
		rd.forward(request,response);
		
		out.println("<h1>forward 이후 서블릿 영역입니다</h1>");
	}

}
