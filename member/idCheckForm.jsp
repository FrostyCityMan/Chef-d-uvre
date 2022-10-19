<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-18
  Time: 오후 3:03
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
    <h3>* 아이디 중복확인 * </h3>
    <form action="idCheckProc.jsp" onsubmit="return blankCheck()">
        아이디 : <input type="text" name="id" id="id" maxlength="10" autofocus>
        <input type="submit" value="중복확인">
    </form>
</div>
<script>
function  blankCheck() {
    let id = document.getElementById("id").value;
    id=id.trim();
    if(id.length<5){
        alert("아이디는 5~10글자 이내로 입력해 주세요")
        return false;
    }//end if
    return true;
}//end blankCheck
</script>
</body>
</html>
