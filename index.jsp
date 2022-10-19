<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-11
  Time: 오후 12:13
  To change this template use File | Settings | File Templates.
--%>

<%-- 참고 사이트
https://designwith.co.kr/ --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>Myweb</title>
    <link rel="icon" href="images/Chef-d'œuvre%20logo.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" as="style" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard-dynamic-subset.css">
    <link rel="stylesheet" href="css/layout.css">
    <script src="js/myscript.js"></script>
</head>
<body>

<%--<div id="divpop" style="position:absolute;left:100px;top:150px;z-index:200;visibility:hidden;">--%>
<%--    <table width=490px height=340px cellpadding=0 cellspacing=0 >--%>
<%--        <tr>--%>
<%--            <td style="border:1px #666666 solid" height=340px align=center bgcolor=white>--%>
<%--                <a href="http://www.naver.com"><img src="images/4.jpg" width=490px height=340px alt="설명설명"></a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height=10 bgcolor="#000000">--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <form name="notice_form">--%>
<%--                <td height=25 align=right bgcolor="#000000" valign=middle>--%>
<%--                    <input type="checkbox" name="chkbox" value="checkbox"> <font color=#eeeeee>오늘 하루 이 창을 열지 않음 </font>--%>
<%--                    <button id="btnclose">닫기</button>--%>
<%--                </td>--%>
<%--            </form>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</div>--%>


<!-- Navbar -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a  href="<%=request.getContextPath() %>"><img src="images/Chef-d'œuvre%20logo.png" style=" width:70px;"></a>
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
    <h3 class="margin">Chef-d'œuvre</h3>
    <img src="./images/1.jpg" class="img-responsive" style="display:inline" alt="Women" width="30%">
    <h3>Master Piece</h3>
</div>



<!-- Contents 시작 -->
<div class="container-fluid bg-3 text-center">

    <div class="row">
    <div
            class="col-lg-6 text-right"
            style="padding: 50px; padding-right: 80px"
    >
        <ul style="list-style: none" >
            <li>시스템 통합</li>
            <li style="font-size: 80px; line-height: 50px">System</li>
            <li style="font-size: 80px; line-height: 150px">Integration</li>
            <li>
                셰프 드 오브만의 통찰력으로 고객의 성공을 위한 소중한 IT인프라를
                제공하겠습니다.
            </li>
            <li style="color: #777">
                Chef-d'œuvre's insights provide valuable IT infrastructure for your
                customers's <br />I'll provide it.
            </li>
        </ul>
    </div>
    <div class="col-lg-6">
        <img src="images/2.jpg" class="img-responsive" style="height: 700px" />
    </div>
    </div>
    <div class="row">
        <!-- 본문 시작 -->
        <div class="col-lg-6">
            <img
                    src="images/3.jpg"
                    class="img-responsive"
                    style="height: 700px"
            />
        </div>
        <div class="col-lg-6 text-left" style="padding: 50px">
            <ul style="list-style: none" >
                <li>명품 전문가</li>
                <li style="font-size: 80px; line-height: 50px">Masterpiece</li>
                <li style="font-size: 80px; line-height: 150px">Professional</li>
                <li>우리는 다릅니다. 우리는 기성품이아닌 맞춤 명품을 만듭니다.</li>
                <li style="color: #777">
                    We are different. We make custom-made luxury goods, <br />not
                    off-the-shelf products.
                </li>
            </ul>
            <!-- ul종료 -->
        </div>
</div>
<%--Contents 종료--%>
<!-- Footer -->
<footer class="container-fluid bg-4 text-left" style="color:#888888; ">
    서울 강남구 테헤란로 124 4층<br />
    전화:02-0000-0000/연락처:010-9143-0000/대표자:김도훈<br />
    Copyright &copy; 2022 Chef-d'œuvre

</footer>

</body>
</html>
