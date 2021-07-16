<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%> --%>
<%-- [web.xml] 파일에서 모든 웹프로그램에 대한 요청에러(4XX)와 응답에러(5XX)에 대한 
에러페이지 설정  - 클라이언트의 요청 URL 주소 미변경 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	//String text="ABCDEFG";
	String text=null;
	
	//int su=10/0;//ArithmeticException 발생
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>page Directive - errorPage 속성</h1>
	<hr>
	<p>JSP 문서 실행시 예외가 발생된 경우 클라이언트에게 에러코드(500) 대신 에러 메세지를
	전달하기 위한 JSP 문서를 설정하기 위한 속성 - 클라이언트의 요청 URL 주소 미변경</p>
	<hr> 
	<p>문자열의 문자갯수 = <%=text.length() %></p>
</body>
</html>