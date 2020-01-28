package mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.MemberDAO;
import vo.BoardVO;
import vo.MemberVO;

@WebServlet("*.mvc")
public class MVCServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청 분석
		String uri = request.getRequestURI();
		String[] uri_parse = uri.split("[/.]"); 
		for(int i=0;i<uri_parse.length;i++) {
			System.out.println(uri_parse[i]);
		} 
		String process = uri_parse[uri_parse.length-2];
		//2. 요청 처리(ex, DAO,VO 선정)
		if(process.contentEquals("boardlist")) {
			System.out.println("게시물 리스트를 요청받았습니다.");
			BoardDAO dao = new BoardDAO(); 
			ArrayList<BoardVO> list = dao.getBoardList(); 
			request.setAttribute("list", list); 
		}
		else if(process.contentEquals("loginform")){
			System.out.println("로그인폼 요청받았습니다.");
		}
		else if(process.contentEquals("loginresult")) {
			System.out.println("로그인처리를 요청받았습니다.");
			String id = request.getParameter("id");//아이디
			String pw = request.getParameter("pw");//비밀번호
			MemberDAO dao = new MemberDAO();
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setPw(pw);
			int result = dao.getMember(vo);//1(id,pw존재),2(id존재,pw불일치),3(존재 x)
			//result : Model -> jsp에서 사용할 수 있는 결과물(즉, request에 setAttribute한것도 seesion에 한것도 모두다 model)
			request.setAttribute("loginstatus", result);//정확히 말하면, 다음 문장이 '모델'
			if(result==1) {//정상적인 로그인 된 멤버일 경우에만 session에 입력해 놓기
				//MVCServlet에서 선언했기 때문에 모든 jsp에서 사용가능
				HttpSession session= request.getSession();
				session.setAttribute("sessionid", id);
			}
			//request.setAttribute("vo", vo);
		}
		else if(process.contentEquals("product")){
			System.out.println("쇼핑몰 요청받았습니다.");
		}
		else {
			process="none";
			System.out.println("잘못된 요청입니다.");
		}
		//3. 응답할 jsp 파일 선정
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mvc/"+process+".jsp");
		dispatcher.forward(request, response);		
	}
}


//위에 대한 설명
//
//
////url에 mvc확장자로 끝나는 파일이 오면 MVCServlet에서 동작하게 연결 : urlMapping
///*
// * url mapping
// * '/' --> 현재 컨텍스트 요청 : http://ip:port/startservlet
// * *.mvc --> 현재 컨텍스트에서 확장자가 mvc 종료 요청(한개의 Servlet이 여러개의 url를 받는 방법)
// */
//@WebServlet("*.mvc")
//public class MVCServlet extends HttpServlet {
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////		System.out.println(request.getRequestURI()); //서버부터의 경로
////		System.out.println(request.getRequestURL()); //http부터의 경로
////		System.out.println(request.getContextPath()); //context이름
//		
////		response.setContentType("text/html;charset=utf-8");
////		PrintWriter out  = response.getWriter();
////		out.println(request.getRequestURI()+"<br>");
////		out.println(request.getRequestURL()+"<br>");
////		out.println(request.getContextPath()+"<br>");
//		
//		//request.getRequestURI() : 예시, startservlet/boardlist.mvc
//		//1. /,.으로 자르기
//		String uri = request.getRequestURI();
//		String[] uri_parse = uri.split("[/.]"); //[]안에 선언하면 다양한 구분자 사용 가능
//		for(int i=0;i<uri_parse.length;i++) {
//			System.out.println(uri_parse[i]);//startservlet, boardlist, mvc
//		}
//		//uri_parse[uri_parse.length-2]; -> 맨끝에서 두번째 == 분석을 해낸 요청
//		String process = uri_parse[uri_parse.length-2];
//		if(process.contentEquals("boardlist")) {//요청 분석
//			System.out.println("게시물 리스트를 요청받았습니다.");
//			//분석에 따른 처리 : 처리 dao 선정
//			BoardDAO dao = new BoardDAO();
//			//처리 결과 : 모델 완성
//			ArrayList<BoardVO> list = dao.getBoardList(); //즉, list가 model이 되는 것
//			//해당 model에 대한 응답 view(응답 view 선정) : mvc/boardlist.jsp -> forward하기
//			//넘길때, model를 같이 넘겨야 하므로
//			request.setAttribute("list", list); //model를 view에 전달
////			RequestDispatcher dispatcher = request.getRequestDispatcher("/mvc/boardlist.jsp");// '/'로 시작? 컨텍스트명 생략
////			dispatcher.forward(request, response);
//		}
//		else if(process.contentEquals("loginform")){
//			System.out.println("로그인폼 요청받았습니다.");
//			//폼만 보여주고 시작하는 것이기 때문에 model를 만들어야되는 과정이 필요 x
//			//즉, mvc/loginform.jsp를 view만 하나 만들면 됨
////			RequestDispatcher dispatcher = request.getRequestDispatcher("/mvc/loginform.jsp");
////			dispatcher.forward(request, response);
//		}
//		else if(process.contentEquals("product")){
//			System.out.println("쇼핑몰 요청받았습니다.");
//			//쇼핑몰 첫페이지에 어떤것을 보여줄지에 따라 다름
//			//ex, 쇼핑리스트 ? ProductDAO : getProductList()호출
////			RequestDispatcher dispatcher = request.getRequestDispatcher("/mvc/product.jsp");
////			dispatcher.forward(request, response);
//		}
//		else {
//			process="none";
//			System.out.println("잘못된 요청입니다.");
//			//ex, none.jsp를 보여줌(즉, view만 보여주면 됨)
////			RequestDispatcher dispatcher = request.getRequestDispatcher("/mvc/none.jsp");
////			dispatcher.forward(request, response);
//		}
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/mvc/"+process+".jsp");// '/'로 시작? 컨텍스트명 생략
//		dispatcher.forward(request, response);
//		
//	}
//}
//






















