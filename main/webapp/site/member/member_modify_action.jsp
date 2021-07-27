<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 회원정보 상세 출력
(member_detail.jsp)로 이동하는 JSP 문서 --%>
<%-- => 비로그인 사용자가 JSP 문서를 요청한 경우 비정상적인 요청으로 에러페이지 이동 --%>
<%@include file="/site/security/login_check.jspf" %>
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
	String passwd=request.getParameter("passwd");
	if(passwd==null || passwd.equals("")) {//비밀번호가 전달되지 않은 경우
		//로그인 사용자의 비밀번호를 변수에 저장 - 기존 비밀번호로 변경
		passwd=loginMember.getPasswd();
	} else {//비밀번호가 전달된 경우
		//전달된 비밀번호를 암호화 처리하여 변수에 저장 - 새로운 비밀번호로 변경
		passwd=Utility.encrypt(request.getParameter("passwd"));
	}
	String name=request.getParameter("name").trim();
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile1")+"-"+request.getParameter("mobile2")
		+"-"+request.getParameter("mobile3");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2=Utility.stripTag(request.getParameter("address2"));
	
	//DTO 인스턴스를 생성하고 전달값으로 필드값 변경
	MemberDTO member=new MemberDTO();
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setEmail(email);
	member.setMobile(mobile);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	
	//회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateMember(member);
	
	//세션에 저장된 권한 관련 정보(회원정보)를 변경
	session.setAttribute("loginMember", MemberDAO.getDAO().selectIdMember(id));
	
	//회원정보 상세 출력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_detail'");
	out.println("</script>");
%>








