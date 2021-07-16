<%-- page Directive에서는 동일한 속성에 다른 속성값으로 중복 선언한 경우 500 에러 발생 --%>
<%-- => import 속성은 다른 속성값으로 여러번 선언 가능 --%>
<%-- <%@page import="java.util.List, java.util.ArrayList"%> --%>
<%-- page Directive의 import 속성은 이클립스에서 자동 완성 --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//java.util.List<java.lang.String> nameList=new java.util.ArrayList<java.lang.String>();
	List<String> nameList=new ArrayList<String>();
	
	nameList.add("홍길동");
	nameList.add("임꺽정");
	nameList.add("전우치");
	nameList.add("일지매");
	nameList.add("장길산");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>page Directive - import 속성</h1>
	<hr>
	<p>JSP 문서에서 사용될 클래스 또는 인터페이스를 패키지로 명확하게 표현하기 위한 속성</p>
	<hr>
	<ul>
	<% for(String name:nameList) { %>
		<li><%=name %></li>
	<% } %>
	</ul>
</body>
</html>