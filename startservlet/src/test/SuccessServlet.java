package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SuccessServlet")
public class SuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out  = response.getWriter();
		out.println("<h2>아이디: "+id+ "</h2>");
		out.println("<h2>암호: "+pwd+ "</h2>");
		out.println("<h2>이름: "+name+ "</h2>");
		out.println("<h2>폰 번호: "+phone+"</h2>");
		System.out.println("콘솔출력");
		
	}

}
