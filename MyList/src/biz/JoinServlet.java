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

@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public JoinServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 받아온 값 한글깨짐 방지 처리
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
				
		String id, pwd, birth, isPublic;
		MemberDao dao = new MemberDao();
		int n = 0;
		
		id = request.getParameter("userId");
		pwd = request.getParameter("userPwd");
		birth = request.getParameter("userBirth");
		isPublic = request.getParameter("isPublic");
		
		n = dao.insertMember(id, pwd, birth, isPublic);
		
		if (n > 0) 
			response.sendRedirect("/index.jsp");
		else
			out.print("<script> history.back(); </script>");
	}

}
