<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Java 명령 작성
	Date now=new Date();
	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	String displayNow=dateFormat.format(now);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
#display {
	width: 600px;
	margin: 0 auto;
	padding: 30px;
	font-size: 2em;
	font-weight: bold;
	text-align: center;
	border: 2px solid black;
}
</style>
</head>
<body>
	<h1>Hello, JSP!!!</h1>
	<hr>
	<!-- HTML 주석문 : 클라이언트 전달 - 소스보기 가능(웹디자이너) -->
	<%-- JSP 주석문 : 클라이언트 미전달 - 소스보기 불가능(웹프로그래머) --%>
	<p>JSP(Java Server Page) : 서블릿 보다 쉽게 웹프로그램을 작성하기 위한 기술
	- 스크립팅 요소(Scripting Element),지시어(Directive), 표준 액션 태그(Standard Action Tag)</p>
	<hr>
	<p id="display"><%=displayNow %></p>
	
	<script type="text/javascript">
	setInterval(function() {
		location.reload();
	}, 1000);
	</script>
</body>
</html>