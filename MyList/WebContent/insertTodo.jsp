<%@ include file="/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="css/form.css">
</head>
    
        <form action="/insertTodo" method="post">
            <div>
                <label for="todo">할 일</label><br>
                <input type="text" name="todo" id="todo"><br>

                <label for="deadline">기한</label><br>
                <input type="date" name="deadline" id="deadline"><br>
                
                <input type="hidden" name="userid" value="<%= vo.getUserId() %>">
            </div>
            <div>
                <button type="submit" class="btn yellow">추가</button>
            </div>
        </form>
    </div>
</body>
</html>