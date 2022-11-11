<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.TodoDao"%>
<%@page import="vo.TodoVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/head.jsp" %>
    <!-- ì¤íì¼ ë§í¬ -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
	MemberVO vo = (MemberVO)session.getAttribute("loginOK");

	if(vo == null) { // ììíë©´
%>

	    <div id="before-login" class="wrapper">
	        <div id="title">
	            <h2>ëë¥¼ ë ë¹ë´ì¤ í¬ëë¦¬ì¤í¸</h2>
	            <h1>ë§ì´ ë¦¬ì¤í¸</h1>
	        </div>
	        <div id="register">
	            <button class="btn yellow"><a href="#">íìê°ì</a></button>
	            <button class="btn white"><a href="#">ë¡ê·¸ì¸</a></button>
	        </div>
	    </div>
	    
<%
	} else { // ë¡ê·¸ì¸ í ë©ì¸íë©´
%>

	    <div class="wrapper">
	    	<header>
	            <nav>
	                <ul>
	                    <li><a href="/logout">ë¡ê·¸ìì</a></li>
	                </ul>
	            </nav>
	
	            <div id="profile">
	                <div class="user-img">
	                    <img src="/images/<%= vo.getUserBirth() %>.png" alt="ë³ìë¦¬ íë¡í ì¬ì§">
	                </div>
	                <div class="user-info">
	                    <span class="motto"><%= vo.getMotto() %></span>
	                    <span class="user-id"><%= vo.getUserId() %></span>
	                    <a href="/mottoUpdate.jsp?id=<%= vo.getUserId() %>">ìì </a>
	                </div>
	            </div>
	        </header>
	        
	        <div class="container">
	            <h3>í¬ëë¦¬ì¤í¸<a id="add" href="/insertTodo.jsp">+</a></h3>
	            <ul class="todo-list">
           <%
		        // ì§ë ë¦¬ì¤í¸
		        TodoDao todoDao = new TodoDao();
	        	ArrayList<TodoVO> overTodoList = todoDao.getOverTodoList(vo.getUserId());
	 			for(int i=0; i < overTodoList.size(); i++) {
	        %>
	                <li>
	                    <div class="over"><%= overTodoList.get(i).getTodo() %><%= overTodoList.get(i).getDeadline() %></div>
	                    <div>
	                        <a href="/updateTodo.jsp?idx=<%= overTodoList.get(i).getIdx() %>">ìì </a><span>|</span><a href="/delete?idx=<%= overTodoList.get(i).getIdx() %>">ì­ì </a>
	                    </div>
	                </li>
            <%
	 			}
	 			
		        // ê¸°í ë¨ì ë¦¬ì¤í¸
	        	ArrayList<TodoVO> todoList = todoDao.getTodoList(vo.getUserId());
	 			for(int i=0; i < todoList.size(); i++) {
	        %>
	                <li>
	                    <div><%= todoList.get(i).getTodo() %><%= todoList.get(i).getDeadline() %></div>
	                    <div>
	                        <a href="/updateTodo.jsp?idx=<%= todoList.get(i).getIdx() %>">ìì </a><span>|</span><a href="/delete?idx=<%= todoList.get(i).getIdx() %>">ì­ì </a>
	                    </div>
	                </li>
            <%
	 			}
            %>
	            </ul>
	        </div>
	        
	        <div class="container">
        <%
        	if(vo.getIsPublic().equals("T")) { // ê³µê°
        %>
	            <h3>ë¤ë¥¸ ê³ì </h3>
	            <ul class="others-list">
         	<%
         		MemberDao memberDao = new MemberDao();
         		ArrayList<MemberVO> memberList = memberDao.getOthersList(vo.getUserId());
 				for(int i=0; i < memberList.size(); i++) {
         	%>
	                <li>
	                    <a href="/myList.jsp?id=<%= memberList.get(i).getUserId() %>">
	                        <div class="user-img">
	                            <img src="/images/<%= memberList.get(i).getUserBirth() %>.png" alt="ë³ìë¦¬ íë¡í ì¬ì§">
	                        </div>
	                        <div class="user-info">
	                            <span><%= memberList.get(i).getUserId() %></span>
	                            <span>íë³µí ì¼ì ë§¤ì¼ ìì´</span>
	                        </div>
	                    </a>
	                </li>
            <%
 				}
            %>
	            </ul>
        <%
        	} else { // ë¹ê³µê°
        %>
        	<h3>ë¹ê³µê° ê³ì </h3>
	            <ul class="others-list">
	            	ë¤ë¥¸ ì¬ì©ìì ê³µì íì§ ìë ëë§ì ê³µê°ìëë¤
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