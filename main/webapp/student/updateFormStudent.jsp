<%@page import="xyz.itwill.dao.StudentDAO"%>
<%@page import="xyz.itwill.dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 학생번호를 전달받아 STUDENT 테이블에 저장된 해당 학생번호의 학생정보를 검색하여
입력태그의 초기값으로 설정하고 변경값을 입력하는 JSP 문서  --%>
<%-- => [학생변경]을 클릭한 경우 학생정보 변경 처리페이지(updateStudent.jsp)로 이동 - 입력값(학생정보) 전달 --%>
<%-- => [학생목록]을 클릭한 경우 학생정보 검색 출력페이지(displayStudent.jsp)로 이동 --%>
<%
	//비정상적인 요청에 대한 처리
	if(request.getParameter("no")==null) {//전달값(학생번호)이 없는 경우
		session.setAttribute("message", "비정상적인 방법으로 페이지를 요청 하였습니다.");
		response.sendRedirect("displayStudent.jsp");//출력페이지 이동
		return;
	}

	//전달값을 반환받아 저장
	int no=Integer.parseInt(request.getParameter("no"));

	//학생번호를 전달받아 STUDENT 테이블에 저장된 학생정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	StudentDTO student=StudentDAO.getDAO().selectNoStudent(no);
	
	//비정상적인 요청에 대한 처리
	if(student==null) {//검색된 학생정보가 없는 경우
		session.setAttribute("message", "비정상적인 방법으로 페이지를 요청 하였습니다.");
		response.sendRedirect("displayStudent.jsp");//출력페이지 이동
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생정보 변경폼</title>   
</head>
<body>
	<h1 align="center">학생정보 변경</h1>
	<hr>
	<%-- 식별자(학생번호)는 사용자로부터 변경값을 입력받지 않고 처리 페이지에 전달 --%>
	<%-- => 식별자는 출력하고 hidden 타입의 입력태그를 이용하여 식별자 전달 --%>
	<%-- => 입력태그에 식별자를 초기값으로 설정하고 readonly 태그속성 사용 --%>
	<form name="studentForm">
	<input type="hidden" name="no" value="<%=student.getNo() %>">
	<table align="center" border="1" cellpadding="1" cellspacing="0" width="300">
		<tr height="40">
			<th bgcolor="yellow" width="100">학생번호</th>
			<td width="200" align="center">
				<%=student.getNo() %>
				<%-- <input type="text" name="no" value="<%=student.getNo()%>" readonly="readonly"> --%>
			</td>
		</tr>
		<tr height="40">
			<th bgcolor="yellow" width="100">이름</th>
			<td width="200" align="center">
				<input type="text" name="name" value="<%=student.getName()%>">
			</td>
		</tr>
		<tr height="40">
			<th bgcolor="yellow" width="100">전화번호</th>
			<td width="200" align="center">
				<input type="text" name="phone" value="<%=student.getPhone()%>">
			</td>
		</tr>
		<tr height="40">
			<th bgcolor="yellow" width="100">주소</th>
			<td width="200" align="center">
				<input type="text" name="address" value="<%=student.getAddress()%>">
			</td>
		</tr>
		<tr height="40">
			<th bgcolor="yellow" width="100">생년월일</th>
			<td width="200" align="center">
				<input type="text" name="birthday" value="<%=student.getBirthday().substring(0, 10)%>">
			</td>
		</tr>
		<tr height="40">
			<td width="200" colspan="2" align="center">
				<input type="button" value="학생변경" onclick="submitCheck();">
				<input type="reset" value="초기화">
				<input type="button" value="학생목록" onclick="location.href='displayStudent.jsp';">
			</td>
		</tr>
	</table>
	</form>
	<script type="text/javascript">
	studentForm.num.focus();
	
	function submitCheck() {
		if(studentForm.name.value=="") {
			alert("이름을 입력해 주세요.");
			studentForm.name.focus();
			return;
		}

		if(studentForm.phone.value=="") {
			alert("전화번호을 입력해 주세요.");
			studentForm.phone.focus();
			return;
		}

		var phoneReg=/(01[016789])-\d{3,4}-\d{4}/g;
		if(!phoneReg.test(studentForm.phone.value)) {
			alert("전화번호를 형식에 맞게 입력해주세요.");
			studentForm.phone.focus();
			return;
		}
		
		if(studentForm.address.value=="") {
			alert("주소를 입력해 주세요.");
			studentForm.address.focus();
			return;
		}

		if(studentForm.birthday.value=="") {
			alert("생년월일을 입력해 주세요.");
			studentForm.birthday.focus();
			return;
		}
		
		var birthdayReg=/(18|19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])/g;
		if(!birthdayReg.test(studentForm.birthday.value)) {
			alert("생년월일을 형식에 맞게 입력해주세요.");
			studentForm.birthday.focus();
			return;
		}

		studentForm.method="POST";
		studentForm.action="updateStudent.jsp";
		studentForm.submit();
	} 
	</script>
</body>
</html>