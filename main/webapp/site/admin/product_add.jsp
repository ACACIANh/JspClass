<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품정보를 입력받기 위한 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%-- => [제품등록]을 클릭한 경우 제품정보 등록 처리페이지(product_add_action.jsp)로 이동 - 입력값(제품정보) 전달 --%>
<%@include file="/site/security/admin_check.jspf" %>
<style type="text/css">
#product {
	width: 800px;
	margin: 0 auto;
}

table {
	margin: 0 auto;
}

td {
	text-align: left;
}
</style>

<div id="product">
	<h2>제품등록</h2>
	
	<%-- 파일을 입력받아 전달하기 위해 method 속성값을 [post]로 설정하고 enctype 속성값을
	[multipart/form-data]로 설정 --%>
	<form action="<%=request.getContextPath()%>/site/index.jsp?workgroup=admin&work=product_add_action"
		method="post" enctype="multipart/form-data" id="productForm">
		<table>
			<tr>
				<td>제품코드</td>
				<td>
					<select name="category">
						<option value="CPU" selected="selected">중앙처리장치(CPU)</option>
						<option value="MAINBOARD">메인보드(MAINBOARD)</option>
						<option value="MEMORY">메모리(MEMORY)</option>
					</select>
					<input type="text" name="productCode" id="productCode">
				</td>
			</tr>
			<tr>
				<td>제품명</td>
				<td>
					<input type="text" name="productName" id="productName" maxlength="20">
				</td>
			</tr>
			<tr>
				<td>제품이미지</td>
				<td>
					<input type="file" name="mainImage" id="mainImage">
				</td>
			</tr>
			<tr>
				<td>제품상세설명</td>
				<td>
					<textarea rows="7" cols="60" name="productDetail" id="productDetail"></textarea>
				</td>
			</tr>
			<tr>
				<td>제품수량</td>
				<td>
					<input type="text" name="productQty" id="productQty">
				</td>
			</tr>
			<tr>
				<td>제품가격</td>
				<td>
					<input type="text" name="productPrice" id="productPrice">
				</td>
			</tr>
			<tr>
				<td colspan="2"><button type="submit">제품등록</button></td>
			</tr>
		</table>	
	</form>
	
	<div id="message" style="color: red;"></div>
</div>

<script type="text/javascript">
$("#productForm").submit(function() {
	if($("#productCode").val()=="") {
		$("#message").text("제품코드를 입력해 주세요.");
		$("#productCode").focus();
		return false;
	}
	
	if($("#productCode").val()=="") {
		$("#message").text("제품코드를 입력해 주세요.");
		$("#productCode").focus();
		return false;
	}
	
	if($("#productName").val()=="") {
		$("#message").text("제품명을 입력해 주세요.");
		$("#productName").focus();
		return false;
	}
	
	if($("#mainImage").val()=="") {
		$("#message").text("제품이미지를 입력해 주세요.");
		$("#mainImage").focus();
		return false;
	}
	
	if($("#productDetail").val()=="") {
		$("#message").text("제품상세설명을 입력해 주세요.");
		$("#productDetail").focus();
		return false;
	}
	
	if($("#productQty").val()=="") {
		$("#message").text("제품수량을 입력해 주세요.");
		$("#productQty").focus();
		return false;
	}
	
	if($("#productPrice").val()=="") {
		$("#message").text("제품가격을 입력해 주세요.");
		$("#productPrice").focus();
		return false;
	}
	
});

</script>






















