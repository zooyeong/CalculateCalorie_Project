package choi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import choi.dto.BoardDto;
import choi.dto.LikeDto;
import choi.oracle.DBConnectionManager;

public class LikeDao {
	
	public LikeDto canlike(String sentuser_id, int post_no, String senduser_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		LikeDto likeDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "INSERT INTO possiblelike (sentuser_id, post_no, senduser_id, like_have)"
					+ " VALUES ( ?, ?, ?, 1)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sentuser_id);
			psmt.setInt(2, post_no);
			psmt.setString(3, senduser_id);


			rs = psmt.executeQuery();

			if(rs.next()) {
				likeDto = new LikeDto();
				
				likeDto.setSentuser_id(rs.getString("sentuser_id"));
				likeDto.setPost_no(rs.getInt("post_no"));
				likeDto.setSenduser_id(rs.getString("senduser_id"));
				likeDto.setLike_have(rs.getInt("like_have"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return likeDto;
	}
	
	public LikeDto openLike(String sentuser_id, int post_no, String senduser_id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		LikeDto likeDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select *"
					+ " from possiblelike"
					+ " where sentuser_id = ? and post_no = ? and senduser_id = ?";

			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sentuser_id);
			psmt.setInt(2, post_no);
			psmt.setString(3, senduser_id);

			rs = psmt.executeQuery();

			if(rs.next()) {
				likeDto = new LikeDto();
				
				likeDto.setSentuser_id(rs.getString("sentuser_id"));
				likeDto.setPost_no(rs.getInt("post_no"));
				likeDto.setSenduser_id(rs.getString("senduser_id"));
				likeDto.setLike_have(rs.getInt("like_have"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return likeDto;
	}
	
	
	
}