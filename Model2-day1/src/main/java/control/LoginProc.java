package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginProc.do")
public class LoginProc extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		reqPro(request, response);
	}
	
	public void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		request.setAttribute("id", id); // request 객체에 데이터를 저장
		request.setAttribute("pass", password); // request 객체에 데이터를 저장
		
		// request
		RequestDispatcher dis = request.getRequestDispatcher("LoginProc.jsp");
		dis.forward(request, response);
	}

}
