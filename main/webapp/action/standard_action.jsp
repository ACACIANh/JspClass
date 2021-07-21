<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>표준 액션 태그(Standard Action Tag)</h1>
	<hr>
	<p>Java 명령으로 구현해야 되는 기능을 JSP에서 제공하는 태그로 구현
	- 표준 액션 태그는 [jsp] 네임스페이스를 이용하여 사용</p>
	<hr>
	<p>1.include 태그 : 현재 JSP 문서에서 다른 JSP 문서로 스레드를 이동하여 실행된 명령의
	결과(HTML)를 제공받아 현재 JSP 문서에 포함하는 태그</p>
	<p>2.forward 태그 : 현재 JSP 문서에서 다른 JSP 문서로 스레드를 이동하여 실행된 명령의
	결과(HTML)를 클라이언트에게 전달(응답)하는 태그</p>   
	<p>3.param 태그 : 현재 JSP 문서에서 다른 JSP 문서로 스레드를 이동할 경우 값(문자열-String)을
	전달하기 위한 태그 - include 태그 또는 forward 태그의 자식태그로 사용</p>
	<p>4.useBean 태그 : JSP 문서에서 인스턴스를 생성하여 내장객체의 속성값으로 저장하거나
	내장객체에 저장된 속성값(인스턴스)을 반환받아 사용하는 태그</p>
	<p>5.setProperty 태그 : useBean 태그에 의해 제공된 인스턴스의 필드값을 변경하는 태그
	(Setter 메소드 호출) - useBean 태그의 종속 태그</p>
	<p>6.getProperty 태그 : useBean 태그에 의해 제공된 인스턴스의 필드값을 반환하는 태그
	(Getter 메소드 호출) - useBean 태그의 종속 태그</p>
</body>
</html>









