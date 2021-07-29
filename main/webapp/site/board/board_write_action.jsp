<%@page import="xyz.itwill.dto.BoardDTO"%>
<%@page import="xyz.itwill.dao.BoardDAO"%>
<%@page import="xyz.itwill.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글(새글 또는 답글)을 전달받아 BOARD 테이블에 저장하고 게시글 목록 출력페이지
(board_list.jsp)로 이동하는 JSP 문서 --%>
<%-- => 로그인 사용자에게만 글쓰기 권한 제공 --%>
<%-- => 비로그인 사용자가 JSP 문서를 요청한 경우 에러페이지로 이동 --%>
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
	int ref=Integer.parseInt(request.getParameter("ref"));
	int reStep=Integer.parseInt(request.getParameter("reStep"));
	int reLevel=Integer.parseInt(request.getParameter("reLevel"));
	String pageNum=request.getParameter("pageNum");
	//전달값에서 태그 관련 기호를 회피(Escape)문자로 변환하여 저장 - XSS 공격에 대한 방법
	String subject=Utility.escapeTag(request.getParameter("subject"));
	int status=0;//전달값이 없는 경우 : 일반글 - 0(초기값)
	if(request.getParameter("secret")!=null) {//전달값이 있는 경우 : 비밀글 - 1 
		status=Integer.parseInt(request.getParameter("secret"));
	}
	String content=Utility.escapeTag(request.getParameter("content"));
	
	//BOARD_SEQ 시퀀스 객체의 다음값을 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => 새글 또는 답글의 글번호(num 컬럼값)로 저장
	int num=BoardDAO.getDAO().selectNextNum();
	
	//클라이언트의 IP 주소를 반환받아 저장
	//request.getRemoteAddr() : JSP 문서를 요청한 클라이언트의 IP 주소를 반환하는 메소드
	// => 이클립스에 의해 동작되는 WAS는 IPv6의 128Bit 형식에 IP 주소 제공
	//IPv4의 32Bit 형식의 IP 주소를 제공받을 수 있도록 이클립스 환경 설정
	// => Run >> Run Configurations... >> Apache Tomcat >> 사용중인 Apache Tomcat 선택
	//    >> Arguements >> VM Arguments >> [-Djava.net.preferIPv4Stack=true] 추가 
	String ip=request.getRemoteAddr();
	//System.out.println("ip = "+ip);
	
	//새글과 답글을 구분하여 BOARD 테이블의 컬럼값으로 저장될 변경값을 변경
	if(ref==0) {//새글 - ref, reStep, reLevel 변수에 초기값(0)이 저장  
		//새글은 REF 컬럼에 자동 증가값을 저장 - NUM 컬럼에 저장되는 값과 동일
		// => RE_STEP 컬럼과 RE_LEVEL 컬럼에는 [0]을 저장
		ref=num;
	} else {//답글 - ref, reStep, reLevel 변수에 부모글의 전달값이 저장
		//부모글의 전달값(ref,reStep,reLevel 변수값)을 이용하여 기존 게시글의 정보 변경하는 
		//DAO 클래스의 메소드 호출
		// => BOARD 테이블에 저장된 게시글 중 부모글에서 전달된 ref 변수값과 REF 컬럼값이 
		//    같고 부모글에서 전달된 reStep 변수값보다 RE_STEP 컬럼값이 큰 게시글의 RE_STEP 
		//    컬럼값을 1 증가되도록 변경
		// => 동일한 깊이의 기존 답글보다 위에 출력되도록 그룹의 게시글 검색순서를 변경
		BoardDAO.getDAO().updateReStep(ref, reStep);
		
		//답글은 RE_STEP 컬럼과 RE_LEVEL 컬럼에는 부모들의 전달값이 저장된 reStep 변수와
		//reLevel 변수에 저장된 값보다 1 증가된 값 저장
		// => 답글의 REF 컬럼값은 부모글의  전달값이 저장된 ref 변수값과 동일한 값 저장
		reStep++;
		reLevel++;
	}
	
	//DTO 인스턴스를 생성하고 필드값 변경
	BoardDTO board=new BoardDTO();
	board.setNum(num);//자동 증가값
	board.setId(loginMember.getId());//로그인 사용자 아이디
	board.setWriter(loginMember.getName());//로그인 사용자 이름
	board.setSubject(subject);//사용자 입력 전달값(제목)
	board.setRef(ref);//새글 : 자동 증가값, 답글 : 부모글 전달값
	board.setReStep(reStep);//새글 : 0, 답글 : 부모글 전달값+1
	board.setReLevel(reLevel);//새글 : 0, 답글 : 부모글 전달값+1
	board.setContent(content);//사용자 입력 전달값(내용)
	board.setIp(ip);//클라이언트 IP 주소
	board.setStatus(status);//사용자 입력 전달값(상태 : 일반글 또는 비밀글)
	
	//게시글을 전달받아 BOARD 테이블에 저장하는 DAO 클래스의 메소드 호출
	
	
	//페이지 이동
	
%> 










