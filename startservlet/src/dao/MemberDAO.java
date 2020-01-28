package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.MemberVO;

//MemberDAO 사용?
//원하는 파일에서
//M= new MemberDAO();
//M.getMember("a","b");
//와 같이 사용

public class MemberDAO {//Data Access Object
	//다음 메소드들을 별도의 Servlet으로 만들지 말고 모두가 사용할 수 있게 작성
	//웹 환경이든 어디든 상관없이 member 테이블에 관련된 작업을 할때 재사용 가능
//로그인 메소드
	//**ConnectionPool 사용방법? ConnectionPoolServlet2 참고
	// 전역으로 선언한 다음 각각의 메서드 안에 connection만 연결해줌

	public int inMember(MemberVO vo) { //boardwrite할때 BoardDAO.insert..함수에서 
		int result  = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
			String sql = "select id from member where id=?";
			//대소문자 구분시 -> upper함수 사용 : "select id,pwd from member where upper(id)=upper(?)"
			//sql문장에서 아직 정해지지 않은 값을 물음표(?)로 표시하는 바인딩 변수 사용
			PreparedStatement pt = con.prepareStatement(sql); //sql하려고 준비함
			pt.setString(1, vo.getId()); //첫번째 물음표에 id값을 set
			ResultSet rs = pt.executeQuery();//결과 받아오기

			if (rs.next()) { // id 존재
				result = 1;
			}
			rs.close();
			pt.close();
			con.close();
			}catch(Exception e) { 
				e.printStackTrace();
			}
		return result; 
	
	}
	
	public int getMember(MemberVO vo) {
		int result  = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
			String sql = "select id,pwd from member where id=?";
			//대소문자 구분시 -> upper함수 사용 : "select id,pwd from member where upper(id)=upper(?)"
			//sql문장에서 아직 정해지지 않은 값을 물음표(?)로 표시하는 바인딩 변수 사용
			PreparedStatement pt = con.prepareStatement(sql); //sql하려고 준비함
			pt.setString(1, vo.getId()); //첫번째 물음표에 id값을 set
			ResultSet rs = pt.executeQuery();//결과 받아오기

			if (rs.next()) { // id 존재
				String db_id = rs.getString("id");
				String db_pw = rs.getString("pwd");
				System.out.println(db_id + ":" + db_pw);
				if (vo.getPw().equals(db_pw))//2-3
					result = 1; //id 존재, 암호 동일
				else//2-4
					result = 2; //id 존재, 암호 불일치
			} else {//2-5
				result = 3; //id 존재 x
			}
			
			rs.close();
			pt.close();
			con.close();
			}catch(ClassNotFoundException e) { //다음 에러? 드라이버가 아직 설치되어있지 않을 때 발생
				System.out.println("드라이버설치오류");
			}catch(SQLException e) {//DB연결 정보가 잘못되었을 때 발생
				System.out.println("연결정보오류");
			}
		return result; // 0? 실행 중 오류 + 1,2,3
	}//getMember end
//회원가입 메소드
//	public int insertMember(String id, String password, String name, String phone, String email) {
//		
//	}
//위와 같이 매개변수가 많으면? 어려워 보이기 때문에 다음과 같이 작성 : MemberVO 사용
public int insertMember(MemberVO vo) { //5개 정보 모두 저장 되어있음
	int recordcnt = 0;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
		String sql = "insert into member values(?,?,?,?,?,sysdate)";
		PreparedStatement pt = con.prepareStatement(sql); //sql하려고 준비함
		pt.setString(1, vo.getId()); //첫번째 물음표에 id값을 set
		pt.setString(2, vo.getPw());
		pt.setString(3, vo.getName());
		pt.setString(4, vo.getPhone());
		pt.setString(5, vo.getEmail());
		//ResultSet rs = pt.executeQuery();//결과 받아오기 -> select는 executeQuery()
		recordcnt = pt.executeUpdate();//insert, delete, update 는 executeUpdate() -> 행개수
		//cf) insert into member select * from emp; : 여러가지 행 개수 반환
		pt.close();
		con.close();
		}catch(ClassNotFoundException e) { //다음 에러? 드라이버가 아직 설치되어있지 않을 때 발생
			System.out.println("드라이버설치오류");
		}catch(SQLException e) {//DB연결 정보가 잘못되었을 때 발생
			System.out.println("연결정보오류");
		}
	return recordcnt;
	}//insertMember end

	public MemberVO mypage(String id) {
		MemberVO result = null;
		
		try {
			//ConnectionPool을 이용해서 사용하면, db연결할때 매번 아래와 같이 드라이버이름과 url를 선언할 필요가 x
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
			String sql = "select * from member where id=?";
			//대소문자 구분시 -> upper함수 사용 : "select id,pwd from member where upper(id)=upper(?)"
			//sql문장에서 아직 정해지지 않은 값을 물음표(?)로 표시하는 바인딩 변수 사용
			PreparedStatement pt = con.prepareStatement(sql); //sql하려고 준비함
			pt.setString(1, id); //첫번째 물음표에 id값을 set
			ResultSet rs = pt.executeQuery();//결과 받아오기

			if (rs.next()) { // id 존재
				result = new MemberVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			}	
			
			rs.close();
			pt.close();
			con.close();
			}catch(ClassNotFoundException e) { //다음 에러? 드라이버가 아직 설치되어있지 않을 때 발생
				System.out.println("드라이버설치오류");
			}catch(SQLException e) {//DB연결 정보가 잘못되었을 때 발생
				System.out.println("연결정보오류");
			}
		return result;
		
	}//mypage end

}
