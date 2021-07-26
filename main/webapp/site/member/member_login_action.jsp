<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 인증정보를 전달받아 MEMBER 테이블에 저장된 회원정보와 비교하여 인증 처리 후
페이지를 이동하는 JSP 문서 --%>    
<%-- => 인증 실패 : 세션에 메세지와 아이디를 저장하고 로그인 입력페이지(member_login.jsp)로 이동 --%>
<%-- => 인증 성공 : 세션에 권장 관련 정보를 저장하고 기존 요청 페이지로 이동 --%>
<%--    (기존 요청 페이지가 없는 경우 메인페이지 이동) --%>
<%
	//비정상적인 요청에 대한 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400'");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 아이디 인증 실패
	// => MemberDTO 인스턴스 반환 : 회원정보 검색 - 아이디 인증 성공
	MemberDTO member=MemberDAO.getDAO().selectIdMember(id);
	if(member==null) {//아이디에 대한 인증 실패가 발생한 경우
		session.setAttribute("message", "입력한 아이디가 존재하지 않습니다.");
		session.setAttribute("id", id);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_login';");
		out.println("</script>");
		return;
	}
	
	if(!member.getPasswd().equals(passwd)) {//비밀번호에 대한 인증 실패가 발생한 경우
		session.setAttribute("message", "입력한 아이디가 없거나 비밀번호가 맞지 않습니다.");
		session.setAttribute("id", id);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_login';");
		out.println("</script>");
		return;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 해당 회원정보의 마지막 로그인 날짜를 
	//변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateLastLogin(id);
	
	//인증 성공 - 세션에 권한 관련 정보(회원정보 - MemberDTO 인스턴스)를 저장
	session.setAttribute("loginMember", MemberDAO.getDAO().selectIdMember(id));
	
	//페이지 이동
	String url=(String)session.getAttribute("url");//세션에 저장된 기존 요청페이지를 반환받아 저장 
	if(url==null) {//기존 요청페이지가 없는 경우 - 메인페이지 이동
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=product&work=product_list';");
		out.println("</script>");
	} else {//기존 요청페이지가 있는 경우 - 요청페이지 이동
		session.removeAttribute("url");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+url+"';");
		out.println("</script>");
	}
%>

















