package cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartStartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//html 태그로 화면을 작성해야되는 부분이 많다? jsp로 만드는것이 훨씬 더 좋은 구조
		//Servlet으로 session공유하는 것을 공부하려고 만듦
//		HttpSession session = request.getSession();
//		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
//		session.setAttribute("list", list);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>kitri 쇼핑몰에 오신 것을 환영합니다.</h1>");
		out.println("<h1><a href='/startservlet/cart/productlist.jsp'>상품리스트 조회</a></h1>");
		out.println("<h1><a href='/startservlet/cart/cartview.jsp'>장바구니 조회</a></h1>");
		out.println("<h1><a href='/startservlet/cart/cartremove.jsp'>상품 결제</a></h1>");
		out.println("<h1>오늘은 생필품을 세일하고 있습니다.</h1>");
	}

}
