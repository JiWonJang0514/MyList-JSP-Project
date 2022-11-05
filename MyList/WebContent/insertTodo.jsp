<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" href="css/form.css">
</head>
<body>
    <div class="wrapper">
        <form action="" method="">
            <div>
                <label for="todo">할 일</label><br>
                <input type="text" name="todo" id="todo"><br>

                <label for="deadline">기한</label><br>
                <input type="date" name="deadline" id="deadline"><br>
            </div>
            <div>
                <button type="submit" class="btn yellow">추가</button>
            </div>
        </form>
    </div>
</body>
</html>