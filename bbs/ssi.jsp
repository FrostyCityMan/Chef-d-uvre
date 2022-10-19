
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%--ssi.jsp 공통코드--%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%@ page import="net.utility.*"%>
<%@ page import="net.bbs.BbsDAO"%>
<%@ page import="net.bbs.BbsDTO"%>


<jsp:useBean id="dto" class="net.bbs.BbsDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dao" class="net.bbs.BbsDAO" scope="page"></jsp:useBean>

<%
  request.setCharacterEncoding("UTF-8");
%>
<%
  //검색
String word=request.getParameter("word");
String col =request.getParameter("col");
word=Utility.checkNull(word);
col=Utility.checkNull(col);

//현재페이지
  int nowPage=1;
  if(request.getParameter("nowPage")!=null){
    nowPage = Integer.parseInt(request.getParameter("nowPage"));
  }//end if
%>