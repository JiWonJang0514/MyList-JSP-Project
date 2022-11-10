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
import vo.MemberVO;

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
		request.setCharacterEncoding("UTF-8"); // 받아온 값 한글깨짐 방지 처리
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id, pwd;
		boolean result = false;
		
		id = request.getParameter("userId");
		pwd = request.getParameter("userPwd");
		
		MemberDao dao = new MemberDao();
		result = dao.getMemberPwd(id, pwd);
		
		if (result) {
			// 세션에 속성 값으로 설정할 정보
			MemberVO vo = dao.getMember(id);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginOK", vo);
			
			response.sendRedirect("/index.jsp");
		} else {
			out.println("<script> alert('회원정보가 맞지 않습니다.'); history.back(); </script>");
		}
	}
}
