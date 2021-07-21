<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 요청에 대한 처리 기능을 제공하는 JSP 문서 --%>    
<%
	//전달값을 반환받아 저장
	String category=request.getParameter("category");

	if(category==null) {
		//리다이렉트 이동 : 클라이언트에게 URL 주소를 전달하여 웹프로그램을 요청해 응답
		//받아 출력되도록 구현 - 클라이언트 브라우저의 URL 주소 변경
		response.sendRedirect("forward_main.jsp");
		return;
	}
	
	//전달값을 이용하여 JSP 문서의 경로를 생성하여 저장
	String forwardFilePath=category+".jsp";
%>    
<%-- forward 태그 : 현재 JSP 문서에서 page 속성값으로 설정된 JSP 문서로 스레드를 이동하여
클라이언트에게 응답되도록 구현 - 포워드 이동 --%>
<%-- 포워드 이동 : 요청 JSP 문서에서 응답 JSP 문서로 스레드 이동 --%>
<%-- => 클라이언트와 상관없이 서버의 웹프로그램에서 이동 - 클라이언트 브라우저의 URL 주소 미변경 --%>
<%-- 형식) <jsp:forward page="JSP"></jsp:forward> --%>
<%-- => page 속성값으로 표현식 사용이 가능하며 태그내용이 없는 경우 시작태그에 종료태그를 같이 구현 --%>
<jsp:forward page="<%=forwardFilePath %>"/>








