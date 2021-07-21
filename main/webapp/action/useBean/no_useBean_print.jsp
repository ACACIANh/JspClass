<%@page import="xyz.itwill.bean.Hewon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 처리페이지(no_useBean_action.jsp)에서 내장객체에 저장된 속성값을 반환받아 클라이언트에게
전달하는 JSP 문서 --%>
<%
	/*
	//비정상적인 요청에 대한 처리
	if(session.getAttribute("hewon")==null) {//내장객체에 저장된 속성값이 없는 경우
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
	Hewon hewon=(Hewon)session.getAttribute("hewon");
	
	//다른 JSP 문서에서 속성값을 반환받아 사용할 수 없도록 내장객체에 저장된 속성값 제거
	session.removeAttribute("hewon");
	*/
	
	if(request.getAttribute("hewon")==null) {//내장객체에 저장된 속성값이 없는 경우
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
	Hewon hewon=(Hewon)request.getAttribute("hewon");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>회원정보확인</h1>
	<hr>
	<ul>
		<li>이름 = <%=hewon.getName() %></li>
		<li>전화번호 = <%=hewon.getPhone() %></li>
		<li>주소 = <%=hewon.getAddress() %></li>
	</ul>
</body>
</html>