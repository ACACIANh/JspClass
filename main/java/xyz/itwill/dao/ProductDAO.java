package xyz.itwill.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import xyz.itwill.dto.ProductDTO;

public class ProductDAO extends JdbcDAO {
	private static ProductDAO _dao;
	
	private ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new ProductDAO();
	}
	
	public static ProductDAO getDAO() {
		return _dao;
	}
	
	//카테고리를 전달받아 PRODUCT 테이블에 저장된 해당 카테고리의 제품정보를 검색하여 반환하는 메소드
	public List<ProductDTO> selectCategoryProductList(String category) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ProductDTO> productList=new ArrayList<ProductDTO>();
		try {
			con=getConnection();
			
			if(category.equals("ALL")) {//모든 제품정보 검색
				String sql="select * from product order by product_code";
				pstmt=con.prepareStatement(sql);
			} else {//카테고리의 제품정보 검색
				String sql="select * from product where product_code like ?||'%' order by product_code";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, category);
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setProductNum(rs.getInt("product_num"));
				product.setProductCode(rs.getString("product_code"));
				product.setProductName(rs.getString("product_name"));
				product.setMainImage(rs.getString("main_image"));
				product.setProductDetail(rs.getString("product_detail"));
				product.setProductQty(rs.getInt("product_qty"));
				product.setProductPrice(rs.getInt("product_price"));
				productList.add(product);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCategoryProductList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return productList;
	}
	
	//제품정보를 전달받아 PRODUCT 테이블에 삽입 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertProduct(ProductDTO product) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into product values(product_seq.nextval,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, product.getProductCode());
			pstmt.setString(2, product.getProductName());
			pstmt.setString(3, product.getMainImage());
			pstmt.setString(4, product.getProductDetail());
			pstmt.setInt(5, product.getProductQty());
			pstmt.setInt(6, product.getProductPrice());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertProduct() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}














