package filtertest;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//Filter? : 동작을 하려면 Servlet이 있어야함
//a 서블릿 요청시, 필터가 정의되어 있으면 ? a 서블릿 실행 이전에 필터 먼저 실행됨
//서블릿 실행 후, 응답주기전에 필터가 먼저 한번더 실행됨
//즉, 서블릿 요청 -> 필터 실행(1) -> 서블릿 요청 처리 -> 서블릿 실행 -> 필터 실행(2) -> 요청

//@WebFilter("/encoding") // '/encoding'이라는 url를 가지고 있는 Servlet보다 먼저 실행할 것이라는 의미

@WebFilter("/*") //url과 상관없이 현재 context에 있는 모든 파일에 적용

//즉, 여러개 서블릿 공통 실행 문장들을 선언해놓으면 좋음
//ex, ip/method/uri 정보/현재시각 출력 -> 로그에 기록해놓기 때문에 좋음

public class EncodingFilter implements Filter { //Filter라는 interface를 상속받고 있음
	public void doFilter
	(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");//요청시 : (1)에 실행
		response.setContentType("text/html;charset=utf-8");//응답시 : (2)에 실행
		
		chain.doFilter(request, response);//앞으로 인코딩 필터말고 다른 필터를 정의할때? 다른 필터에 체인처럼 넘긴다는 의미
	}

}
