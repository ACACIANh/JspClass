<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>지시어(Directive)</h1>
	<hr>
	<p>1.page Directive : JSP 문서(웹프로그램)에 필요한 정보를 제공하도록 지시
	- &lt;%@page contentType="mimeType" pageEncoding="encoding" ... %&gt;</p>
	<p>2.include Directive : JSP 문서에 외부 파일의 코드를 포함하도록 지시
	- &lt;%@include file="URL"%&gt;</p>
	<p>3.taglib Directive : JSP 문서에 태그 라이브러리 파일의 Java 태그를 포함하도록 지시
	- &lt;%@taglib prefix="namespace" uri="tldId"%&gt;</p>
</body>
</html>