package forward;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forwardlogin")
public class LoginServlet extends HttpServlet {
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request,response);
//	}//이렇게 사용하면 get방식으로 요청한 것을 post방식으로 실행할수 있지만 이렇게 안씀
	//get 방식이 아닌 post방식일때는 login.jsp먼저 실행해야함
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String path = "";
		String[] menu = null;

		if(id==null) {
			path = "/forward/login.jsp";	
		}
		//id.equalsIgnoreCase : 대소문자 상관 x
		else if(id.equalsIgnoreCase("admin")){
			path = "/forward/admin.jsp";
			menu = new String[2];
			menu[0] = "모든회원조회";
			menu[1] = "회원강제탈퇴";
		}
		else {
			path = "/forward/user.jsp";
			menu = new String[4];
			menu[0] = "자기정보조회";
			menu[1] = "장바구니";
			menu[2] = "자기정보수정";
			menu[3] = "다른회원조건검색";				
		}
		request.setAttribute("menu", menu);
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request,response);
		
	}

}
