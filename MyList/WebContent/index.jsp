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
	    </div>
<%
	}
%>
</body>
</html>