\<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-11
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="ssi.jsp"%>

<%@ include file="../header.jsp"%>
<%-- 본문시작 bbsINS.jsp--%>

<%

    //사용자가 입력 요청한 정보를 가져오기
    String wname =request.getParameter("wname").trim();
    String subject =request.getParameter("subject").trim();
    String content =request.getParameter("content").trim();
    String passwd =request.getParameter("passwd").trim();
    String ip =request.getRemoteAddr();

   dto.setWname(wname);
   dto.setSubject(subject);
   dto.setContent(content);
   dto.setPasswd(passwd);
   dto.setIp(ip);

   int cnt=dao.create(dto);
   if(cnt==0){
       out.println("<p>글추가 실패 했습니다.</p>");
       out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");

   }else{
       out.println("<script>");
       out.println("    alert('게시글이 추가되었습니다');");
       out.println("    location.href='bbsList.jsp';");
       out.println("</script>");

   }//end if

%>

<%-- 본문끝--%>
<%@ include file="../footer.jsp"%>
