<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-11
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 template.jsp--%>
<%--글번호와 비밀번호가 일치하면 글삭제--%>
<h3>글삭제</h3>
<p><a href="bbsList.jsp">[글목록]</a></p>
<%
    int bbsno=Integer.parseInt(request.getParameter("bbsno"));
    String passwd=request.getParameter("passwd");
%>
<div class="container">
<form method="post" action="bbsDelProc.jsp" onsubmit="return pwCheck()">
    <input type="hidden" name="bbsno" value="<%=bbsno%>">
    <table class="table table-striped">
        <tr>
            <th class="success">비밀번호</th>
            <td><input type="password" name="passwd" id="passwd" required></td>
        </tr>
        <tr>
             <td colspan="2">
                  <input type="submit" value="삭제" class="btn btn-light">
            </td>
        </tr>
    </table>
</form>
</div>
<%-- 본문끝--%>

<%@ include file="../footer.jsp"%>
