<%@page import="xyz.itwill.dao.StudentDAO"%>
<%@page import="xyz.itwill.dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력페이지(updateFormStudent.jsp)에서 전달된 학생정보를 반환받아 STUDENT 테이블에
저장된 학생정보를 변경하고 학생정보 검색 출력페이지(displayStudent.jsp)로 이동하는 JSP 문서 --%>
<%
	//비정상적인 요청에 대한 처리
	if(request.getMethod().equals("GET")) {//JSP 문서를 GET 방식으로 요청한 경우
		session.setAttribute("message", "비정상적인 방법으로 페이지를 요청 하였습니다.");
		response.sendRedirect("displayStudent.jsp");
		return;
	}	

	//POST 방식으로 요청하여 전달된 값에 대한 캐릭터셋 변경
	request.setCharacterEncoding("utf-8");
	
	//전달값을 반환받아 저장
	int no=Integer.parseInt(request.getParameter("no"));
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String birthday=request.getParameter("birthday");
	
	//DTO 인스턴스를 생성하고 전달값으로 필드값 변경
	StudentDTO student=new StudentDTO();
	student.setNo(no);
	student.setName(name);
	student.setPhone(phone);
	student.setAddress(address);
	student.setBirthday(birthday);
	
	//STUDENT 테이블에 저장된 학생정보를 변경하는 DAO 클래스의 메소드 호출
	StudentDAO.getDAO().updateStudent(student);
	
	//학생정보 검색 출력페이지(displayStudent.jsp)로 이동
	response.sendRedirect("displayStudent.jsp");
%>    
