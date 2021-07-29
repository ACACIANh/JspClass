<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="xyz.itwill.dto.MemberDTO"%>
<%@page import="xyz.itwill.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="xyz.itwill.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- BOARD 테이블에 저장된 게시글을 검색하여 게시글 목록을 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 게시글 목록을 다수의 페이지로 구분하여 출력 - 페이징 처리(SQL 명령)  --%>
<%-- => 페이지 번호를 다수의 블럭으로 구분하여 출력 - 페이징 처리(알고리즘) --%>
<%
	//JSP 문서를 요청할 때 전달된 페이지 번호를 반환받아 저장
	// => 페이지 번호 전달값이 없는 경우 첫번째 페이지의 게시글 목록 검색
	int pageNum=1;
	if(request.getParameter("pageNum")!=null) {//전달값이 있는 경우
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정
	int pageSize=10;
	
	//BOARD 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 DAO 클래스의 메소드 호출
	int totalBoard=BoardDAO.getDAO().selectBoardCount();
	
	//전체 페이지의 갯수를 계산하여 저장
	//int totalPage=totalBoard/pageSize+(totalBoard%pageSize==0?0:1);
	int totalPage=(int)Math.ceil((double)totalBoard/pageSize);
	
	//JSP 문서를 요청할 때 전달된 페이지 번호에 대한 검증
	if(pageNum<=0 || pageNum>totalPage) {//전달된 페이지 번호가 비정상적인 경우
		pageNum=1;
	}
	
	//요청 페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
	//ex) 1Page : 1, 2Page : 11, 3Page : 21, 4Page : 31,...
	int startRow=(pageNum-1)*pageSize+1;

	//요청 페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
	//ex) 1Page : 10, 2Page : 20, 3Page : 30, 4Page : 40,...
	int endRow=pageNum*pageSize;
	
	//마지막 페이지에 대한 게시글 종료 행번호를 전체 게시글의 갯수로 변경
	if(endRow>totalBoard) {
		endRow=totalBoard;
	}
	
	//게시글 시작 행번호와 게시글 종료 행번호를 전달받아 BOARD 테이블에 저장된 게시글에서
	//시작행부터 종료행의 범위의 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	List<BoardDTO> boardList=BoardDAO.getDAO().selectBoardList(startRow, endRow);
	
	//페이지에 출력될 게시글에 대한 글번호 시작값을 계산하여 저장
    //ex)검색 게시글의 총갯수 : 100 >> 1Page : 100~91, 2Page : 90~81, 3Page : 80~71, 4Page : 70~61, ....
	int number=totalBoard-(pageNum-1)*pageSize;
    
    //세션에 저장된 권한 관련 정보(회원정보)를 반환받아 저장
    // => 로그인 사용자에게만 글쓰기 권한 부여
    // => 게시글이 비밀글인 경우 게시글 작성자 또는 관리자에게만 게시글 상세보기 권한 부여
    MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
    
    //시스템의 현재 날짜를 반환받아 저장
    // => 게시글 작성일을 현재 날짜와 비교하여 출력
    String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<style type="text/css">
#board_list {
	width: 1000px;
	margin: 0 auto;
	text-align: center;
}

#board_title {
	font-size: 1.2em;
	font-weight: bold;
}

#btn {
	text-align: right;
}

table {
	margin: 5px auto;
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	border: 1px solid black;
	background: black;
	color: white;
}

td {
	border: 1px solid black;
	text-align: center;
}

.subject {
	text-align: left;
	padding: 5px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#board_list a:hover {
	text-decoration: none;
	color: blue;
}

.secret, .remove {
	background: black;
	color: white;
	font-size: 14px;
	border: 1px solid black;
	border-radius: 4px;
}
</style>

<div id="board_list">
	<div id="board_title">게시글 목록(게시글 갯수 : <%=totalBoard %>)</div>
	
	<% if(loginMember!=null) {//로그인 사용자인 경우 %>
	<div id="btn">
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/site/index.jsp?workgroup=board&work=board_write';">
			글쓰기
		</button>
	</div>
	<% } %>
	
	<table>
		<tr>
			<th width="100">번호</th>
			<th width="500">제목</th>
			<th width="100">작성자</th>
			<th width="100">조회수</th>
			<th width="200">작성일</th>
		</tr>
		
		<% if(totalBoard==0) { %>
		<tr>
			<td colspan="5">검색된 게시글이 하나도 없습니다.</td>
		</tr>
		<% } else { %>
			<%-- 게시글 목록에서 게시글을 하나씩 제공받아 반복 출력 --%>
			<% for(BoardDTO board:boardList) {  %>
			<tr>
				<%-- 글번호 : BOARD 테이블에 저장된 글번호가 아닌 계산된 글번호 출력 --%>
				<td><%=number %></td>
				
				<%-- 제목 --%>
				<td class="subject"><%=board.getSubject() %></td>
				
				<%-- 작성자 --%>
				<td><%=board.getWriter() %></td>
				
				<%-- 조회수 --%>
				<td><%=board.getReadcount() %></td>
				
				<%-- 작성일 : 오늘 작성된 게시글은 시간만 출력하고 과거에 작성된 게시글은 날짜와 시간 출력 --%>
				<td>
				<% if(currentDate.equals(board.getRegDate().substring(0, 10))) {//날짜가 같은 경우 %>
					<%=board.getRegDate().substring(11) %> <%-- 시간만 출력 --%>
				<% } else { %>
					<%=board.getRegDate() %> <%-- 날짜와 시간 출력 --%>
				<% } %>	
				</td>
			</tr>
			
			<%-- 출력될 글번호 1씩 감소 --%>
			<% number--; %>
			<%} %>
		<% } %>
	</table>
</div>














