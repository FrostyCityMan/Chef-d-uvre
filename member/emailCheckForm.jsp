<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-18
  Time: 오후 5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div style="text-align: center">
    <h3>* 이메일 중복확인 * </h3>
    <form action="emailCheckProc.jsp" onsubmit="return blankCheck()">
        이메일 : <input type="text" name="email" email="email" maxlength="30" autofocus>
        <input type="submit" value="중복확인">
    </form>
</div>
<script>
    function  blankCheck() {
        let email = document.getElementById("email").value;
        email=email.trim();
        if(email.length<5){
            alert("이메일 형식을 지켜주세요.")
            return false;
        }//end if
        return true;
    }//end blankCheck
</script>
</body>
</html>
