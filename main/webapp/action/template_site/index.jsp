<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 클라이언트의 모든 요청에 대한 응답 결과를 제공하기 위한 JSP 문서 - 템플릿 페이지 --%>
<%-- => Content 영역은 템플릿 페이지(index.jsp) 요청시 전달되는 값에 따라 다른 JSP 문서의
실행 결과를 동적으로 포함하여 응답 --%>    
<%
	//템플릿 페이지 요청시 전달된 값을 반환받아 저장
	String group=request.getParameter("group");
	if(group==null) {
		group="main";
	}

	String work=request.getParameter("work");
	if(work==null) {
		work="print";
	}
	
	//전달값을 이용하여 Content 영역에 포함될 JSP 문서의 경로를 생성하여 저장
	String contentFilePath=group+"/"+work+".jsp";
	//System.out.println("contentFilePath = "+contentFilePath);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
div {
	margin: 5px;
	padding: 5px;
}

#header {
	height: 200px;
	border: 1px solid red;
}

#header h1 {
	text-align: center;
}

#menu {
	font-size: 1.5em;
	text-align: right;
}

a, a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	color: orange;
}

#content {
	min-height: 500px;
	border: 1px solid green;
	text-align: center;
}

#footer {
	height: 150px;
	border: 1px solid blue;
	text-align: center;
	font-size: 1.2em;
}
</style>
</head>
<body>
	<%-- Header 영역 --%>
	<div id="header">
		<h1><a href="index.jsp?group=main&work=print">쇼핑몰</a></h1>
		<div id="menu">
			<a href="index.jsp?group=product&work=new">신상제품</a>&nbsp;&nbsp;
			<a href="index.jsp?group=product&work=best">추천제품</a>&nbsp;&nbsp;
			<a href="index.jsp?group=product&work=sale">할인제품</a>&nbsp;&nbsp;
			<a href="index.jsp?group=board&work=list">게시판</a>&nbsp;&nbsp;
		</div>
	</div>
	
	<%-- Content 영역 - 전달값에 의해 생성된 JSP 문서로 스레드를 이동하여 실행 결과를 동적으로 포함 --%>
	<%-- => 스레드가 이동될 JSP 문서가 없는 경우 ServletException 예외 발생(500) --%>
	<div id="content">
		<jsp:include page="<%=contentFilePath %>"/>
	</div>

	<%-- Footer 영역 --%>
	<div id="footer">
		<div>
			<a href="index.jsp?group=main&work=terms">이용약관</a>&nbsp;&nbsp;&nbsp;
			<a href="index.jsp?group=main&work=private">개인정보</a>&nbsp;&nbsp;&nbsp;
			<a href="index.jsp?group=main&work=center">고객센터</a>&nbsp;&nbsp;&nbsp;
			<p>Copyright © itwill Corp. All rights reserved.</p>
		</div>	
	</div>
</body>
</html>