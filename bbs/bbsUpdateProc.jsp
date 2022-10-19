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

<%
    int bbsno=Integer.parseInt(request.getParameter("bbsno"));
    String passwd=request.getParameter("passwd").trim();
    String subject=request.getParameter("subject").trim();
    String content=request.getParameter("content").trim();
    String wname=request.getParameter("wname").trim();


    dto.setBbsno(bbsno);
    dto.setPasswd(passwd);
    dto.setSubject(subject);
    dto.setContent(content);
    dto.setWname(wname);

    int cnt=dao.update(dto);

    if(cnt==0){
        out.println("수정이 실패했습니다.");
        out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
    }else{
        out.println("<script>");
        out.println("alert('게시글이 수정되었습니다.')");
        out.println("location.href='bbsList.jsp?col="+col+"&word="+word+"';");
        out.println("</script>");
    }//end if

%>
<%-- 본문끝--%>
<%@ include file="../footer.jsp"%>
