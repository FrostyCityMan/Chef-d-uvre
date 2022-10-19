<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-11
  Time: 오후 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>Bootstrap Theme Simply Me</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/layout.css">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath() %>">Home</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="./notice/noticeList.jsp">Notice</a></li>
                <li><a href="./bbs/bbsList.jsp">Board</a></li>
                <li><a href="./pds/pbsList.jsp">Photo</a></li>
                <li><a href="./mail/mailForm.jsp">SendMail</a></li>
                <li><a href="./member/loginForm.jsp">Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
    <h3 class="margin">Who Am I?</h3>
    <img src="./images/1.jpg" class="img-responsive" style="display:inline" alt="Women" width="30%">
    <h3>I'm an adventurer</h3>
</div>



<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center">
    <div class="row">
        <div class="col-xs-12">
<%--            본문 시작--%>
            본문을 여기에 작성해주세요.
<%--            본문 종료--%>
        </div>
<%--        col 종료--%>
    </div>
<%--    row-종료--%>
</div>
<%--Contents 종료--%>
<!-- Footer -->
<footer class="container-fluid bg-4 text-left">
    서울 강남구 테헤란로 124 4층<br />
    전화:02-0000-0000/연락처:010-9143-0000/대표자:김도훈<br />
    Copyright &copy; 2022 Chef-d'œuvre

</footer>

</body>
</html>
