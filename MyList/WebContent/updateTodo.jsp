<%@page import="vo.TodoVO"%>
<%@page import="dao.TodoDao"%>
<%@ include file="/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="css/form.css">
</head>
    <%
    	String idx = request.getParameter("idx");
    
    	// dao 셀렉트...
    	TodoDao dao = new TodoDao();
    	TodoVO todo = dao.getTodo(idx);
    %>
        <form action="/updateTodo" method="post" accept-charset="UTF-8">
            <div>
                <label for="todo">할 일</label><br>
                <input type="text" name="todo" id="todo" value="<%= todo.getTodo() %>"><br>

                <label for="deadline">기한</label><br>
                <input type="date" name="deadline" id="deadline" value="<%= todo.getDeadline() %>"><br>
                
                <input type="hidden" name="idx" value="<%= idx %>">
            </div>
            <div>
                <button type="submit" class="btn yellow">수정</button>
            </div>
        </form>
    </div>
</body>
</html>