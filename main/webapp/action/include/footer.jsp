<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//스레드가 이동된 JSP 문서(footer.jsp)는 요청 JSP 문서(include_main.jsp)의 request 
    	//내장객체와 response 내장객체를 전달받아 사용
    	// => 현재 JSP 문서의 내장객체가 아닌 다른 JSP 문서의 내장객체를 사용하므로 사용의 제한 발생
    	//request 내장객체를 이용한 리퀘스트 메세지의 헤드 정보 변경 불가능
    	// => 요청 JSP 문서에서 리퀘스트 메세지의 헤드 정보 변경
    	//response 내장객체를 이용한 에러코드 전달(sendError() 메소드) 기능 및 URL 주소 전달
    	//(sendRedirect() 메소드) 기능 사용 불가능 - 자바스크립트 이용
    
    	//request.setCharacterEncoding("utf-8");
 		String master=request.getParameter("master");
 		
 		if(master==null) {
 			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
 			return;
 		}
    %>
	<hr>
	<p>Copyright © itwill Corp. All rights reserved.</p>
	<%-- <p>관리자 : 홍길동(hong@itwill.xyz)</p> --%>
	<p>관리자 : <%=master %></p>