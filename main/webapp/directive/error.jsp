<%-- page 디렉티브에서 isErrorPage 속성을 [true]로 설정하면 예외 관련 정보가 저장된  
exception 내장객체를 JSP 문서에 제공--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>에러페이지</h1>
	<hr>
	<p>요청하신 프로그램에서 예기치 못한 오류가 발생 되었습니다.
	빠른 시일내로 조치 하겠습니다.</p>
	<%-- <p>예외메세지 = <%=exception.getMessage() %></p> --%>
</body>
</html>