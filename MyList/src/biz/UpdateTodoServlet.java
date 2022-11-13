package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TodoDao;

@WebServlet("/updateTodo")
public class UpdateTodoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateTodoServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 받아온 값 한글깨짐 방지 처리
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String idx, todo, deadline;
		int n;
		
		// 전달받은 값 변수에 할당
		idx = request.getParameter("idx");
		todo = request.getParameter("todo");
		deadline = request.getParameter("deadline");
		
		// 투두 dao 객체 생성
		TodoDao dao = new TodoDao();
		// 할 일 수정 메소드 호출
		n = dao.updateTodo(idx, todo, deadline);
		
		if(n > 0)
			response.sendRedirect("/index.jsp"); // 성공->인덱스로 이동
		else
			out.println("<script> alert('할 일 수정에 실패했습니다'); history.back(); <script>"); // 실패->알림창 띄우고 이전 화면으로 돌아가기
	}

}
