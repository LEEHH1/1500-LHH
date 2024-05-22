package ex_01;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


//@WebServlet : 인자로 전달된 값을 주소로 요청하면 톰캣이 찾아서 서블릿을 실행한다.
@WebServlet("/hello")

public class HellowServlet extends HttpServlet{
	
	@Override
	public void init() throws ServletException {
		// 서블릿이 초기화 될 때 호출되는 메서드
		// 1. 서블릿의 초기화 역할
		System.out.println("[HelloServlet] init() is called");
	}
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 입력
		System.out.println("[HelloServlet] service() is called");
		// 2. 처리
		int total = 0;
		for(int i = 1; i<101; i++) {
			total +=i;
		}
		// 3. 출력
		response.setContentType("text/html; charset=utf-8");
		// PrintWriter
		// int,float,double,String 또는 Object와 같은 모든형태의
		// 데이터를 콘솔이나 java 파일에 텍스트 형식으로 쓰는데
		// 사용되는 클래스
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.printf("1부터 100까지 합은 : %d", total);
		out.println("<body>");
		out.println("<html>");

		
	}
	@Override
	public void destroy() {
		// 서블릿이 메모리에서 제거될 때 서블릿 컨테이너에 의해 자동 호출
		System.out.println("[HelloServlet] destroy() is called");
	}
}






















