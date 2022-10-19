<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-17
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--●[Session 내장객체]--%>
<%--- httpsession session--%>
<%--- 요청한 사용자에게 개별적으로 접근(나만의 캐비넷)--%>
<%--- 선언한 세션변수 전역적 상태로 유지된다.--%>
<%--- 요청한 정보의 상태를 유지하기 위해서--%>
<%--- 일정 시간동안 이벤트가 발생되지 않으면 자동 삭제--%>

<%--세션 내장객체에서 발급해주는 아이디--%>
<%
    out.println("세션 임시 아이디 : ");
    out.print(session.getId());
    out.println("<hr>");

    //세션 변수
    session.setAttribute("s_id","itwill");
    session.setAttribute("s_pw","1234");

    //세션 변수 값 가져오기
    Object obj=session.getAttribute("s_id");
    String s_id=(String)obj;
    String s_pw=(String)session.getAttribute("s_pw");

    out.println("세션 변수 s_id : "+s_id+"<hr>");
    out.println("세션 변수 s_pw : "+s_pw+"<hr>");


    //세션변수 강제제거(로그아웃할때)->null값
    session.removeAttribute("s_id");
    session.removeAttribute("s_pw");

    out.print("세션변수 삭제후<hr>");
    out.print("세션변수 s_id:"+session.getAttribute("s_id"));
    out.print("<hr>");
    out.print("세션변수 s_pw:"+session.getAttribute("s_pw"));
    out.println("<hr>");

    //세션영역에 있는 모든값 전부 강제 삭제
    session.invalidate();
    out.println("현재 세션 유지시간 :");
    out.println(session.getMaxInactiveInterval());
    out.println("초 (30분)");

    out.println("<hr>");

    session.setMaxInactiveInterval(60*10); //10분

    out.println("현재 세션 유지시간 :");
    out.println(session.getMaxInactiveInterval());
    out.println("초 (10분)");
    out.println("<hr>");

    

%>

<%--세션 변수
-- 별도의 자료형이 없다
-> myweb 프로젝트의 모든 페이지에서 공유되는 전역변수 (메일/카페/블로그등 상태유지에 사용)

--%>
<%--세션 시간--%>

</body>
</html>
