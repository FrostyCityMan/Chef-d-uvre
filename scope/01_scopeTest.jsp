<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2022-10-17
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Myweb</title>

</head>
<body>
<h3>내장객체 및 내부변수</h3>
<%
<%--

●[JSP 내장 객체]
- JSP페이지가 서블릿에서 변환될 때 (톰캣에서 어떤 사용자가 요청했을 때) .jsp컨테이너(Tomcat웹 서버)가 자동적으로
제공해주고 있음.

- JSP페이지 내에서 제공하는 특수한 레퍼런스 (참조) 타입의 변수
- 객체 생성 없이 바로 사용할 수 있는 JSP 객체이다. (이미 내장으로 생성되어 있기 때문에)

EX)
1. Out : 출력 객체
2. request : 요청에 관한 정보
3. response : 응답에 관한 정보
4. session  : 요청에 관한 Context 제공
5. pageContext : JSP페이지 자체의 Context 제공
6. application : 서블릿 및 외부 환경 정보 Context제공
------------------------------------------------------
●[scope의 종류]
- myweb 프로젝트에서 페이지들간에 값을 공유하기 위해 사용
1. pageContext : 현재 페이지에서만 유효
2. request     : 부모페이지와 자식 페이지 에서만 유효
3. session     : myweb프로젝트의 모든 페이지에서 유효 (사용자 개별 접근, 시간)
4. application : myweb프로젝트의 모든 페이지에서 유효 (모든 사용자 접근, 서버 정보)
------------------------------------------------------
●[내부변수 선언 방식] - 별도의 자료형이 없다
1. pageContext.setAttribute("변수명", 값)
2. request.setAttribute(arg0, arg1)
3. session.setAttribute(arg0, arg1)
4. application.setAttribute(arg0, arg1)

●[내부변수 값 가져오기]
1. pageContext.getAttribute("변수명")
2. request.getAttribute("변수명")
3. session.getAttribute("변수명")
4. application.getAttribute("변수명")

--%>
<%--각 내부 변수에 값 올리기--%>

%>

</body>
<%
    pageContext.setAttribute("kor",100);
    request.setAttribute("eng",200);
    session.setAttribute("mat",300);
    application.setAttribute("uname","itwill");
    //내부 변수 값 가져오기
    out.println(pageContext.getAttribute("kor"));
    out.println(request.getAttribute("eng"));
    out.println(session.getAttribute("mat"));
    out.println(application.getAttribute("uname"));

%>
</html>
