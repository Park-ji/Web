package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/count")
public class CountServlet extends HttpServlet {
	int cnt = 0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Boolean bool = null;
		ServletContext c = getServletContext();
//		int cnt = (int)c.getAttribute("cnt");
//		cnt++;
		
		c.setAttribute("cnt", cnt++);
//		if(c.getAttribute("cnt1")!=bool) {
//			cnt=(int)c.getAttribute("cnt1");
//			c.setAttribute("cnt", cnt++);
//		}
//		else {
//			c.setAttribute("cnt", cnt++);
//		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("우리 사이트에"+cnt+"번 접속하셨습니다.");

	}

}
