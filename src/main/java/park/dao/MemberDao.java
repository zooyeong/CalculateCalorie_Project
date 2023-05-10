package park.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import park.oracle.DBConnectionManager;
import park.dto.ManageDto;
import park.dto.MemberDto;

public class MemberDao {
	//insert(회원가입)
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
					+ " values (?,?,?,?,?,?,?,?)";

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
	
	//insert(회원가입 날짜)
	public int insertJoinDate(String id) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "insert into member_management (id)"
					+ " values (?)";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//select(id로 회원정보 가져오기)
	public MemberDto selectMemberInfoById(String id){
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
	
	//select(아이디 중복 조회)
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
	
	//select(비밀번호 일치 확인)
	public boolean pwCheck(String id, String pw){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "select password"
					+" from member_info"
					+" where id = ? and password = ? ";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			psmt.setString(2, pw); 
			
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
	
	//select(id로 manage info 가져오기)
	public ManageDto selectManageInfo(String id){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		ManageDto manageDto = new ManageDto();
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "select *"
					+" from member_management"
					+" where id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {

				manageDto.setId(rs.getString("id"));
				manageDto.setRegdate(rs.getString("regdate"));
				manageDto.setPw_change_date(rs.getTimestamp("pw_change_date"));
				manageDto.setLast_accessed_time(rs.getTimestamp("last_accessed_time"));
				manageDto.setStatus(rs.getInt("status"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return manageDto;
	}
	
	//update(비밀번호)
	public int updatePassword(String id, String pw) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "update member_info "
					+ " set password = ?,"
					+ "		passwordcheck = ?"
					+ " where id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, pw);
			psmt.setString(3, id);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//update(최근접속시간)
	public int updateAccessedDate(String id, String date) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "update member_management "
					+ " set last_accessed_time = ?"
					+ " where id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setTimestamp(1, java.sql.Timestamp.valueOf(date));
			psmt.setString(2, id);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//update(비밀번호 변경 시 Date update)
	public int updateDate(String id, String date) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "update member_management "
					+ " set pw_change_date = ?"
					+ " where id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setTimestamp(1, java.sql.Timestamp.valueOf(date));
			psmt.setString(2, id);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}

	//update(회원상태->탈퇴계정:3)
	public int updateStatus2(String id) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "update member_management"
					+ " set status = 2"
					+ " where id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//update(회원상태->탈퇴계정:3)
	public int updateStatus3(String id) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "update member_management"
					+ " set status = 3"
					+ " where id = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//delete(member)
//	public int deleteMemberInfo(String id) {
//
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//		try {
//			conn = DBConnectionManager.getConnection();
//
//			//쿼리문!
//			String sql = "delete from member_info "
//					+ " where id = ?";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, id); 
//
//			result = psmt.executeUpdate();
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			DBConnectionManager.close(rs, psmt, conn);
//		}
//		
//		return result;
//	}
	
	//delete(manage)
//	public int deleteManageInfo(String id) {
//
//		Connection conn = null;
//		PreparedStatement psmt = null;
//		ResultSet rs = null;
//		int result = 0;
//		try {
//			conn = DBConnectionManager.getConnection();
//
//			//쿼리문!
//			String sql = "delete from member_management "
//					+ " where id = ?";
//
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, id); 
//
//			result = psmt.executeUpdate();
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			DBConnectionManager.close(rs, psmt, conn);
//		}
//		
//		return result;
//	}
}
