<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지(join_form.jsp)에서 전달된 회원정보를 반환받아 클라이언트에게 전달하는
JSP 문서 - 처리 및 출력페이지 --%>
<%
	//비정상적인 요청에 대한 처리 : 클라이언트에게 에러코드 전달 또는 에러페이지 이동
	//request.getMethod() : 클라이언트의 요청방식을 문자열(String - 대문자)로 반환하는 메소드
	if(request.getMethod().equals("GET")) {//JSP 문서를 GET 방식으로 요청한 경우
		//response.sendError(int sc) : 클라이언트에게 에러코드(4XX 또는 5XX)를 전달하는 메소드
		// => 에러코드는 HttpServletResponse 인터페이스에 선언된 상수(Constant)를 사용
		//response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);//405
		//return;
		
		//response.sendRedirect(String url) : 클라이언트에게 상태코드 301과 URL 주소를 전달하여
		//브라우저의 주소를 전달된 URL 주소로 변경하여 재요청하도록 지시하는 메소드 - 리다이렉트 이동
		// => 리다이렉트 이동은 ServerRoot를 최상위 디렉토리로 처리 
		//response.sendRedirect("/jsp/error/error_405.jsp");//절대경로
		//return;
		
		//입력페이지(join_form.jsp)로 리다이렉트 이동
		// => 웹프로그램 요청시 필요한 값은 QueryString를 이용하여 전달
		//String message="비정상적인 방법으로 join_action.jsp 문서를 요청 하였습니다.";
		//URL 주소(QueryString 포함)는 영문자,숫자,일부 특수문자를 제외한 문자 사용 불가능
		// => 사용 불가능한 문자로 부호화 처리하면 URL 주소로 사용 가능
		//URLEncoder.encode(String s, String enc) : 문자열을 전달받아 원하는 캐릭터셋의 
		//부호화된 코드값에 문자열로 변환하여 반환하는 메소드
		// => 자바스크립트의 encodeURIComponent(s) 함수와 동일한 기능을 제공하는 메소드
		//String message=URLEncoder.encode("비정상적인 방법으로 join_action.jsp 문서를 요청 하였습니다.","utf-8");
		//response.sendRedirect("join_form.jsp?message="+message);//상대경로
		//return;
		
		//JSP 문서에 바인딩 되어 제공되는 session 내장객체의 속성값으로 메세지를 저장
		// => 컨텍스트에 존재하는 모든 JSP 문서에서 속성값을 반환받아 사용 - session Scope 
		session.setAttribute("message", "비정상적인 방법으로 join_action.jsp 문서를 요청 하였습니다.");
		response.sendRedirect("join_form.jsp");
		return;
	}

	//POST 방식으로 요청하여 리퀘스트 메세지의 바디에 저장되어 전달된 값에 대한 캐릭터셋 변경
	//request.setCharacterEncoding(String encoding) : 입력값에 대한 캐릭터셋을 변경하는 메소드
	request.setCharacterEncoding("utf-8");
	
	//전달값(입력값)을 반환받아 저장
	//request.getParameter(String name) : 전달값을 얻어와 반환하는 메소드
	// => 매개변수에 입력태그의 name 속성값 또는 QueryString의 이름을 전달하여 전달값 반환
	// => 전달값이 존재하지 않을 경우 null 반환(GET 방식에서 QueryString의 이름에 대한 전달값이 없는 경우 NullString 반환)
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	String sex=request.getParameter("sex");
	String job=request.getParameter("job");
	//String hobby=request.getParameter("hobby");
	//request.getParameterValues(String name) : 동일한 이름으로 전달된 값이 여러개인 경우
	//모든 전달값을 얻어와 문자열 배열로 반환하는 메소드
	String[] hobby=request.getParameterValues("hobby");
	String profile=request.getParameter("profile");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>회원정보확인</h1>
	<hr>
	<ul>
		<li>아이디 = <%=id %></li>
		<li>비밀번호 = <%=pass %></li>
		<li>이름 = <%=name %></li>
		<li>주소 = <%=addr %></li>
		<li>성별 = <%=sex %></li>
		<li>직업 = <%=job %></li>
		<%-- <li>취미 = <%=hobby %></li> --%>
		<% if(hobby==null) { %>
			<li>취미 = 선택한 취미가 하나도 없습니다.</li>
		<% } else { %>
			<li>취미 = 
			<% for(String temp:hobby) { %>
				<%=temp %>&nbsp;
			<% } %>
			</li>
		<% } %>
		<%-- 엔터(Enter - \n)를 <br> 태그로 변환하여 출력 --%>
		<li>자기소개<br><%=profile.replace("\n", "<br>") %></li>
	</ul>
</body>
</html>