<%@page import="xyz.itwill.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 학생번호를 전달받아 STUDENT 테이블에 저장된 해당 학생번호의 학생정보를 삭제하고
학생정보 검색 출력페이지(displayStudent.jsp)로 이동하는 JSP 문서 --%>    
<%
	//비정상적인 요청에 대한 처리
	if(request.getParameter("no")==null) {//전달값(학생번호)이 없는 경우
		session.setAttribute("message", "비정상적인 방법으로 페이지를 요청 하였습니다.");
		response.sendRedirect("displayStudent.jsp");//출력페이지 이동
		return;
	}

	//전달값을 반환받아 저장
	int no=Integer.parseInt(request.getParameter("no"));
	
	//학생번호를 전달하여 STUDENT 테이블에 저장된 해당 학생번호의 학생정보를 삭제하는 DAO 클래스의 메소드 호출
	int rows=StudentDAO.getDAO().deleteStudent(no);
	
	/*
	if(rows>0) {//삭제행이 있는 경우 - 정상적인 요청에 대한 처리
		response.sendRedirect("displayStudent.jsp");
	} else {//삭제행이 없는 경우 - 비정상적인 요청에 대한 처리
		session.setAttribute("message", "비정상적인 방법으로 페이지를 요청 하였습니다.");
		response.sendRedirect("displayStudent.jsp");	
	}
	*/
	
	if(rows<=0) {//삭제행이 없는 경우 - 비정상적인 요청에 대한 처리
		session.setAttribute("message", "비정상적인 방법으로 페이지를 요청 하였습니다.");
	}
	response.sendRedirect("displayStudent.jsp");	
%>





