<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	
	
	//현재 JSP 문서 요청시 전달되는 값을 반환받아 저장
	String category=request.getParameter("category");	
	if(category==null) {//전달값이 없는 경우
		category="main";
	}

	String headerFileName="";
	String master="";
	
	//전달값에 따라 포함될 JSP 파일 또는 관리자 정보 변경
	if(category.equals("main")) {
		headerFileName="header_main.jsp";
		master="홍길동(hong@itwill.xyz)";
	} else if(category.equals("blog")) {
		headerFileName="header_blog.jsp";
		master="임꺽정(lim@itwill.xyz)";
	} else if(category.equals("cafe")) {
		headerFileName="header_cafe.jsp";
		master="전우치(jwc@itwill.xyz)";
	} else {//비정상적인 요청
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<%-- Header 영역 --%>
	<%-- 
	<h1>메인 페이지</h1>
	<a href="include_main.jsp?category=main">메인</a>&nbsp;&nbsp;
	<a href="include_main.jsp?category=blog">블로그</a>&nbsp;&nbsp;
	<a href="include_main.jsp?category=cafe">카페</a>&nbsp;&nbsp;
	<hr>
	--%>
	
	<%-- include Directive : 외부파일(JSPF)의 코드(HTML 태그, Java 명령 등) 포함 --%>
	<%-- => JSP 문서에 외부파일의 코드를 포함하여 페이지 구현 --%>
	<%-- => 외부파일의 코드가 변경될 경우 JSP 문서가 변경된 것과 동일하므로 서블릿 변환 발생 --%>
	<%-- => file 속성값으로 표현식(Expression) 사용 불가능 - 설정된 파일의 코드만 포함 가능(정적 포함) --%>
	<%-- <%@include file="header.jspf" %> --%>
	
	<%-- include ActionTag : JSP 문서의 실행결과(HTML, CSS, JavaScript) 포함 --%>
	<%-- 형식) <jsp:include page="JSP"/> 또는 <jsp:include page="JSP"></jsp:include> --%>
	<%-- => 현재 JSP 문서에서 page 속성값으로 설정된 JSP 문서로 스레드를 이동하여 실행 
	결과를 가져와 현재 JSP 문서에 포함하여 페이지 구현 --%>
	<%-- => page 속성값으로 설정된 JSP 문서가 변경돼도 현재 JSP 문서에는 미영향 --%>
	<%-- => page 속성값으로 표현식 사용 가능 - 전달값에 따라 다른 JSP 문서의 실행 결과 포함(동적 포함) --%>
	<%-- <jsp:include page="header.jsp"/> --%>
	<jsp:include page="<%=headerFileName %>"/>
	
	<%-- Content 영역 --%>
	<ul>
		<li>요청에 대한 처리 결과</li>
		<li>요청에 대한 처리 결과</li>
		<li>요청에 대한 처리 결과</li>
		<li>요청에 대한 처리 결과</li>
		<li>요청에 대한 처리 결과</li>
	</ul>
	
	<%-- Footer 영역 --%>
	<%--
	<hr>
	<p>Copyright © itwill Corp. All rights reserved.</p>
	<!-- <p>관리자 : 홍길동(hong@itwill.xyz)</p> -->
	<p>관리자 : <%=master %></p>
	--%>
	
	<%-- param 태그 : 스레드가 이동되는 JSP 문서에 값을 전달하는 태그 --%>
	<%-- => 리퀘스트 메세지 바디에 값을 저장하여 전달 - POST 방식과 유사 --%>
	<jsp:include page="footer.jsp">
		<jsp:param value="<%=master %>" name="master2"/>
	</jsp:include>
</body>
</html>





