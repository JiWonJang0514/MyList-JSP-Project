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
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
    <div class="wrppaer">
        <h1>회원가입</h1>

        <form action="">
            <div>
                <label for="userId">아이디</label><br>
                <input type="text" name="userId" id="userId"><br>

                <label for="userPwd">비밀번호</label><br>
                <input type="text" name="userPwd" id="userPwd"><br>

                <label for="userBirth">생일</label><br>
                <input type="date" name="userBirth" id="userBirth"><br>
            </div>
            <div>
                <button type="submit" class="btn yellow">완료</button>
            </div>
        </form>
    </div>
</body>
</html>