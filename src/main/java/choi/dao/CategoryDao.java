package choi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import choi.oracle.DBConnectionManager;
import choi.dto.BoardDto;
import choi.dto.CategoryDto;

public class CategoryDao {

	public int category_Update2(String category2, String userId2) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!

			String sql = "update category" + " SET category2 = ?" + " where user_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, category2);
			psmt.setString(2, userId2);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	public int category_Update3(String category3, String userId2) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!

			String sql = "update category" + " SET category3 = ?" + " where user_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, category3);
			psmt.setString(2, userId2);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	public int category_Update4(String category4, String userId2) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!

			String sql = "update category" + " SET category4 = ?" + " where user_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, category4);
			psmt.setString(2, userId2);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	public int category_Update5(String category5, String userId2) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!

			String sql = "update category" + " SET category5 = ?" + " where user_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, category5);
			psmt.setString(2, userId2);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}

	
	
	public int category_default_Insert(String userId2) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!

			String sql = "INSERT INTO category (user_id, category2, category3, category4, category5) " 
	                + "SELECT ?, 'haha', 'haha', 'haha', 'haha' " 
	                + "FROM dual " 
	                + "WHERE NOT EXISTS (SELECT 1 FROM category WHERE user_id = ?)";

			psmt = conn.prepareStatement(sql);

			CategoryDto categoryDto = new CategoryDto();
			psmt.setString(1, userId2);
			psmt.setString(2, userId2);
			
			result = psmt.executeUpdate();

			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	
	
	
	
	
	
	
	
	
	
	public List<CategoryDto> categoryList(String userId2) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<CategoryDto> categoryList = null;

		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select category2, category3, category4, category5" 
					+ " from category"
					+ " where user_id = ?";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userId2);

			rs = psmt.executeQuery();

			categoryList = new ArrayList<CategoryDto>();
			while (rs.next()) {
				CategoryDto categoryDto = new CategoryDto();
				
				categoryDto.setCategory2(rs.getString("category2"));
				categoryDto.setCategory3(rs.getString("category3"));
				categoryDto.setCategory4(rs.getString("category4"));
				categoryDto.setCategory5(rs.getString("category5"));

				categoryList.add(categoryDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return categoryList;
	}
	
	
	public int reset_Category(String userId2) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!

			String sql = "delete category" 
						+ " where user_id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, userId2);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}

		return result;
	}
	
	
	
}