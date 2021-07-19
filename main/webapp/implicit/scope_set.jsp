<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 내장객체에 인스턴스를 속성값으로 저장(변경)할 경우 setAttribute() 메소드 호출 --%>
<%-- => 속성명(문자열 - 식별자)과 속성값(인스턴스)을 전달하여 내장객체에 저장(변경) --%>   
<%
	pageContext.setAttribute("pageName", "홍길동");//page Scope
	request.setAttribute("requestName", "임꺽정");//request Scope
	session.setAttribute("sessionName", "전우치");//session Scope
	application.setAttribute("applicationName", "일지매");//application Scope
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>내장객체의 속성값 사용범위</h1>
	<hr>
	<%-- 내장객체에 속성값으로 저장된 인스턴스를 반환받을 경우 getAttribute() 메소드 호출 --%>
	<%-- => 속성명을 전달하여 내장객체에 저장된 해당 속성값(인스턴스) 반환 --%>
	<%-- => 내장객체에 속성명으로 저장된 속성값이 없는 경우 null 반환 --%>
	<%-- => 속성값은 Object 타입으로 반환되므로 명시적 객체 형변환 후 사용 --%>
	<%
		String pageName=(String)pageContext.getAttribute("pageName");
		String requestName=(String)request.getAttribute("requestName");
		String sessionName=(String)session.getAttribute("sessionName");
		String applicationName=(String)application.getAttribute("applicationName");
	%>
	<ul>
		<li>pageName = <%=pageName %></li>
		<li>requestName = <%=requestName %></li>
		<li>sessionName = <%=sessionName %></li>
		<li>applicationName = <%=applicationName %></li>
	</ul>	
</body>
</html>










