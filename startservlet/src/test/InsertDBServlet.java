package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/insertdb")
public class InsertDBServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 요청 : id, pw, name, phone, email -> get 방식
		//member 테이블의 컬럼값들의 타입 확인할것
		String id = request.getParameter("id"); //요청 파라미터
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		//String result="";
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO(id,pw,name,phone,email);
//		MemberVO vo = new MemberVO();
//		vo.setId(id);
//		vo.setPw(pw);
//		vo.setName(name);
//		vo.setPhone(phone);
//		vo.setEmail(email);
		int result = dao.insertMember(vo);

		
//		try {
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
//		String sql = "insert into member values(?,?,?,?,?,sysdate)";
//		PreparedStatement pt = con.prepareStatement(sql); //sql하려고 준비함
//		pt.setString(1, id); //첫번째 물음표에 id값을 set
//		pt.setString(2, pw);
//		pt.setString(3, name);
//		pt.setString(4, phone);
//		pt.setString(5, email);
//		//ResultSet rs = pt.executeQuery();//결과 받아오기 -> select는 executeQuery()
//		int recordcnt = pt.executeUpdate();//insert, delete, update 는 executeUpdate() -> 행개수
//		//cf) insert into member select * from emp; : 여러가지 행 개수 반환
//		if(recordcnt==1) {
//			result = "<h3> 정상적으로 회원가입되셨습니다.<a href = 'logindb.html'> 로그인 화면 이동 </a> </h3>";
//		}
//		
//		pt.close();
//		con.close();
//		}catch(ClassNotFoundException e) { //다음 에러? 드라이버가 아직 설치되어있지 않을 때 발생
//			System.out.println("드라이버설치오류");
//		}catch(SQLException e) {//DB연결 정보가 잘못되었을 때 발생
//			System.out.println("연결정보오류");
//		}
//		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out  = response.getWriter();
		
		if(result==1)
			out.println("<h3> 정상적으로 회원가입되셨습니다.<a href = 'logindb.html'> 로그인 화면 이동 </a> </h3>");
	}

}
