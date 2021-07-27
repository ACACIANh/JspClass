<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보 변경 또는 회원 탈퇴를 위해 비밀번호를 입력하는 JSP 문서 --%>
<%-- => 비로그인 사용자가 JSP 문서를 요청한 경우 비정상적인 요청으로 에러페이지 이동 --%>
<%@include file="/site/security/login_check.jspf" %>
<%
	if(request.getParameter("action")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400'");
		out.println("</script>");
		return;		
	}

	//전달값을 반환받아 저장
	String action=request.getParameter("action");

	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
%>
<form name="passwdForm" method="post">
<% if(action.equals("modify")) { %>
	<p>회원정보 변경을 위한 비밀번호를 입력해 주세요.</p>
<% } else if(action.equals("remove")) { %>
	<p>회원 탈퇴를 위한 비밀번호를 입력해 주세요.</p>
<% } %>
	<p>
		<input type="password" name="passwd">
		<button type="button" onclick="submitCheck();">입력완료</button>
	</p>
	<p id="message" style="color: red;"><%=message %></p>	
</form>

<script type="text/javascript">
	passwdForm.passwd.focus();
	
	function submitCheck() {
		if(passwdForm.passwd.value=="") {
			document.getElementById("message").innerHTML="비밀번호를 입력해 주세요.";
			passwdForm.passwd.focus();
			return;
		}
	
		<% if(action.equals("modify")) { %>
			passwdForm.action="<%=request.getContextPath()%>/site/index.jsp?workgroup=member&work=member_modify";
		<% } else if(action.equals("remove")) { %>
			passwdForm.action="<%=request.getContextPath()%>/site/index.jsp?workgroup=member&work=member_remove_action";
		<% } %>
		
		passwdForm.submit();
	}
</script>






