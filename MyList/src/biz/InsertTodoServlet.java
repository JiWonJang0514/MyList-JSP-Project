package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TodoDao;

@WebServlet("/insertTodo")
public class InsertTodoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertTodoServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 받아온 값 한글깨짐 방지 처리
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String todo, deadline, userid;
		int n;
		
		// 전달받은 파라미터 변수 할당
		todo = request.getParameter("todo");
		deadline = request.getParameter("deadline");
		userid = request.getParameter("userid");
		
		// 투두 dao 객체 생성
		TodoDao dao = new TodoDao();
		// 인서트 메소드 호출
		n = dao.insertTodo(todo, deadline, userid);
		
		if(n > 0)
			response.sendRedirect("/index.jsp"); // 성공->인덱스로 이동
		else
			out.println("<script> alert('할 일 추가에 실패했습니다'); history.back(); <script>"); // 실패->이전 화면으로 돌아가기
	}

}
