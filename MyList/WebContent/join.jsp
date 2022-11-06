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
                <!-- <input type="date" name="userBirth" id="userBirth"> -->
                <select name="userBirth" id="userBirth">
                	<option value="양">03월 21일 ~ 04월 19일 ˚✧₊  양자리</option>
                	<option value="황소"> 04월 20일 ~ 05월 20일 ˚✧₊ 황소자리</option>
                	<option value="쌍둥이">05월 21일 ~ 06월 21일 ˚✧₊  쌍둥이자리</option>
                	<option value="게">06월 22일 ~ 07월 22일 ˚✧₊  게자리</option>
                	
                	<option value="사자"> 07월 23일 ~ 08월 22일 ˚✧₊ 사자자리</option>
                	<option value="처녀">08월 23일 ~ 09월 23일 ˚✧₊  처녀자리</option>
                	<option value="천칭"> 09월 24일 ~ 10월 22일 ˚✧₊ 천칭자리</option>
                	<option value="전갈">10월 23일 ~ 11월 22일 ˚✧₊  전갈자리</option>
                	
                	<option value="사수">11월 23일 ~ 12월 24일 ˚✧₊  사수자리</option>
                	<option value="염소">12월 25일 ~ 01월 19일 ˚✧₊  염소자리</option>
                	<option value="물병">01월 20일 ~ 02월 18일 ˚✧₊  물병자리</option>
                	<option value="물고기">02월 19일 ~ 03월 20일 ˚✧₊  물고기자리</option>
                </select>
                
                
                &nbsp;<input type="radio" name="isPublic" id="T" value="T" checked><label for="T">공개 계정</label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="isPublic" id="F" value="F"><label for="F">비공개 계정</label>    
            </div>
            <div>
                <button type="submit" class="btn yellow">완료</button>
            </div>
        </form>
    </div>
</body>
</html>