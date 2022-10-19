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
<h3>게시글 수정</h3>
<p>
    <a href="bbsForm.jsp">[글쓰기]</a>
    &nbsp;
    &nbsp;
    <a href="bbsList.jsp"></a>
</p>
<div class="main-content">

<%
    int bbsno=Integer.parseInt(request.getParameter("bbsno"));
    dto=dao.read(bbsno);
    if(dto==null){
        out.println("해당 글 없음");
    }else{
%>

    <form name="bbsfrm" method="post" action="bbsUpdateProc.jsp" onsubmit="return updateCheck()">

        <input type="hidden" name="bbsno" value="<%=bbsno%>">
        <input type="hidden" name="col" value="<%=col%>">
        <input type="hidden" name="word" value="<%=word%>">

        <table class="table">

            <tr>
                <th class="success">제목</th>
                <td>
                    <input type="text" name="subject" id="subject" value="<%=dto.getSubject()%>"
                           class="form-control" maxlength="50" required>
                </td>
            </tr>
            <tr>
                <th class="success">내용</th>
                <td><textarea rows="5" class="form-control" name="content" id="content" ><%=dto.getContent()%></textarea>
            </td>
            </tr>

            <tr>
                <th class="success">작성자</th>
                <td>
                    <input type="text" name="wname" id="wname" value="<%=dto.getWname()%>"
                           class="form-control" maxlength="10" required>
                </td>
            </tr>
            <tr>
                <th class="success">비밀번호</th>
                <td><input type="password" name="passwd" id="passwd" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="수정" class="btn btn-light">
                </td>
            </tr>
        </table>
    </form>


<%
    }
%>


</div>
<%@ include file="../footer.jsp"%>
