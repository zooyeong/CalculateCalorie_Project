package choi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import choi.dto.BoardDto;
import choi.oracle.DBConnectionManager;

public class BoardDao {
	
	//select
	public List<BoardDto> boardInfoList(String userId){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BoardDto> boardInfoList = null;
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "select *"
					+ " from board WHERE user_id = ?";
			

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);

			rs = psmt.executeQuery(); 
			
			boardInfoList = new ArrayList<BoardDto>();
			while(rs.next()) {
			    BoardDto boardDto = new BoardDto();
			    
			    boardDto.setUser_id(rs.getString("user_id"));
			    boardDto.setPost_no(rs.getInt("post_no"));
			    boardDto.setTitle(rs.getString("title"));
			    boardDto.setContent_text(rs.getString("content_text"));
			    boardDto.setContent_img(rs.getString("content_img"));
			    boardDto.setCreated_date(rs.getDate("created_date"));
			    boardDto.setUpdated_date(rs.getDate("updated_date"));
			    boardDto.setViews(rs.getInt("views"));
			    boardDto.setTotal_like(rs.getInt("total_like"));
			    boardDto.setCount_like(rs.getInt("Count_like"));
			    
			    boardInfoList.add(boardDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return boardInfoList;		
	}
	
	
	public BoardDto board_Read(int post_no, String useriD) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		BoardDto boardDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select *"
					+ " from board WHERE post_no = ? and user_id = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, post_no);
			psmt.setString(2, useriD);

			rs = psmt.executeQuery();

			if(rs.next()) {
				boardDto = new BoardDto();
				
				boardDto.setUser_id(rs.getString("user_id"));
			    boardDto.setPost_no(rs.getInt("post_no"));
			    boardDto.setTitle(rs.getString("title"));
			    boardDto.setContent_text(rs.getString("content_text"));
			    boardDto.setContent_img(rs.getString("content_img"));
			    boardDto.setCreated_date(rs.getDate("created_date"));
			    boardDto.setUpdated_date(rs.getDate("updated_date"));
			    boardDto.setViews(rs.getInt("views"));
			    boardDto.setTotal_like(rs.getInt("total_like"));
			    boardDto.setCount_like(rs.getInt("Count_like"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return boardDto;
	}
	
	public BoardDto viewsUp(int post_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		BoardDto boardDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "UPDATE board"
					+ " SET views = views + 1" 
					+ " WHERE post_no = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, post_no);

			rs = psmt.executeQuery();

			if(rs.next()) {
				boardDto = new BoardDto();
				
				boardDto.setUser_id(rs.getString("user_id"));
			    boardDto.setPost_no(rs.getInt("post_no"));
			    boardDto.setTitle(rs.getString("title"));
			    boardDto.setContent_text(rs.getString("content_text"));
			    boardDto.setContent_img(rs.getString("content_img"));
			    boardDto.setCreated_date(rs.getDate("created_date"));
			    boardDto.setUpdated_date(rs.getDate("updated_date"));
			    boardDto.setViews(rs.getInt("views"));
			    boardDto.setTotal_like(rs.getInt("total_like"));
			    boardDto.setCount_like(rs.getInt("Count_like"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return boardDto;
	}
	
	public BoardDto likeUp(int post_no) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		BoardDto boardDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "UPDATE board"
					+ " SET total_like = total_like + 1" 
					+ " WHERE post_no = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, post_no);

			rs = psmt.executeQuery();

			if(rs.next()) {
				boardDto = new BoardDto();
				
				boardDto.setUser_id(rs.getString("user_id"));
			    boardDto.setPost_no(rs.getInt("post_no"));
			    boardDto.setTitle(rs.getString("title"));
			    boardDto.setContent_text(rs.getString("content_text"));
			    boardDto.setContent_img(rs.getString("content_img"));
			    boardDto.setCreated_date(rs.getDate("created_date"));
			    boardDto.setUpdated_date(rs.getDate("updated_date"));
			    boardDto.setViews(rs.getInt("views"));
			    boardDto.setTotal_like(rs.getInt("total_like"));
			    boardDto.setCount_like(rs.getInt("Count_like"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);			
		}
		
		return boardDto;
	}
	
	//글 쓰기
	public int insertBoard(String userId, String title, String content_text, String content_img) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "insert into board (user_id, post_no, title, content_text, content_img, views, total_like) "
			           + "values (?, (select COALESCE(max(post_no), 0) + 1 from board where user_id = ?), ?, ?, ?, 0, 0)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, userId);
			psmt.setString(3, title);
			psmt.setString(4, content_text);
			psmt.setString(5, content_img);
			
			result = psmt.executeUpdate();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int updateBoard(String userId, int post, String title, String content_text, String content_img) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			// 쿼리문!
			String sql = "update board set user_id = ?, post_no = ?, title = ?, content_text = ?, content_img = ? where post_no = ? and user_id = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setInt(2, post);
			psmt.setString(3, title);
			psmt.setString(4, content_text);
			psmt.setString(5, content_img);
			psmt.setInt(6, post);
			psmt.setString(7, userId);
			
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