<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>스크립팅 요소(Scripting Element)</h1>
	<hr>
	<p>1.스크립틀릿(Scriptlet) : Java 명령을 작성하는 영역(_jspService() 메소드의 명령)
	- &lt;% Java Statement; Java Statement; ... %&gt;</p>
	<p>2.선언문(Declaration) : 필드 또는 메소드를 선언하는 영역(서블릿 클래스의 선언문)
	- &lt;%! 필드 또는 메소드 선언 %&gt;</p>
	<p>3.표현식(Expression) : Java에서 사용하는 값을 출력하는 영역(_jspService() 메소드의 명령)
	- &lt;%={변수명|연산식|메소드 호출} %&gt;</p>
</body>
</html>