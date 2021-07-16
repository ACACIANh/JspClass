<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 선언문 : 서블릿 클래스에 선언되는 필드 또는 메소드 --%>    
<%! 
	//서블릿 클래스에 선언되는 필드
	// => JSP 문서가 변경되거나 WAS 프로그램이 종료되면 필드는 서블릿 인스턴스와 같이 소멸
	int count=0; 
%>    
    
<%-- 스크립틀릿 : _jspService() 메소드(요청에 대한 처리와 응답문서 생성)에 작성되는 명령 --%>    
<%
	//_jspService() 메소드에서 선언된 지역변수
	// => 메소드가 종료되면 지역변수 자동 소멸
	//int count=0;
	count++;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>스크립팅 요소(Scripting Element)</h1>
	<hr>	
	<%-- <p>JSP 문서의 요청 횟수 = <% out.println(count); %></p> --%>
	<%-- 표현식 : 표현식 안의 값을 문자열로 변환하여 클라이언트에게 전달(출력) --%>
	<p>JSP 문서의 요청 횟수 = <%=count%></p>
</body>
</html>