<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-11
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp"%>
<%-- 본문시작 template.jsp--%>
<%
    if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")){
        //아이디 저장 쿠키 확인 ----------------------------------------------------------
        Cookie[] cookies = request.getCookies();   //사용자PC에 저장된 모든 쿠키값 가져오기
        String c_id = "";
        if(cookies != null){                  //쿠키가 존재하는지?
            for(int i=0; i<cookies.length; i++){   //모든 쿠키값을 검색
                Cookie cookie = cookies[i];         //쿠키 하나씩 가져오기
                if(cookie.getName().equals("c_id") == true){    //쿠키이름(변수명)이 c_id인가요?
                    c_id = cookie.getValue();               //찾은 c_id의 값 가져오기
                }//if end
            }//for end
        }//if end
        //--------------------------------------------------------------------------
%>

<h3>Login</h3>
<img src="../images/Chef-d'œuvre%20logo.png" style="width: 15%">
<h2>Chef-d'œuvre에 오신것을 환영합니다.</h2>
<p>Chef-d'œuvre는 소프트웨어 개발자를 위한 지식공유 플랫폼입니다.</p>
<br>
<br>
<form name="Loginfrm" id="Loginfrm" class="col-md-4" style="float: none; margin:0 auto;" action="LoginProc.jsp" onsubmit="return loginCheck()"><!-- myscript.js -->

    <table class="table grid">
        <tr>
            <td style="padding: 50px 0px;">
              ID  <input style="border-radius: 10px" type="text" name="id" id="id"  maxlength="10" required value="<%=c_id%>">
            </td>
        </tr>
        <tr>

            <td style="padding: 50px 0px;">
              PW  <input style="border-radius: 10px" type="password" name="passwd" id="passwd"  maxlength="10" required>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <label><input type="checkbox" name="c_id" value="SAVE"<%if(!c_id.isEmpty())out.print("checked"); %>>아이디 저장</label>
                &nbsp;&nbsp;&nbsp;
                <a href="agreement.jsp" style="color: inherit;">회원가입</a>
                &nbsp;&nbsp;&nbsp;
                <a href="findID.jsp" style="color: inherit;">아이디/비밀번호찾기</a>
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <br>
                <%--                type=image는 기본속성이 submit--%>
            <button type="submit" class="btn btn-block" >로그인</button>
            </td>
        </tr>
    </table>
</form>
<%
    }else{
        //로그인 성공했다면
        out.println("<strong>"+ s_id +"</strong> 님");
        out.println("<a href='logout.jsp'>[로그아웃]</a>");
        out.println("<br><br>");
        out.println("<a href='memberModify.jsp'>[회원정보수정]</a>");
        out.println("&nbsp;&nbsp;");
        out.println("<a href='memberWithdraw.jsp'>[회원탈퇴]</a>");
    }//if end
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>
