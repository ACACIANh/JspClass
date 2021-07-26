<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 사용자와 비로그인 사용자를 구분하여 응답 처리 --%>
<%
	//세션에 저장된 권한 관련 정보를 반환받아 저장
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
%>    
<div id="profile">
	<% if(loginMember==null) {//비로그인 사용자인 경우 %>
		<a href="index.jsp?workgroup=member&work=member_login&state=1">로그인</a>&nbsp;&nbsp;
		<a href="index.jsp?workgroup=member&work=member_join">회원가입</a>&nbsp;&nbsp;
	<% } else {//로그인 사용자인 경우 %>
		<a href="index.jsp?workgroup=member&work=member_logout_action">로그아웃</a>&nbsp;&nbsp;
		<a href="index.jsp?workgroup=member&work=member_detail">내정보</a>&nbsp;&nbsp;
		<% if(loginMember.getStatus()==9) {//로그인 사용자가 관리자인 경우 %>
			<a href="index.jsp?workgroup=admin&work=admin_main">관리자</a>&nbsp;&nbsp;
		<% } %>
	<% } %>
</div>
<div id="logo"><a href="index.jsp">쇼핑몰</a></div>
<div id="menu">
	<a href="index.jsp?workgroup=company&work=company_hello">회사소개</a>
	<a href="index.jsp?workgroup=cart&work=cart_list">장바구니</a>
	<a href="index.jsp?workgroup=order&work=order_list">구매내역</a>
	<a href="index.jsp?workgroup=board&work=board_list">게시판</a>
</div>