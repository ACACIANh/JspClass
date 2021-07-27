<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디와 상태를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원상태를 변경하고
회원목록 출력페이지(member_manager.jsp)로 이동하는 JSP 문서 --%>    
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%@include file="/site/security/admin_check.jspf"%>
<%
	//비정상적인 요청에 대한 처리
	if(request.getParameter("id")==null || request.getParameter("id").equals("")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	int status=Integer.parseInt(request.getParameter("status"));
	
	//아이디와 상태를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원상태를 변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateStatus(id, status);
	
	//회원목록 출력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=admin&work=member_manager';");
	out.println("</script>");
%>