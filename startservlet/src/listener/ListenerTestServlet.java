package listener;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ListenerTestServlet")
public class ListenerTestServlet extends HttpServlet {
	protected void doGet
	(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//여기서, 왜 한글인코딩이 잘될까? EncodingFilter파일에서 모든파일에 적용되게 설정해놨기 때문에
		out.println("<h1>ListenerTestServlet 수정되었습니다.</h1>");
		ServletContext sc = request.getServletContext();
		out.println("<h1>컨텍스트리스너로부터 전달받은 속성들</h1>");
		out.println("<h1>"+sc.getAttribute("개발자")+"</h1>");
		out.println("<h1>"+sc.getAttribute("location")+"</h1>");
		out.println("<h1>"+sc.getAttribute("time")+"</h1>");
	}

}
