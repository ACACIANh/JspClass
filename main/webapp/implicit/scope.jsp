<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>인스턴스 사용범위</h1>
	<hr>
	<p>사용범위(Scope) : WAS에 의해 관리되는 JSP 문서의 내장객체를 이용하여 인스턴스를
	속성값으로 저장하여 사용할 수 있는 범위 - 내장객체에 따라 속성값으로 저장된 인스턴스의
	사용범위가 다르게 설정</p>
	<hr>
	<ul>
		<li>page Scope : pageContext 내장객체를 이용하여 인스턴스를 속성값으로 저장
		- 인스턴스를 속성값으로 저장한 JSP 문서에서만 속성값을 반환받아 사용</li> 
		<li>request Scope : request 내장객체를 이용하여 인스턴스를 속성값으로 저장
		- 인스턴스를 속성값으로 저장한 JSP 문서와 스레드가 이동된 JSP 문서에서 속성값을 반환받아 사용</li>
		<li>session Scope : session 내장객체를 이용하여 인스턴스를 속성값으로 저장
		- 컨텍스트에 존재하는 JSP 문서에서 속성값을 반환받아 사용(바인딩된 세션 사용)</li>
		<li>application Scope : application 내장객체를 이용하여 인스턴스를 속성값으로 저장
		- 컨텍스트에 존재하는 JSP 문서에서 속성값을 반환받아 사용(컨텍스트 사용)</li>
	</ul>
	<hr>
	<ul>
		<li>내장객체에 인스턴스를 속성값으로 저장(변경)하는 메소드
		- 내장객체.setAttribute(String attributeName, Object attributeValue)</li>
		<li>내장객체에 속성값으로 저장된 인스턴스를 반환하는 메소드
		- 내장객체.getAttribute(String attributeName)</li>
		<li>내장객체에 속성값으로 저장된 인스턴스를 제거하는 메소드
		- 내장객체.removeAttribute(String attributeName)</li>	
	</ul>
</body>
</html>









