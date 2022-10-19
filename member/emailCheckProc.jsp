<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-18
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div style="text-align: center">
    <h3> 이메일 중복확인 결과</h3>
    <%
        String email=request.getParameter("email").trim();
        int cnt =dao.duplicate2(email);
        out.println("입력ID :"+email);
        if(cnt==0){

            out.println("<p>사용 가능한 아이디 입니다.</p>");
    %>
    <a href="javascript:apply('<%=email%>')">[적용]</a>
    <script>
        function apply(email){
            //alert(email);
            opener.document.memfrm.email.value=email;
            window.close();
        }
    </script>
    <%
        }else{
            out.println("<p style='color:red'>사용 불가능한 아이디 입니다.</p>");
        }
    %>
    <hr>
    <a href="javascript:history.back()">[다시 검색]</a>
    &nbsp;
    &nbsp;
    <a href="javascript:window.close()">[창닫기]</a>
</div>
</body>
</html>
