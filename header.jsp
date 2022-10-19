<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-11
  Time: 오후 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>Myweb</title>
    <link rel="icon" href="../images/Chef-d'œuvre%20logo.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" as="style" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard-dynamic-subset.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/layout.css">
    <script src="../js/myscript.js"></script>

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
            <a  href="<%=request.getContextPath() %>"><img src="../images/Chef-d'œuvre%20logo.png" style=" width:70px;"></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="../notice/noticeList.jsp">Notice</a></li>
                <li><a href="../bbs/bbsList.jsp">Board</a></li>
                <li><a href="../pds/pbsList.jsp">Photo</a></li>
                <li><a href="../mail/mailForm.jsp">SendMail</a></li>
                <li><a href="../member/loginForm.jsp">Login</a></li>
            </ul>
        </div>
    </div>
</nav>



<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center">
    <div class="row">
        <div class="col-xs-12">