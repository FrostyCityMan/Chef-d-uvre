<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-11
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp"%>
<%@ include file="../member/auth.jsp"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 template.jsp--%>
<h3>게시글</h3>
<p>
    <a class="btn btn-default" href="bbsForm.jsp">글쓰기</a>
    &nbsp;
    &nbsp;
    <a class="btn btn-default" href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>">글목록</a>

</p>
<div class="container">
    <%
        int bbsno=Integer.parseInt(request.getParameter("bbsno"));
        dto=dao.read(bbsno);
        if(dto==null){
            out.println("해당 글 없음");
        }else{
            dao.incrementCnt(bbsno);//조회수 증가

    %>

    <table class="table">
        <tr>
            <th class="success">제목</th>
            <td><%=dto.getSubject()%></td>
        </tr>
        <tr>
            <th class="success">내용</th>
            <td style="text-align: left">
                <%
                    String content=Utility.convertChar(dto.getContent());
                    out.println(content);
                %>

            </td>
        </tr>
        <tr>
            <th class="success">조회수</th>
            <td><%=dto.getReadcnt()%></td>
        </tr>
        <tr>
            <th class="success">작성자</th>
            <td><%=dto.getWname()%></td>
        </tr>
        <tr>
            <th class="success">작성일</th>
            <td><%=dto.getRegdt()%></td>
        </tr>
        <tr>
            <th class="success">ip</th>
            <td><%=dto.getIp()%></td>
        </tr>


    </table>
    <br>
    <input class="btn btn-light" type="button" value="답변등록" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno%>'">
    <input class="btn btn-light" type="button" value="수정" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>'">
    <%      if(s_mlevel.equals("A1")){   %>
    <input type="button" value="삭제"   class="btn btn-light" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno%>'">
    <%
        }//if end
        }//if end
    %>

</div>
<%-- 본문끝--%>
<%@ include file="../footer.jsp"%>
