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

    dto.setBbsno(bbsno);
    dto.setPasswd(passwd);

    int cnt=dao.delete(dto);

    if(cnt==0){
        out.println("비밀번호가 일치하지 않습니다.");
        out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
    }else{
        out.println("<script>");
        out.println("alert('게시글이 삭제되었습니다.')");
        out.println("location.href='bbsList.jsp';");
        out.println("</script>");
    }//end if

%>
<%-- 본문끝--%>
<%@ include file="../footer.jsp"%>
