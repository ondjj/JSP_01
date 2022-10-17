package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloWorld")
public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			reqPro(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			reqPro(request, response);
	}

	// 일괄 처리 -- doget/dopost 둘 다 reqPro를 통해 처리 되도록 해줌
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//화면에 HelloWorld라고 출력을 하고싶다면? -- jsp 쪽으로 넘겨질 데이터 설정
		String msg = "Hello World~ 안녕하세요!";
		Integer data = 12;
		
		// jsp쪽으로 데이터를 request에 부착하여 넘겨줌
		request.setAttribute("msg", msg);
		request.setAttribute("data", data);
		
		
		// 서블릿에서 jsp를 호출하면서 데이터를 같이 넘겨주는 객체 선언
		RequestDispatcher rd = request.getRequestDispatcher("HelloWorld.jsp"); // jsp 파일 명 기술 
		rd.forward(request, response);
		
	}
}
