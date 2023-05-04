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
	public List<BoardDto> boardInfoList(){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BoardDto> boardInfoList = null;
		
		try {
			conn = DBConnectionManager.getConnection();

			String sql = "select *"
					+ " from board";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery(); 
			
			boardInfoList = new ArrayList<BoardDto>();
			while(rs.next()) {
			    BoardDto boardDto = new BoardDto();
			    
			    boardDto.setUser_id(rs.getInt("user_id"));
			    boardDto.setPost_no(rs.getInt("post_no"));
			    boardDto.setTitle(rs.getString("title"));
			    boardDto.setContent(rs.getString("content"));
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
}