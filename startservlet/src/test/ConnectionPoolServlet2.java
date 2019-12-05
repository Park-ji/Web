package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


//Connectionpool를 사용하는 방법

@WebServlet("/connectionpool2") //url 매핑 : 앞에 'http://ip:port/프로젝트명(startservlet)' 까지 생략되어 있음
public class ConnectionPoolServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		//1. Context : 현재 서블릿 실행 주변환경 = tomcat의 context.xml에 파일 정의
		//즉, Context는 context.xml를 의미
		//--> tomcat한테 너의 정보를 줘
		Context initContext = new InitialContext(); //initContext가 'tomcat'이라고 생각하면 됨
		//2. context.xml 파일의 정의 내용 읽어오기
		Context envContext = (Context)initContext.lookup("java:/comp/env"); //environment : 즉, 톰캣한테 파일 환경을 lookup(찾아라)
		//3. jdbc/myoracle 이름의 값 읽어오기
		DataSource conpool = (DataSource)envContext.lookup("jdbc/myoracle"); //자바 환경들 중에서 Resource태그의 name으로 저장된 환경변수를 가져와라 -> 이때, 우리가 정의한 파일의 타입은 : DataSource
		
		for(int i=1;i<=100;i++) {
		Connection con = conpool.getConnection(); //마지막에 만들어진 conool에서 connection을 가져옴(=빌려옴)
		System.out.println("연결성공"+i); //반납안하면 일단 8개 까지 할수있음 (이유? context.xml에 총 최대 8개 만들어주라고 했기 때문에)
		con.close(); //해당 connection을 사용 다하면 conpool에 반납하자
		}
		}catch(Exception e) {
			e.getStackTrace();
		}
	}

}
