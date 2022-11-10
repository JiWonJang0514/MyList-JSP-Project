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
import dao.TodoDao;
import vo.MemberVO;

@WebServlet("/updateMotto")
public class UpdateMottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMottoServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 받아온 값 한글깨짐 방지 처리
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String motto, id;
		int n;
		
		motto = request.getParameter("userMotto");
		id = request.getParameter("userId");
		
		MemberDao dao = new MemberDao();
		n = dao.updateMotto(motto, id);
		
		if(n > 0) {
			HttpSession session = request.getSession();
			MemberVO vo = (MemberVO)session.getAttribute("loginOK");
			
			vo = dao.getMember(id);
			session.setAttribute("loginOK", vo);
			
			response.sendRedirect("/index.jsp");
		} else
			out.println("<script> alert('나만의 명언 수정에 실패했습니다'); history.back(); <script>");
	}

}
