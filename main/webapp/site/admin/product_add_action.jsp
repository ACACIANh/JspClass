<%@page import="xyz.itwill.dao.ProductDAO"%>
<%@page import="xyz.itwill.dto.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품정보를 전달받아 PRODUCT 테이블에 삽입하여 저장하고 제품목록 출력페이지
(product_manager.jsp)로 이동하는 JSP 문서 --%>
<%-- => 로그인 상태의 관리자만 접근 가능하도록 설정 --%>
<%-- => 멀티파트 폼데이타로 전달된 값을 처리하기 위해 [cos.jar] 파일을 프로젝트의 라이브러리로 빌드 처리 --%>
<%-- => 전달받은 파일(제품이미지)은 서버 디렉토리에 저장(업로드)하고 PRODUCT 테이블에는 업로드 파일명을 저장 --%>
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
	// => WorkSpace 디렉토리가 아닌 WebApps 디렉토리의 시스템 경로 반환
	String saveDirectory=request.getServletContext().getRealPath("/site/product_image");
	
	//cos 라이브러리의 MultipartRequest 클래스로 인스턴스 생성
	// => MultipartRequest 클래스 : 멀티파트 폼데이타로 전달된 값을 처리하기 위한 클래스
	// => MultipartRequest 인스턴스를 생성하면 모든 전달파일을 서버 디렉토리에 자동으로 업로드 처리하여 저장
	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//전달값과 업로드 파일명을 반환받아 저장
	String productCode=multipartRequest.getParameter("category")
		+"_"+multipartRequest.getParameter("productCode");
	String productName=multipartRequest.getParameter("productName");
	String mainImage=multipartRequest.getFilesystemName("mainImage");
	String productDetail=multipartRequest.getParameter("productDetail");
	int productQty=Integer.parseInt(multipartRequest.getParameter("productQty"));	
	int productPrice=Integer.parseInt(multipartRequest.getParameter("productPrice"));
	
	//DTO 인스턴스 생성 및 전달값으로 필드값 변경
	ProductDTO product=new ProductDTO();
	product.setProductCode(productCode);
	product.setProductName(productName);
	product.setMainImage(mainImage);
	product.setProductDetail(productDetail);
	product.setProductQty(productQty);
	product.setProductPrice(productPrice);
	
	//제품정보를 전달받아 PRODUCT 테이블에 제품정보를 삽입하여 저장하는 DAO 클래스의 메소드 호출
	ProductDAO.getDAO().insertProduct(product);
	
	//제품목록 출력페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=admin&work=product_manager';");
	out.println("</script>");
%>
















