<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%-- header 영역 : 로고, 메뉴 등 --%>
	<%@include file="header.jspf" %>
	
	<%-- content 영역 : 요청에 대한 응답 결과를 제공 --%>
	<div id="content">
		<h2>주문내역 페이지</h2>
	</div>
	
	<%-- footer 영역 : 저작권, 약관, 개인정보 보호정책 등 --%>
	<%@include file="footer.jspf" %>
</body>
</html>



