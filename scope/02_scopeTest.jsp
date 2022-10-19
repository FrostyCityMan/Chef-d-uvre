<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-17
  Time: 오후 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>웹페이지의 SCOPE(유효범위)</h3>
<%
  pageContext.setAttribute("one",100);
  request.setAttribute("two",200);
  session.setAttribute("three",300);
  application.setAttribute("uid","ITWILL");
%>
<form action="02_scopeResult.jsp">
    <button>[Scope 결과 페이지 이동]</button>
</form>

<a href="02_scopeResult.jsp">[SCOPE 결과 페이지 이동]</a>

<%--<script>--%>
<%--    alert();--%>
<%--    location.href="02_scopeResult.jsp";--%>
<%--</script>--%>

<%--<jsp:forward page="02_scopeResult.jsp"></jsp:forward>--%>

<%
    String view="02_scopeResult.jsp";
    RequestDispatcher rd=request.getRequestDispatcher(view);
    rd.forward(request,response);

/*
내부변수        02_scopeTest.jsp(부모)        02_scopeResult.jsp(자식)
----------------------------------------------------------------------------
pageContext           O                              X
request               O                              △
session               O                              O
application           O                              O
 */

%>
<html>
<head>


</body>
</html>
