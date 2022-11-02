<%@page import="vo.MemberVO"%>
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
	if(vo == null) {
%>
	    <!-- 시작 화면 -->
	    <div id="start-background" class="wrppaer">
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
	} else {
%>
	    <!-- 로그인 후 메인 화면 -->
	    <div class="wrppaer">
	    	<header>
	            <nav>
	                <ul>
	                    <li><a href="#">로그아웃</a></li>
	                </ul>
	            </nav>
	
	            <div id="profile">
	                <div class="user-img">
	                    <img src="/images/게.png" alt="별자리 프로필 사진">
	                </div>
	                <div class="user-info">
	                    <span class="motto">그만 둘 이유보다 해야 할!</span>
	                    <span class="user-id">y_melody_03</span>
	                </div>
	            </div>
	        </header>
	        
	        <div class="container">
	            <h3>투두리스트<a id="add" href="">+</a></h3>
	            <ul class="todo-list">
	        <%
	        	
	        %>
	                <li>
	                    <div>한국사 인강 듣기</div>
	                    <div>
	                        <a href="">수정</a><span>|</span><a href="">삭제</a>
	                    </div>
	                </li>
	                <li>
	                    <div>한국사 인강 듣기</div>
	                    <div>
	                        <a href="">수정</a><span>|</span><a href="">삭제</a>
	                    </div>
	                </li>
	                <li>
	                    <div>한국사 인강 듣기</div>
	                    <div>
	                        <a href="">수정</a><span>|</span><a href="">삭제</a>
	                    </div>
	                </li>
	                <li>
	                    <div>한국사 인강 듣기</div>
	                    <div>
	                        <a href="">수정</a><span>|</span><a href="">삭제</a>
	                    </div>
	                </li>
	                <li>
	                    <div>한국사 인강 듣기</div>
	                    <div>
	                        <a href="">수정</a><span>|</span><a href="">삭제</a>
	                    </div>
	                </li>
	                <li>
	                    <div>한국사 인강 듣기</div>
	                    <div>
	                        <a href="">수정</a><span>|</span><a href="">삭제</a>
	                    </div>
	                </li>
	                <li>
	                    <div>한국사 인강 듣기</div>
	                    <div>
	                        <a href="">수정</a><span>|</span><a href="">삭제</a>
	                    </div>
	                </li>
	                <li>
	                    <div>한국사 인강 듣기</div>
	                    <div>
	                        <a href="">수정</a><span>|</span><a href="">삭제</a>
	                    </div>
	                </li>
	            </ul>
	        </div>
	        
	        <div class="container">
	            <h3>다른 계정</h3>
	            <ul class="others-list">
	                <li>
	                    <a href="">
	                        <div class="user-img">
	                            <img src="/images/물병.png" alt="별자리 프로필 사진">
	                        </div>
	                        <div class="user-info">
	                            <span>lovely_eune</span>
	                            <span>행복한 일은 매일 있어</span>
	                        </div>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="user-img">
	                            <img src="/images/물병.png" alt="별자리 프로필 사진">
	                        </div>
	                        <div class="user-info">
	                            <span>lovely_eune</span>
	                            <span>행복한 일은 매일 있어</span>
	                        </div>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="user-img">
	                            <img src="/images/물병.png" alt="별자리 프로필 사진">
	                        </div>
	                        <div class="user-info">
	                            <span>lovely_eune</span>
	                            <span>행복한 일은 매일 있어</span>
	                        </div>
	                    </a>
	                </li>
	                <li>
	                    <a href="">
	                        <div class="user-img">
	                            <img src="/images/물병.png" alt="별자리 프로필 사진">
	                        </div>
	                        <div class="user-info">
	                            <span>lovely_eune</span>
	                            <span>행복한 일은 매일 있어</span>
	                        </div>
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </div>
<%
	}
%>
</body>
</html>