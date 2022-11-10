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
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	MemberVO vo = dao.getMember(id);
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
                    <img src="/images/<%= vo.getUserBirth() %>.png" alt="별자리 프로필 사진">
                </div>
                <div class="user-info">
                    <span class="motto"><%= vo.getMotto() %></span>
                    <span class="user-id"><%= vo.getUserId() %></span>
                </div>
            </div>
        </header>
        
        <div class="container">
            <h3>투두리스트</h3>
            <ul class="todo-list">
          <%
	        // 지난 리스트
	        TodoDao todoDao = new TodoDao();
        	ArrayList<TodoVO> overTodoList = todoDao.getOverTodoList(vo.getUserId());
 			for(int i=0; i < overTodoList.size(); i++) {
        %>
                <li>
                    <div class="over"><%= overTodoList.get(i).getTodo() %><%= overTodoList.get(i).getDeadline() %></div>
                    <!-- <div></div> -->
                </li>
           <%
 			}
 			
	        // 기한 남은 리스트
        	ArrayList<TodoVO> todoList = todoDao.getTodoList(vo.getUserId());
 			for(int i=0; i < todoList.size(); i++) {
        %>
                <li>
                    <div><%= todoList.get(i).getTodo() %><%= todoList.get(i).getDeadline() %></div>
                    <!-- <div></div> -->
                </li>
           <%
 			}
           %>
            </ul>
        </div>
        
        <div class="container">
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
        </div>
        
        <div id="back">
        	<a href="/index.jsp">내 마이리스트 돌아가기</a>
        </div>
    </div>
</body>
</html>