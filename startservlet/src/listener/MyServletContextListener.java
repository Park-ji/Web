package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

//annotation종류
//1. @WebServlet()
//2. @WebFilter()
//3. @WebListener : url매핑이 x(특정한 파일이 실행될때 실행되는 것이 아니기 때문에)

@WebListener
public class MyServletContextListener implements ServletContextListener {
	
	//컨텍스트 종료시 자동실행 = tomcat 종료시 또는 서블릿 소스 수정시
    public void contextDestroyed(ServletContextEvent sce)  { 
         System.out.println("====현재 컨텍스트 종료합니다.====");
    }

    //컨텍스트 시작시 자동실행 = tomcat 시작시 또는 서블릿 소스 수정시
    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("====현재 컨텍스트 시작합니다.====");
    	//Context? 한개의 서블릿,jsp가 모여있는 폴더
    	//즉, 컨텍스트 내부 여러 파일 정보가 공유될수 있어야함(방법 : request, session, application)
    	
    	//정보공유해놓음 cf)객체넣어도 ok
    	//application이므로 컨텍스트 안에 있는 모든 파일 사용 가능
    	ServletContext application = sce.getServletContext();
    	application.setAttribute("개발자", "홍길동");
    	application.setAttribute("location", "키트리4층5강의장");
    	application.setAttribute("time", "2019-12-16");
    	//Servlet에서는 request.getServletContext()로 받기 : ListenerTestServelt.java
    	//jsp에서는 jstl표현 등 다양(ex, ${applicationScope.. 또는 ${개발자}) : listener.jsp
    	
    	//cf) jdbc driver 등과 같은 정보를 미리 해놓으면 좋음
    }
	
}
