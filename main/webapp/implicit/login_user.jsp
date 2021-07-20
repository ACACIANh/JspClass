<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 환영메세지를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 로그인 사용자인 경우에만 요청 처리 후 응답결과 제공 --%>
<%-- => 비로그인 사용자가 JSP 문서를 요청한 경우 입력페이지(login_form.jsp) 이동 --%>
<%-- 세션에 속성값으로 저장된 권한 관련 정보를 이용하여 로그인 사용자와 비로그인 사용자 구분 --%>
<%
	//세션에 속성값으로 저장된 권한 관련 정보를 반환받아 저장
	String loginId=(String)session.getAttribute("loginId");

	//세션에 속성값으로 저장된 권한 관련 정보가 없는 경우 - 비로그인 사용자
	if(loginId==null) {
		session.setAttribute("message", "권한이 없어 페이지에 접근할 수 없습니다.");
		response.sendRedirect("login_form.jsp");
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>로그인 사용자 전용 페이지</h1>
	<hr>
	<p><%=loginId %>님, 환영합니다. <a href="logout_action.jsp">로그아웃</a></p>
	<p><a href="login_form.jsp">로그인 페이지 이동</a></p>
	<hr>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
	<p>로그인 사용자에게만 보여지는 내용</p>
</body>
</html>






