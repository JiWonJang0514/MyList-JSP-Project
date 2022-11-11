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
	MemberVO vo = (MemberVO)session.getAttribute("loginOK");

	if(vo == null) { // 시작화면
%>

	    <div id="before-login" class="wrapper">
	        <div id="title">
	            <h2>나를 더 빛내줄 투두리스트</h2>
	            <h1>마이 리스트</h1>
	        </div>
	        <div id="register">
	            <button class="btn yellow"><a href="/join.jsp">회원가입</a></button>
	            <button class="btn white"><a href="/login.jsp">로그인</a></button>
	        </div>
	    </div>
	    
<%
	} else { // 로그인 후 메인화면
%>

	    <div class="wrapper">
	        <header>
	            <nav>
	                <ul>
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
	                    <span class="motto">
	                    	<%= vo.getMotto() %>
	                    	<a href="/mottoUpdate.jsp?id=<%= vo.getUserId() %>">모토 수정</a>
	                    </span>
	                </div>
	            </div>
	        </header>
	        
	        <div id="todo-list" class="container">
	            <h3># 투두 리스트<a id="add" href="/insertTodo.jsp">+</a></h3>
	            <ul>
		            <%
				        // 기한 지난 할 일
				        TodoDao todoDao = new TodoDao();
			        	ArrayList<TodoVO> overTodoList = todoDao.getOverTodoList(vo.getUserId());
			 			for(int i=0; i < overTodoList.size(); i++) {
		        	%>
		                <li>
		                    <div class="over"><%= overTodoList.get(i).getTodo() %><%= overTodoList.get(i).getDeadline() %></div>
		                    <div>
		                        <a href="/updateTodo.jsp?idx=<%= overTodoList.get(i).getIdx() %>">수정</a><span>|</span><a href="/delete?idx=<%= overTodoList.get(i).getIdx() %>">삭제</a>
		                    </div>
		                </li>
	                <%
			 			}
			 			
				        // 기한 남은 할 일
			        	ArrayList<TodoVO> todoList = todoDao.getTodoList(vo.getUserId());
			 			for(int i=0; i < todoList.size(); i++) {
			        %>
		                <li>
		                    <div>한국사 인강 듣기</div>
		                    <div>
		                        <a href="/updateTodo.jsp?idx=<%= todoList.get(i).getIdx() %>">수정</a><span>|</span><a href="/delete?idx=<%= todoList.get(i).getIdx() %>">삭제</a>
		                    </div>
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
			        	if(vo.getIsPublic().equals("T")) { // 공개 계정
			        		MemberDao memberDao = new MemberDao();
			         		ArrayList<MemberVO> memberList = memberDao.getOthersList(vo.getUserId());
			 				for(int i=0; i < memberList.size(); i++) {
			        %>
		                <li>
		                    <a href="/myList.jsp?id=<%= memberList.get(i).getUserId() %>">
		                        <div class="user-img">
		                            <img src="images/<%= memberList.get(i).getUserBirth() %>.png" alt="별자리">
		                        </div>
		                        <div class="user-info">
		                            <span><%= memberList.get(i).getUserId() %></span>
		                            <span><small><%= memberList.get(i).getMotto() %></small></span>
		                        </div>
		                    </a>
		                </li>
	                <%
			        		}
			        	} else { // 비공계 개정
			        %>
			            	<small>비공개 계정입니다</small>
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
	    
<%
	}
%>
</body>
</html>