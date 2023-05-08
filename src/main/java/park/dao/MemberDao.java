package park.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import park.oracle.DBConnectionManager;
import park.dto.MemberDto;

public class MemberDao {
	//insert
	public int insertMemberInfo(String id, String password, String passwordcheck,
								String name, String birth, String gender,
								String email, String phone) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "insert into member_info "
					+ " values (?,?,?,?,TO_DATE(?, 'YYYY-MM-DD'),?,?,?)";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			psmt.setString(2, password); 
			psmt.setString(3, passwordcheck); 
			psmt.setString(4, name); 
			psmt.setString(5, birth); 
			psmt.setString(6, gender); 
			psmt.setString(7, email); 
			psmt.setString(8, phone); 

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//select
	public MemberDto selectPersonInfoListById(String id){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDto memberDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "select *"
					+" from member_info"
					+" where id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {

				memberDto = new MemberDto();
				
				//차이 이해하기
//				memberDto.setId("id");
//				memberDto.id = rs.getString("id");
				memberDto.setId(rs.getString("id"));
				memberDto.setPassword(rs.getString("password"));
				memberDto.setName(rs.getString("name"));
				memberDto.setBirth(rs.getString("birth"));
				memberDto.setGender(rs.getString("gender"));
				memberDto.setEmail(rs.getString("email"));
				memberDto.setPhone(rs.getString("phone"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return memberDto;
	}

	public boolean loginCheck(String id){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "select *"
					+" from member_info"
					+" where id = ? ";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {

				result = true;
				
			} 
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
}
