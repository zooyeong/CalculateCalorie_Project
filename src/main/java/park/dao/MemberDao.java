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
	public int selectPersonInfoListByIdPw(String id, String pw){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int check = -1; //아이디 없음
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "select id, password"
					+" from member_info"
					+" where id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				if(rs.getString("password").equals(pw)) {
					check = 1; //아이디 비밀번호 일치
				} else {
					check = 0; //비밀번호 불일치
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return check;
	}	
}
