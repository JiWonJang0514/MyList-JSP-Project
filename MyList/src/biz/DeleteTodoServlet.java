package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TodoDao;

@WebServlet("/delete")
public class DeleteTodoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteTodoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 받아온 값 한글깨짐 방지 처리
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		TodoDao dao = new TodoDao();
		
		String idx = request.getParameter("idx");
		int n = dao.deleteTodo(idx);
		
		if(n > 0)
			response.sendRedirect("/index.jsp");
		else
			out.println("<script> alert('할 일 삭제에 실패했습니다'); history.back(); <script>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
