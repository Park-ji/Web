package test;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet 4.0 사용중 => 3.0버전 이상 : 즉, 해당 Servlet을 url매핑할때 web.xml말고 @WebServlet으로 이용 가능
@WebServlet("/lifecycle")
public class LifeCycleServlet extends HttpServlet {
//run 버튼을 눌러서 최초 실행시? 
//init메소드, doGet 실행 --> 콘솔창에서 확인 가능 : 브라우져에 나타내는 코드 없음
//브라우져를 계속 새로고침해서 계속 요청시?
//doGet 계속 실행
	int cnt = 1;//서블릿을 요청한 수 = 클라이언트의 수
	//cf) 클라이언트 수가 다수일때 ? 첫번째 작업할때, 다른 작업도 효율적으로 처리하기 위해서 내부적으로 이미 멀티쓰레드로 구현되어있음
	public void init(ServletConfig config) throws ServletException {
		//사용자가 요청하기전에 실행됨 : init메소드 
		//ex, JDBC사용시 드라이버 로드해놓기 --> 즉, 시간이 많이 걸리는 작업은 init에서 미리 작업해놓기!
		System.out.println("init 메소드 수정 : 요청처리 이전 실행 세팅");
		//만약 브라우저에 쓰려면? response매개변수를 사용하면 된다? -> 하지만, doGet메서드만 있기 때문에 그냥 이렇게 쓰면 에러가 생성!
		//response.setContentYpe("text/html;charset=utf-8"); -> error! 
	}

	public void destroy() {
		//요청처리 마무리되고 서버 종료되기전 메모리 정리
		//case 1 : 계속 실행중이 Servlet의 코드를 수정하는 경우 -> 새로 컴파일을 해야하므로 이전의 서블릿 객체를 버려야함
		//case 2 : 현재 서블릿 소스를 포함하는 프로젝트가 자동으로 재시작 -> 프로젝트의 소스가 바뀌어도 이전 서블릿 객체 버림
		//case 3 : tomcat 서버 종료 -> 단, 이때는 destroy는 확인 x (이유 : tomcat 종료가 먼저 일어나기 때문에)
		System.out.println("destroy 메소드 실행 : 서블릿 메모리 제거직전");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메소드 실행 : 요청처리"+(cnt++)+"중");
	}

}
