<%@page import="xyz.itwill.util.Utility"%>
<%@page import="xyz.itwill.dao.MemberDAO"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지(member_join.jsp)에서 회원정보를 전달받아 MEMBER 테이블에 저장하고 로그인
입력페이지(member_login.jsp)로 이동하는 JSP 문서 --%>
<%
	//비정상적인 요청에 대한 처리
	if(request.getMethod().equals("GET")) {
		//템플릿 페이지(index.jsp)의 Content 영역에 포함되는 JSP 문서이므로 리다이렉트 이동 불가능
		// => 자바스크립트를 이용하여 페이지 이동
		//response.sendRedirect(request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400");
		//return;
		
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400'");
		out.println("</script>");
		return;
	}
	
	//POST 방식으로 전달된 값에 대한 캐릭터셋 변경
	//템플릿 페이지(index.jsp)의 Content 영역에 포함되는 JSP 문서이므로 POST 방식으로 
	//전달된 값에 대한 캐릭터셋 변경 불가능 
	// => 템플릿 페이지(index.jsp)에서 POST 방식으로 전달된 값에 대한 캐릭터셋 변경 
	//request.setCharacterEncoding("utf-8");
	
	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	//비밀번호를 전달받아 암호화 처리하여 저장
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	//이름을 전달받아 앞과 뒤에 존재하는 공백을 제거하여 저장
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
	
	//회원정보를 전달받아 MEMBER 테이블이 삽입하여 저장하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().insertMember(member);
	
	//로그인 입력페이지(member_login.jsp)로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_login'");
	out.println("</script>");
%>







