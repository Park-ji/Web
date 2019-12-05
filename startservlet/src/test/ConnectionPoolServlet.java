package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Connectionpool를 사용하지 않았을 때 -> 최대 허용치 넘으면 oracle 다운

@WebServlet("/connectionpool") //url 매핑 : 앞에 'http://ip:port/프로젝트명(startservlet)' 까지 생략되어 있음
public class ConnectionPoolServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			for (int i = 1; i <= 100; i++) { //Db에 연결을 100개 함
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "hr", "hr");
				System.out.println("연결성공" + i);
			}
			//error! : java.sql.SQLException: Listener refused the connection with the following error:
			//-> 오라클 접속을 못함 = 즉, 최대 허용치를 넘으면 기존의 접속도 막음
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


}
