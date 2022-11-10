<%@ include file="/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="css/form.css">
</head>
	<form action="/updateMotto" method="post">
		<div>
		 	<label for="userMotto">나만의 명언</label><br>
			<input type="text" name="userMotto" id="userMotto">
			
			<input type="hidden" name="userId" value="<%= vo.getUserId() %>">
		</div>
		<div>
			<button class="btn yellow">수정</button>
		</div>
	</form>
</body>
</html>