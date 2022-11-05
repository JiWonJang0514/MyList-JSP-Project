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
    <div class="wrapper">
        <h1>회원가입</h1>

        <form action="/join" method="post">
            <div>
                <label for="userId">아이디</label><br>
                <input type="text" name="userId" id="userId"><br>

                <label for="userPwd">비밀번호</label><br>
                <input type="text" name="userPwd" id="userPwd"><br>

                <label for="userBirth">생일을 선택해주세요</label><br>
                <input type="date" name="userBirth" id="userBirth">
                <!-- <select name="starType" id="starType">
                	<option value="양자리"><span>양자리</span><span>03월 21일 ~ 04월 19일</span></option>
                	<option value="황소자리"><span>황소자리</span><span>04월 20일 ~ 05월 20일</span></option>
                	<option value="쌍둥이자리"><span>쌍둥이자리</span><span>05월 21일 ~ 06월 21일</span></option>
                	<option value="게자리"><span>게자리</span><span>06월 22일 ~ 07월 22일</span></option>
                	
                	<option value="사자자리"><span>사자자리</span><span>07월 23일 ~ 08월 22일</span></option>
                	<option value="처녀자리"><span>처녀자리</span><span>08월 23일 ~ 09월 23일</span></option>
                	<option value="천칭자리"><span>천칭자리</span><span>09월 24일 ~ 10월 22일</span></option>
                	<option value="전갈자리"><span>전갈자리</span><span>10월 23일 ~ 11월 22일</span></option>
                	
                	<option value="사수자리"><span>사수자리</span><span>11월 23일 ~ 12월 24일</span></option>
                	<option value="염소자리"><span>염소자리</span><span>12월 25일 ~ 01월 19일</span></option>
                	<option value="물병자리"><span>물병자리</span><span>01월 20일 ~ 02월 18일</span></option>
                	<option value="물고기자리"><span>물고기자리</span><span>02월 19일 ~ 03월 20일</span></option>
                </select> -->
                
                
                <label for="T">공개 계정</label>
                <input type="radio" name="isPublic" id="T" value="T">
                <label for="F">비공개 계정</label>
                <input type="radio" name="isPublic" id="F" value="F">
            </div>
            <div>
                <button type="submit" class="btn yellow">완료</button>
            </div>
        </form>
    </div>
</body>
</html>