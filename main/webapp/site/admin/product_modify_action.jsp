<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="java.io.File"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품정보를 전달받아 PRODUCT 테이블에 저장된 제품정보를 변경하고 제품정보 상세 출력페이지
(product_detail.jsp)로 이동하는 JSP 문서 - 제품번호 전달 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%@include file="/site/security/admin_check.jspf" %>
<%
	//비정상적인 요청에 대한 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달된 파일(제품이미지)을 저장하기 위한 서버 디렉토리의 시스템 경로를 반환받아 저장
	String saveDirectory=request.getServletContext().getRealPath("/site/product_image");
	
	//cos 라이브러리의 MultipartRequest 클래스로 인스턴스 생성
	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//전달값을 반환받아 저장
	int productNum=Integer.parseInt(multipartRequest.getParameter("productNum"));	
	String currentMainImage=multipartRequest.getParameter("currentMainImage");
	String productCode=multipartRequest.getParameter("category")
		+"_"+multipartRequest.getParameter("productCode");
	String productName=multipartRequest.getParameter("productName");
	String mainImage=multipartRequest.getFilesystemName("mainImage");
	String productDetail=multipartRequest.getParameter("productDetail");
	int productQty=Integer.parseInt(multipartRequest.getParameter("productQty"));	
	int productPrice=Integer.parseInt(multipartRequest.getParameter("productPrice"));
	
	//DTO 인스턴스 생성 및 전달값으로 필드값 변경
	ProductDTO product=new ProductDTO();
	product.setProductNum(productNum);
	product.setProductCode(productCode);
	product.setProductName(productName);
	if(mainImage!=null) {//제품이미지를 변경할 경우
		product.setMainImage(mainImage);
		//기존 제품이미지 파일 삭제
		new File(saveDirectory, currentMainImage).delete();
	} else {//제품이미지를 변경하지 않을 경우
		product.setMainImage(currentMainImage);
	}
	product.setProductDetail(productDetail);
	product.setProductQty(productQty);
	product.setProductPrice(productPrice);
	
	//제품정보를 전달받아 PRODUCT 테이블에 저장된 제품정보를 변경하는 DAO 클래스의 메소드 호출
	ProductDAO.getDAO().updateProduct(product);
	
	//제품정보 상세 출력페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=admin&work=product_detail&productNum="+productNum+"';");
	out.println("</script>");	
%>








