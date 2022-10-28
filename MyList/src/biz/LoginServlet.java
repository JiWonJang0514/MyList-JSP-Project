package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

@WebServlet("/login")
// 자바 클래스에 HttptServlet 확장
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String id, pwd;
		boolean result = false;
		PrintWriter out = response.getWriter();
		
		id = request.getParameter("userId");
		pwd = request.getParameter("userPwd");
		
		MemberDao dao = new MemberDao();
		result = dao.getMemberPwd(id, pwd);
		
		if (result) {
			HttpSession session = request.getSession();
			session.setAttribute("loginOK", id);
			response.sendRedirect("/index.jsp");
		} else {
			out.println("<script> alert('회원정보가 맞지 않습니다.'); history.back(); </script>");
		}
	}
}
