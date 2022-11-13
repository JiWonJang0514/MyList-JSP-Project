<!-- 
프로그램 실행 방법

1. 톰캣서버 연결 후에 포트번호 8090, 모듈은 절대경로 /로 맞추기

2. 만약 서버 연결 후에 코드에 빨간 줄 있으면 이렇게 해보세요
         프로젝트 우클릭 -> Build Path -> Configure Build Path -> Libraries탭에서
     1) Add Library 버튼 누르고 Server Runtime 연결되어 있는지 확인해보기
     2) JRE System Library 클릭하고 Edit 버튼 눌러서 자바 라이브러리 버전 바꿔보기
	
3. 디비 생성 후에 WebContent/db.sql에서 '데이터 생성 쿼리들' 부분의 쿼리들을 전부 실행하기

4.  WebContent/index.jsp에서 F11 눌러서 실행하기
-->


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

	if(vo == null) { // 비로그인 상태 시작화면
%>

	    <div id="before-login" class="wrapper">
	        <div id="title">
	            <h2>나를 더 빛내줄 투두리스트</h2>
	            <h1>마이 리스트</h1>
	        </div>
	        <div id="register">
	            <a href="/join.jsp"><button id="join-btn" class="btn yellow">회원가입</button></a>
	            <a href="/login.jsp"><button id="login-btn" class="btn white">로그인</button></a>
	        </div>
	    </div>
	    
<%
	} else { // 로그인 후 메인화면
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
	        
	        <div id="todo-list" class="container">
	            <h3># 투두 리스트<a id="add" href="/insertTodo.jsp">+</a></h3>
	            <ul>
	                <%
	                	TodoDao todoDao = new TodoDao();
	                
				        // 기한 남은 할 일
			        	ArrayList<TodoVO> todoList = todoDao.getTodoList(vo.getUserId());
			 			for(int i=0; i < todoList.size(); i++) {
			        %>
			                <li>
			                    <div><%= todoList.get(i).getTodo() %></div>
			                    <div>
		                    		<div>
		                    			<%= todoList.get(i).getDeadline() %>&nbsp;까지
		                    		</div>
			                    	<div>
				                        <a href="/updateTodo.jsp?idx=<%= todoList.get(i).getIdx() %>">수정</a>
				                        <span>|</span>
				                        <a href="/delete?idx=<%= todoList.get(i).getIdx() %>">삭제</a>
				                    </div>
			                    </div>
			                </li>
		            <%
			 			}
			 			
				        // 기한 지난 할 일
			        	ArrayList<TodoVO> overTodoList = todoDao.getOverTodoList(vo.getUserId());
			 			for(int i=0; i < overTodoList.size(); i++) {
		        	%>
			                <li>
			                    <div class="over"><%= overTodoList.get(i).getTodo() %></div>
			                    <div>
		                    		<div>
		                    			<%= overTodoList.get(i).getDeadline() %>&nbsp;까지
		                    		</div>
			                    	<div>
				                        <a href="/updateTodo.jsp?idx=<%= overTodoList.get(i).getIdx() %>">수정</a>
				                        <span>|</span>
				                        <a href="/delete?idx=<%= overTodoList.get(i).getIdx() %>">삭제</a>
				                    </div>
			                    </div>
			                </li>
	                <%
			 			}
		            %>
	            </ul>
	        </div>
	            
	        <%
	        	if(vo.getIsPublic().equals("T")) { // 공개 계정
	        %>
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
					 		%>
			            </ul>
			        </div>
	        <%
	        	}
    		%>
	        
	
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