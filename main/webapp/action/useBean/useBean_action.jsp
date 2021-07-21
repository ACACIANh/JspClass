<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지(useBean_form.jsp)의 전달값을 반환받아 처리하고 처리결과를 내장객체의
속성값으로 저장하여 응답페이지(useBean_print.jsp)로 포워드 이동하는 JSP 문서 --%>
<%
	//비정상적인 요청에 대한 처리
	if(request.getMethod().equals("GET")) {//JSP 문서를 GET 방식으로 요청한 경우
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}

	//POST 방식으로 요청하여 리퀘스트 메세지의 바디에 저장되어 전달된 값에 대한 캐릭터셋 변경
	request.setCharacterEncoding("utf-8");
%>  
<%-- useBean 태그 : 내장객체에 저장된 속성값을 인스턴스로 반환받아 저장하거나 인스턴스를
생성하여 내장객체의 속성값으로 저장하는 기능을 제공하는 태그 --%>
<%-- => 내장객체에 속성값을 저장하거나 반환하는 메소드와 유사한 기능을 제공하는 태그 --%>
<%-- id 속성(필수) : 반환(생성)되는 인스턴스를 저장하기 위한 이름(변수명)을 속성값으로 설정 --%>
<%-- => 내장객체에 저장된 속성값의 속성명(식별자)으로 사용  --%>
<%-- class 속성(필수) : 반환(생성)되는 인스턴스의 자료형(클래스)를 속성값으로 설정 --%>
<%-- scope속성(선택) : 내장객체에 저장된 속성값의 사용범위을 속성값으로 설정 --%>
<%-- => page(기본), request, session, application --%>
<%-- Hewon hewon=new Hewon();	request.setAttribute("hewon", hewon); --%>
<jsp:useBean id="hewon" class="xyz.itwill.bean.Hewon" scope="request"/>

<%-- setProperty 태그 : useBean 태그로 제공된 인스턴스의 필드값을 변경하는 기능을 제공하는 태그 --%>
<%-- => JaveBean 클래스의 Setter 메소드를 호출하는 명령과 유사한 기능을 제공하는 태그 --%>
<%-- name 속성(필수) : useBean 태그로 제공되는 인스턴스의 식별자(id 속성값)를 속성값으로 설정 --%>
<%-- property 속성(필드) : useBean 태그로 제공되는 인스턴스의 필드명을 속성값으로 설정 --%>
<%-- => 필드에 대한 Setter 메소드를 호출하여 인스턴스의 필드값 변경 --%>
<%-- value 속성(선택) : useBean 태그로 제공되는 인스턴스의 필드에 저장될 값을 속성값으로 설정 --%>
<%-- <jsp:setProperty name="hewon" property="name" value="홍길동"/> --%>
<%-- value 속성값이 생략되면 JSP 문서 요청시 전달되는 값을 반환받아 필드값으로 변경 --%>
<%-- => 전달되는 이름(입력태그의 name 속성값)과 property 속성값(필드명)이 동일해야만 전달값을 반환받아 필드값으로 변경 --%>
<%-- hewon.setName(request.getParameter("name")); --%>
<%-- 
<jsp:setProperty name="hewon" property="name"/>
<jsp:setProperty name="hewon" property="phone"/>
<jsp:setProperty name="hewon" property="address"/>
--%>
<%-- property 속성값을 [*]로 설정한 경우 모든 전달값을 반환받아 필드값 변경 --%>
<%-- => 전달되는 이름과 필드명이 동일해야만 전달값을 반환받아 필드값으로 변경 --%>
<jsp:setProperty name="hewon" property="*"/>

<%-- forward 태그를 사용한 포워드 이동 --%>
<%-- request.getRequestDispatcher("no_useBean_print.jsp").forward(request, response); --%>
<jsp:forward page="useBean_print.jsp"/>







