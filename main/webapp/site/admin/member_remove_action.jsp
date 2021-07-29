<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 삭제하고자 선택된 회원정보의 아이디 목록을 전달받아 MEMBER 테이블에 저장된 해당 아이디의
회원정보를 삭제하고 회원목록 출력페이지(member_manager.jsp)로 이동하는 JSP 문서  --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%@include file="/site/security/admin_check.jspf"%>
<%
	//비정상적인 요청에 대한 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//체크박스에 의해 선택되어 전달된 값들을 반환받아 저장 
	// => 하나의 이름으로 여러 개의 값이 전달되므로 getParameterValues() 메소드 호출  
	String[] checkId=request.getParameterValues("checkId");
	
	//배열에 저장된 요소값(아이디)를 반복적으로 제공받아 삭제 처리
	for(String id:checkId) {
		//아이디를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를 삭제하는 DAO 클래스의 메소드 호출
		MemberDAO.getDAO().deleteMember(id);
	}
	
	//회원목록 출력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=admin&work=member_manager';");
	out.println("</script>");
%>







