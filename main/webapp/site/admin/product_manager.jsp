<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 카테고리를 전달받아 PRODUCT 테이블에 저장된 해당 카테고리의 제품목록을 검색하여 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%-- => [카테고리]를 변경한 경우 제품목록 출력페이지(product_manager.jsp)로 이동 - 카테고리 전달 --%>
<%-- => [제품등록]을 클릭한 경우 제품정보 입력페이지(product_add.jsp)로 이동 --%>
<%@include file="/site/security/admin_check.jspf" %>
<%
	String category=request.getParameter("category");
	if(category==null) {//전달값이 없는 경우
		category="ALL";	
	}
	
	//카테고리를 전달받아 PRODUCT 테이블에 저장된 해당 카테고리의 제품정보를 검색하여
	//반환하는 DAO 클래스의 메소드 호출
	List<ProductDTO> productList=ProductDAO.getDAO().selectCategoryProductList(category);
%>
<style type="text/css">
#product {
	width: 800px;
	margin: 10px auto;
}

#btnDiv {
	text-align: right;
	margin-bottom: 5px;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	text-align: center;
	width: 200px;	
}

.pname { width: 400px; }

td a, td a:visited {
	text-decoration: none;
}

td a:hover {
	text-decoration: underline;
	color: blue;
}
</style>

<div id="product">
	<h2>제품목록</h2>
	
	<div id="btnDiv">
		<button type="button" id="addBtn">제품등록</button>
	</div>
	
	<table>
		<tr>
			<td>제품코드</td>
			<td class="pname">제품명</td>
			<td>제품수량</td>
			<td>제품가격</td>
		</tr>
		
		<% if(productList.isEmpty()) { %>
		<tr>
			<td colspan="4">등록된 제품이 하나도 없습니다.</td>
		</tr>
		<% } else { %>
			<% for(ProductDTO product:productList) { %>
			<tr>
				<td><%=product.getProductCode() %>
				<td><%=product.getProductName() %>
				<td><%=product.getProductQty() %>
				<td><%=product.getProductPrice() %>
			</tr>
			<% } %>
		<% } %>
	</table>
	<div>&nbsp;</div>
	
	<!-- action 속성이 생략된 경우 현재 요청 URL 주소의 웹문서 재요청 -->
	<form method="post" id="categoryForm">
		<select name="category" id="category">
			<option value="ALL" <% if(category.equals("ALL")) { %>selected="selected"<% } %>>전체</option>
			<option value="CPU" <% if(category.equals("CPU")) { %>selected="selected"<% } %>>중앙처리장치</option>
			<option value="MAINBOARD" <% if(category.equals("MAINBOARD")) { %>selected="selected"<% } %>>메인보드</option>
			<option value="MEMORY" <% if(category.equals("MEMORY")) { %>selected="selected"<% } %>>메모리</option>
		</select>
	</form>
	
	<script type="text/javascript">
	$("#addBtn").click(function() {
		location.href="<%=request.getContextPath()%>/site/index.jsp?workgroup=admin&work=product_add";
	});
	
	$("#category").change(function() {
		$("#categoryForm").submit();
	});
	</script>
</div>












