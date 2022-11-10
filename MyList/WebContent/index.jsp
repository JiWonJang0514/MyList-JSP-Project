<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.TodoDao"%>
<%@page import="vo.TodoVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 폰트 링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <!-- 스타일 링크 -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
	MemberVO vo = (MemberVO)session.getAttribute("loginOK");

	if(vo == null) { // 시작화면
%>

	    <div id="start-background" class="wrapper">
	        <div id="title">
	            <h2>나를 더 빛내줄 투두리스트</h2>
	            <h1>마이 리스트</h1>
	        </div>
	        <div id="register">
	            <a href="/join.jsp"><button class="btn yellow">회원가입</button></a>
	            <a href="/login.jsp"><button class="btn white">로그인</button></a>
	        </div>
	    </div>
	    
<%
	} else { // 로그인 후 메인화면
%>

	    <div class="wrapper">
	    	<header>
	    	
	    	
	    	
	    	<%= vo.getUserId() %>
	    	<%= vo.getUserPwd() %>
	    	<%= vo.getUserBirth() %>
	    	<%= vo.getIsPublic() %>
	    	
	    	
	    	
	    	
	            <nav>
	                <ul>
	                    <li><a href="/logout">로그아웃</a></li>
	                </ul>
	            </nav>
	
	            <div id="profile">
	                <div class="user-img">
	                    <img src="/images/<%= vo.getUserBirth() %>.png" alt="별자리 프로필 사진">
	                </div>
	                <div class="user-info">
	                    <span class="motto">그만 둘 이유보다 해야 할!</span>
	                    <span class="user-id"><%= vo.getUserId() %></span>
	                </div>
	            </div>
	        </header>
	        
	        <div class="container">
	            <h3>투두리스트<a id="add" href="/insertTodo.jsp">+</a></h3>
	            <ul class="todo-list">
           <%
		        // 지난 리스트
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
	 			
		        // 기한 남은 리스트
	        	ArrayList<TodoVO> todoList = todoDao.getTodoList(vo.getUserId());
	 			for(int i=0; i < todoList.size(); i++) {
	        %>
	                <li>
	                    <div><%= todoList.get(i).getTodo() %><%= todoList.get(i).getDeadline() %></div>
	                    <div>
	                        <a href="/updateTodo.jsp?idx=<%= todoList.get(i).getIdx() %>">수정</a><span>|</span><a href="/delete?idx=<%= todoList.get(i).getIdx() %>">삭제</a>
	                    </div>
	                </li>
            <%
	 			}
            %>
	            </ul>
	        </div>
	        
	        <div class="container">
        <%
        	if(vo.getIsPublic().equals("T")) { // 공개
        %>
	            <h3>다른 계정</h3>
	            <ul class="others-list">
         	<%
         		MemberDao memberDao = new MemberDao();
         		ArrayList<MemberVO> memberList = memberDao.getOthersList(vo.getUserId());
 				for(int i=0; i < memberList.size(); i++) {
         	%>
	                <li>
	                    <a href="/myList.jsp?id=<%= memberList.get(i).getUserId() %>">
	                        <div class="user-img">
	                            <img src="/images/<%= memberList.get(i).getUserBirth() %>.png" alt="별자리 프로필 사진">
	                        </div>
	                        <div class="user-info">
	                            <span><%= memberList.get(i).getUserId() %></span>
	                            <span>행복한 일은 매일 있어</span>
	                        </div>
	                    </a>
	                </li>
            <%
 				}
            %>
	            </ul>
        <%
        	} else { // 비공개
        %>
        	<h3>비공개 계정</h3>
	            <ul class="others-list">
	            	다른 사용자와 공유하지 않는 나만의 공간입니다
	           	</ul>
        <%
	        }
        %>
	        </div>
	    </div>
	    
<%
	}
%>
</body>
</html>