<%@page import="xyz.itwill.dao.BoardDAO"%>
<%@page import="xyz.itwill.dto.BoardDTO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 변경 게시글을 전달받아 BOARD 테이블에 저장된 게시글을 변경하고 게시글 상세 출력페이지
(board_datail)로 이동하는 JSP 문서 --%>
<%-- => 비로그인 사용자이거나 게시글 작성자 또는 관리자가 아닌 경우 JSP 문서 요청시 에러페이지 이동 --%>
<%@include file="/site/security/login_check.jspf" %>      
<%
	//비정상적인 요청에 대한 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400'");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	String subject=Utility.escapeTag(request.getParameter("subject"));
	int status=0;//전달값이 없는 경우 : 일반글 - 0(초기값)
	if(request.getParameter("secret")!=null) {//전달값이 있는 경우 : 비밀글 - 1 
		status=Integer.parseInt(request.getParameter("secret"));
	}
	String content=Utility.escapeTag(request.getParameter("content"));
	
	//DTO 인스턴스를 생성하고 필드값 변경
	BoardDTO board=new BoardDTO();
	board.setNum(num);
	board.setSubject(subject);
	board.setContent(content);
	board.setStatus(status);
	
	//게시글을 전달받아 BOARD 테이블에 저장된 게시글을 변경하는 DAO 클래스의 메소드 호출
	BoardDAO.getDAO().updateBoard(board);
	
	//게시글 상세 출력페이지 이동 - 페이지 번호와 검색 관련 정보 전달
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()
		+"/site/index.jsp?workgroup=board&work=board_detail&num="+num
		+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");
%> 