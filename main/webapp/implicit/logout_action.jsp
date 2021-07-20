<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리(세션에 속성값으로 저장된 권한 관련 정보 제거) 후 입력페이지
(login_form.jsp)로 이동하는 JSP 문서 --%>    
<%
	//session.removeAttribute("loginId");
	session.invalidate();//바인딩된 세션을 언바인딩 처리하고 제거하는 메소드 

	response.sendRedirect("login_form.jsp");
%>