<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 처리페이지(useBean_action.jsp)에서 내장객체에 저장된 속성값을 반환받아 클라이언트에게
전달하는 JSP 문서 --%>    
<%
	if(request.getAttribute("hewon")==null) {//내장객체에 저장된 속성값이 없는 경우
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
%>
<%-- Hewon hewon=(Hewon)request.getAttribute("hewon"); --%>
<jsp:useBean id="hewon" class="xyz.itwill.bean.Hewon" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>회원정보확인</h1>
	<hr>
	<%-- getProperty 태그 : useBean 태그로 제공된 인스턴스의 필드값을 반환하는 기능을 제공하는 태그 --%>
	<%-- => JaveBean 클래스의 Getter 메소드를 호출하는 명령과 유사한 기능을 제공하는 태그 --%>
	<%-- name 속성(필수) : useBean 태그로 제공되는 인스턴스의 식별자(id 속성값)를 속성값으로 설정 --%>
	<%-- property 속성(필드) : useBean 태그로 제공되는 인스턴스의 필드명을 속성값으로 설정 --%>
	<%-- => 필드에 대한 Getter 메소드를 호출하여 인스턴스의 필드값 반환 --%>	
	<ul>
		<%-- <li>이름 = <%=hewon.getName() %></li> --%>
		<li>이름 = <jsp:getProperty name="hewon" property="name"/></li>
		<li>전화번호 = <jsp:getProperty name="hewon" property="phone"/></li>
		<li>주소 = <jsp:getProperty name="hewon" property="address"/></li>
	</ul>
</body>
</html>