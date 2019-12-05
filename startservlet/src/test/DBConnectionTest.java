package test;

import java.sql.*;

public class DBConnectionTest {

	public static void main(String[] args){
		try {
		//1. jdbc driver 로드
		//위치 -> C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib 중 ojdbc6.jar 사용
		//이클립스에서는 외부 파일을 적용하는 것에는 다양한 방법이 있음 : 적재적소에 사용
		//1)해당 파일 : WEB-INF -> lib -> ojdbc6.jar 넣기
		//2)해당 파일 : C:\Program Files\Apache Software Foundation\Tomcat 9.0\lib 에 ojdbc6.jar 넣기
				//-> java resources -> libraries -> apache tomcat..라이브러리에 있음(단, 넣어놓고 재시작해야 보임)
		//3) 2)와 마찬가지로 JRE System Library에 추가하기
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//2. 오라클 db있는 주소 ip,port,이름(xe -> 설치시 지정된 이름), 계정, 암호) : DB연결 정보
		//jdbc를 어디에 연결할래 ? jdbc:oracle:thin -> 오라클에 연결할께~
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
		System.out.println("연결성공");
		String sql = "select id,pwd from member where userid=?";
		PreparedStatement pt = con.prepareStatement(sql); //sql하려고 준비함
		ResultSet rs = pt.executeQuery();//결과 받아오기
		while(rs.next()) {	// 조건 ? rs에 다음행이 있으면
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
			System.out.println(id+":"+pwd);
		}
		rs.close();
		pt.close();
		con.close();
		}
		catch(ClassNotFoundException e) { //다음 에러? 드라이버가 아직 설치되어있지 않을 때 발생
			System.out.println("드라이버설치오류");
		}catch(SQLException e) {//DB연결 정보가 잘못되었을 때 발생
			System.out.println("연결정보오류");
		}

	}

}
