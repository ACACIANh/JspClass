<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- taglib Directive를 이용하여 태그 라이브러리 파일(TLD 파일)을 불러와 포함 --%>    
<%-- prefix 속성 : 커스텀 태그를 사용하여 위한 네임스페이스(NameSpace)를 속성값으로 설정 --%>
<%-- uri 속성 : 태그 라이브러리 파일에 등록된 식별자(uri 엘리먼트의 태그내용)를 속성값으로 설정 - 자동 완성 --%>    
<%@taglib prefix="custom" uri="http://www.itwill.xyz/jsp/custom" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>taglib Directive</h1>
	<hr>
	<p>JSP 문서에 태그 라이브러리 파일(TLD)을 포함하여 커스텀 태그를 제공하는 지시어</p>
	<p>태그 라이브러리 파일 : 태그 클래스를 커스텀 태그로 등록하는 XML 파일</p>
	<hr>
	<%-- 태그 라이브러리 파일에 등록된 커스텀 태그 사용 --%>
	<custom:display/>
	<custom:display/>
	<custom:display/>
</body>
</html>