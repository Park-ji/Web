package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/mypagedb")
public class MyPageDBServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.요청 : id 요청 파라미터 입력(로그인 된 id)
		String id = request.getParameter("id");
		//2.처리 : id 컬럼이 kitri인 회원의 암호를 제외한 모든 컬럼 정보 조회 
		//: MemberDAO 클래스에 public MemberVO mypage(String id)를 만들기 - 리턴 타입 : MemberVO
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.mypage(id);
		
		//3.응답 : id, name, phone, email, indate를 브라우저에 응답 결과로 출력 
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out  = response.getWriter();
		out.println("<h1>"+vo.getId()+"님의 마이페이지</h1>");
		out.println("<h2>이름 : "+vo.getName()+"</h2><br>");
		out.println("<h2>전화번호 : "+vo.getPhone()+"</h2><br>");
		out.println("<h2>이메일 : "+vo.getEmail()+"</h2><br>");
		out.println("<h2>가입날짜 : "+vo.getIndate()+"</h2><br>");
		
	}

}
