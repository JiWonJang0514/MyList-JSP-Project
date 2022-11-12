<%@page import="vo.MemberVO"%>
<%@page import="dao.TodoDao"%>
<%@page import="vo.TodoVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/head.jsp" %>
    <!-- 스타일 링크 -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/form.css">
</head>
<body>
<%
	MemberVO vo = (MemberVO)session.getAttribute("loginOK");

	String idx = request.getParameter("idx");
	TodoDao dao = new TodoDao();
	TodoVO todo = dao.getTodo(idx);
%>

    <div class="wrapper">
    	<header>
	        <nav>
	            <ul>
	            	<li><a href="/mottoUpdate.jsp?id=<%= vo.getUserId() %>">명언 수정</a></li>
	                <li><a href="/logout">로그아웃</a></li>
	            </ul>
	        </nav>
	
	        <div id="profile">
	            <div class="user-img">
	                <img src="images/<%= vo.getUserBirth() %>.png" alt="별자리">
	            </div>
	            <div class="user-info">
	                <span class="user-id">
	                	<% if(vo.getIsPublic().equals("T")) { // 공개 계정 아이콘 %>
	                		<i class="fa fa-unlock-alt"></i>
	                	<% } else { // 비공개 계정 아이콘 %>
	                		<i class="fa fa-lock"></i>
	                	<% } %>
	               		<%= vo.getUserId() %>
	                </span>
	                <span class="motto"><%= vo.getMotto() %></span>
	            </div>
	        </div>
	    </header>
	    
        <div>
            <h1>할 일 수정</h1>

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

        <footer>
            <small>
                My List, your own shining todo list.<br>
                YYDH Software development 20604 Jiwon Jang
            </small>
        </footer>
    </div>
</body>
</html>