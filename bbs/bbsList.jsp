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
<h3>글 목록</h3>
<%

    int totalRecord=dao.count();
    int searchRecord=dao.count2(col, word);
    if(word.length()>=1) {
        out.println("<div colspan=\"8\" align=\"right\"> 검색 글 갯수" + searchRecord + "</div>");
    }else{
        out.println("<div colspan=\"8\" align=\"right\"> 총 글 갯수" + totalRecord + "</div>");
    }


%>
<%--검색--%>

<div colspan="6" style="text-align:right; height:50px;">
    <form action="bbsList.jsp" onsubmit="return searchCheck()">
        <select name="col">
            <option value="subject_content">제목+내용
            <option value="subject">제목
            <option value="content">내용
            <option value="wname">작성자
            </select>
        <input type="text" name="word" id="word">
        <input type="submit" value="검색" class="btn btn-light">
    </form>
</div>
<table class="table table-hover" width="80%">

    <tr >
        <th style="text-align:center" >글 번호</th>
        <th style="text-align:center">제 목</th>
        <th style="text-align:center">조회수</th>
        <th style="text-align:center">작성일</th>
    </tr>
<%
    int recordPerPage=5;
    request.setCharacterEncoding("UTF-8");
    //한페이지당 출력할 행의 갯수

    ArrayList<BbsDTO> list=dao.list3(col,word,nowPage,recordPerPage);

    if(list==null) {
      out.println("<tr>");
      out.println("<td colspan=\"8\" align=\"center\">No Data</td>");
      out.println("</tr>");
    }else{

        // 오늘 날짜를 문자열 "" 만들기

        String today=Utility.getDate();

        for (int i = 0; i < list.size(); i++) {
            dto=list.get(i);
            %>
    <tr>
    <%
                out.println("<td>");
                for(int n=1; n<=dto.getIndent(); n++){
                    out.println("<img src='../images/reply.gif'>");
                }

            out.println(dto.getBbsno() + "</td>");

            out.println("<td><a href='bbsRead.jsp?bbsno="+dto.getBbsno()+"&col="+col+"&word="+word+"&nowPage="+nowPage+"'>" + dto.getSubject()+"</a>");
            String regdt=dto.getRegdt().substring(0,10);
            if(regdt.equals(today)){
                out.println("<img src='../images/new.gif'></td>");
            }else {
                out.println("</td>");
            }
            out.println("<td>" + dto.getReadcnt() + "</td>");
            out.println("<td>" + dto.getRegdt().substring(0,10) + "</td>");


        }//end for

    }//end if
        out.println("<tr>");
        out.println("<td colspan='4' style='text-align:left; height: 50px'>");
        String paging=new Paging().paging3(totalRecord,nowPage,recordPerPage,col,word,"bbsList.jsp");
        out.print(paging);
        out.println("</td>");
        out.println("</tr>");
%>
    </tr>
</table>
<br>
<a class="btn btn-default pull-right" href="bbsForm.jsp">글쓰기</a>

<%-- 본문끝--%>
<%@ include file="../footer.jsp"%>
