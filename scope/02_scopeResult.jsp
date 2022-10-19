<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-17
  Time: 오후 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>웹페이지의 Scope(유효범의) 결과</h3>
<%
    out.println("1) pageContext영역: "+pageContext.getAttribute("one"));
    out.print("<hr>");
    out.println("2) request영역: "+request.getAttribute("two"));
    out.print("<hr>");
    out.println("3) session영역: "+session.getAttribute("three"));
    out.print("<hr>");
    out.println("4) application영역: "+application.getAttribute("uid"));
    out.print("<hr>");
%>
</body>
</html>
