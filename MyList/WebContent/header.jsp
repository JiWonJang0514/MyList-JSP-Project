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
	                    <img src="/images/게.png" alt="별자리 프로필 사진">
	                </div>
	                <div class="user-info">
	                    <span class="motto">그만 둘 이유보다 해야 할!</span>
	                    <span class="user-id"><%= vo.getUserId() %></span>
	                </div>
	            </div>
	        </header>