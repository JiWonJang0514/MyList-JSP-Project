<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.TodoDao"%>
<%@page import="vo.TodoVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/head.jsp" %>
    <!-- 스타일 링크 -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
<%
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	MemberVO vo = dao.getMember(id);
%>

	<div class="wrapper">
        <header>
            <nav>
                <ul>
                    <li><a href="/index.jsp">내 계정 돌아가기</a></li>
                    <li><a href="/logout">로그아웃</a></li>
                </ul>
            </nav>

            <div id="profile">
                <div class="user-img">
                    <img src="images/<%= vo.getUserBirth() %>.png" alt="별자리">
                </div>
                <div class="user-info">
                    <span class="user-id">
                    	<i class="fa fa-unlock-alt"></i>
                    	<%= vo.getUserId() %>
                    </span>
                    <span class="motto"><%= vo.getMotto() %></span>
                </div>
            </div>
        </header>
        
        <div id="todo-list" class="container">
            <h3># 투두 리스트</h3>
            <ul>
            	<%
			        // 지난 리스트
			        TodoDao todoDao = new TodoDao();
		        	ArrayList<TodoVO> overTodoList = todoDao.getOverTodoList(vo.getUserId());
		 			for(int i=0; i < overTodoList.size(); i++) {
		        %>
		                <li>
		                    <div class="over"><%= overTodoList.get(i).getTodo() %><%= overTodoList.get(i).getDeadline() %></div>
		                </li>
                <%
		 			}
		 			
			        // 기한 남은 리스트
		        	ArrayList<TodoVO> todoList = todoDao.getTodoList(vo.getUserId());
		 			for(int i=0; i < todoList.size(); i++) {
		        %>
		                <li>
		                    <div><%= todoList.get(i).getTodo() %><%= todoList.get(i).getDeadline() %></div>
		                </li>
                <%
	 				}
	           	%>	
            </ul>
        </div>
            
        <div id="others-list" class="container">
            <h3># 다른 사용자</h3>
            <ul>
	            <%
	         		MemberDao memberDao = new MemberDao();
	         		ArrayList<MemberVO> memberList = memberDao.getOthersList(vo.getUserId());
	 				for(int i=0; i < memberList.size(); i++) {
	         	%>
	                <li>
	                    <a href="/myList.jsp?id=<%= memberList.get(i).getUserId() %>">
	                        <div class="user-img">
	                            <img src="images/<%= memberList.get(i).getUserBirth() %>.png" alt="">
	                        </div>
	                        <div class="user-info">
	                            <span><%= memberList.get(i).getUserId() %></span>
	                            <span><%= memberList.get(i).getMotto() %></span>
	                        </div>
	                    </a>
	                </li>
	            <%
					}
	            %>
            </ul>
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