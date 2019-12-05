package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

import java.sql.*;


@WebServlet("/logindb")
public class LoginDBServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 사용자의 요청 파라미터 입력값 : id, pw -> form에서 넘어오고, get방식이므로 url뒤에 보임
		//2. 처리 
		//2-1 : member테이블에서 id컬럼 값이 요청 파라미터 id값과 동일할때, id와 pwd의 컬럼을 조회할 sql작성
		//2-2 : 실행결과 리턴
		//		여러개? 반복문, 1개? 반복문 쓸 필요 x
		//2-3 : password 컬럼값과 요청파라미터 pw값과 동일함
		//2-4 : password 컬럼값과 요청파라미터 pw값과 동일하지 않음
		//2-5 : 실행결과 db id가 없음
		//3. 응답
		//2-3 경우 응답 : xxxx(id)+"회원님은 정상 로그인되었습니다."
		//2-4 경우 응담(암호 오류) : xxxx(id)+"회원님 암호 오류입니다. 로그인 화면 이동" 
					//"<a href = 'logindb.html'> 로그인 화면 이동 </a>"
		//2-5 경우 응답 : "회원정보를 찾을 수 없습니다."
					//"<a href = 'insertdb.html'> 회원가입 화면 이동 </a>"
		
		
		String id = request.getParameter("id"); //요청 파라미터
		String pw = request.getParameter("pw");
		//String result="";

//1. DAO,VO 객체 사용
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		//int result = dao.getMember(id, pw);
		int result = dao.getMember(vo);
		String b_result = "";
		
		if(result == 1) {
			b_result = "<h3>회원님은 정상 로그인 되었습니다.<br><a href = 'mypagedb?id="+id+"'> 마이페이지 화면 이동 </a></h3>"; //서블릿 - get 방식
		}
		else if(result ==2) {

			b_result = "<h3>회원님 암호 오류입니다.<br><a href = 'logindb.html'> 로그인 화면 이동 </a></h3>";
		}
		else if(result==3) {
			b_result = "<h3>회원정보를 찾을 수 없습니다.<br><a href = 'insertdb.html'> 회원가입 화면</a>으로 이동하시겠습니까?</h3>";
		}
		
//2. DAO 객체 없으면?		
//		try {
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
//		String sql = "select id,pwd from member where id=?";
		//대소문자 구분시 -> upper함수 사용 : "select id,pwd from member where upper(id)=upper(?)"
		//sql문장에서 아직 정해지지 않은 값을 물음표(?)로 표시하는 바인딩 변수 사용
//		PreparedStatement pt = con.prepareStatement(sql); //sql하려고 준비함
//		pt.setString(1, id); //첫번째 물음표에 id값을 set
//		ResultSet rs = pt.executeQuery();//결과 받아오기
//		
//			if (rs.next()) { // id 존재
//				String db_id = rs.getString("id");
//				String db_pw = rs.getString("pwd");
//				System.out.println(db_id + ":" + db_pw);
//				if (pw.equals(db_pw))//2-3
//					result = "<h3>"+ id + "회원님은 정상 로그인 되었습니다.</h3>";
//				else//2-4
//					result ="<h3>"+ id + "회원님 암호 오류입니다.<br><a href = 'logindb.html'> 로그인 화면 이동 </a></h3>";
//			} else {//2-5
//				result = "<h3>회원정보를 찾을 수 없습니다.<br><a href = 'insertdb.html'> 회원가입 화면</a>으로 이동하시겠습니까?</h3>";
//			}
			
		
			/*
			 * if(rs.next()) { //결과가 존재한다면 if(rs.getString(2).equals(pw))
			 * out.println(id+"회원님은 정상 로그인 되었습니다."); //getString(2) : column '2'를 의미 else
			 * out.println(id+"회원님 암호 오류입니다.<br><a href = 'logindb.html'> 로그인 화면 이동 </a>");
			 * } else {
			 * out.println("회원정보를 찾을 수 없습니다.<br><a href = 'insertdb.html'> 회원가입 화면 이동 </a>"
			 * ); }
			 */
//		rs.close();
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
		out.println(b_result);
	}

}
