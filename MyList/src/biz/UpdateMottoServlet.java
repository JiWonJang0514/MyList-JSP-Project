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
		
		// 전달받은 정보 변수 할당
		motto = request.getParameter("userMotto");
		id = request.getParameter("userId");
		
		// 멤버 dao 객체 생성
		MemberDao dao = new MemberDao();
		// 나만의 명언 업데이트 메소드 호출
		n = dao.updateMotto(motto, id);
		
		if(n > 0) {
			// 성공->세션 정보를 로그인 한 사용자의 새로 바뀐 정보로 재설정하기
			
			HttpSession session = request.getSession();
			MemberVO vo = (MemberVO)session.getAttribute("loginOK");
			
			vo = dao.getMember(id); // 현재 로그인한 사용자 정보 다시 가져오기
			session.setAttribute("loginOK", vo); // 세션 정보 설정
			
			response.sendRedirect("/index.jsp");
			
		} else
			out.println("<script> alert('나만의 명언 수정에 실패했습니다'); history.back(); <script>"); // 실패->알림창 띄우고 이전 화면으로 돌아가기
	}

}
