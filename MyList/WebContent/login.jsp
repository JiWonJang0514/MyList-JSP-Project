<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/head.jsp" %>
    <!-- 스타일 링크 -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/register.css">
</head>
<body>
    <div class="wrapper">
        <h1>로그인</h1>

        <form action="/login" method="post">
            <div>
                <label for="userId">아이디</label><br>
                <input type="text" name="userId" id="userId"><br>

                <label for="userPwd">비밀번호</label><br>
                <input type="text" name="userPwd" id="userPwd"><br>
            </div>
            <div>
                <button type="submit" class="btn yellow">완료</button>
            </div>
        </form>

        <footer>
            <small>
                My List, your own shining todo list.<br>
                YYDH Software development 20604 Jiwon Jang
            </small>
        </footer>
    </div>
</body>
</html>