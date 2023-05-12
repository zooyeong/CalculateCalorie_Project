package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.testdto;
import database.DBConnection;

public class testdao {
	
	//select
	public List<testdto> selecttestdaofoList(){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<testdto> testdaInfoList = null;
		
		//Select 리스트 전체
		try {
			conn = DBConnection.getConnection();

			// 쿼리문!
			//String sql = "select * from emp where empno = 7566";
			String sql = "select * from calorie_data2"
					+" WHERE 식품명 = ?";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery(); //쿼리를 실행!!
			psmt.setString(1, "식품명");
		
			testdaInfoList = new ArrayList<testdto>();
			
			while(rs.next()) {
				testdto personDto = new testdto();
				
				personDto.setNO(rs.getInt("NO"));
				personDto.set식품코드(rs.getString("식품코드"));
				personDto.set식품명(rs.getString("식품명"));
				personDto.set제공량(rs.getInt("제공량"));
				personDto.set단백질(rs.getInt("단백질"));
				personDto.set지방(rs.getInt("지방"));
				personDto.set탄수화물(rs.getInt("탄수화물"));
				personDto.setCALORIE(rs.getInt("CALORIE"));
				
				testdaInfoList.add(personDto);
			}

			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, psmt, conn);			
		}
		
		return testdaInfoList;		
	}
	
	public testdto selectPersonInfoById(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		testdto personDto = null;
		
		//select 한개 단일
		try {
			conn = DBConnection.getConnection();

			// 쿼리문!
			String sql = "select * from calorie_DATA2"
						+" WHERE 식품명 = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery(); //쿼리를 실행!!

			if(rs.next()) {
				personDto = new testdto();
				
				personDto.setNO(rs.getInt("NO"));
				personDto.set식품코드(rs.getString("식품코드"));
				personDto.set식품명(rs.getString("식품명"));
				personDto.set제공량(rs.getInt("제공량"));
				personDto.set단백질(rs.getInt("단백질"));
				personDto.set지방(rs.getInt("지방"));
				personDto.set탄수화물(rs.getInt("탄수화물"));
				personDto.setCALORIE(rs.getInt("CALORIE"));
			}

			// DB에 쿼리문 실행
			// 쿼리 결과를 반환 -> 활용
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, psmt, conn);			
		}
		
		return personDto;
	}
	
	//update
	public int updatePersonInfo(int id, String name) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnection.getConnection();

			// 쿼리문!
			String sql = "update t_person_info"
						+" SET name = ?"
						+" WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setInt(2, id);
			
			result = psmt.executeUpdate();
			
			System.out.println("처리결과:" + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//insert
	public int insertPersonInfo(String name) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnection.getConnection();

			// 쿼리문!
			String sql = "insert into t_person_info"
						+" values( (select NVL(MAX(id),0)+1 FROM t_person_info)  , ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			
			result = psmt.executeUpdate();
			
			System.out.println("처리결과:" + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	//delete
	public int deletePersonInfo(int id) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = DBConnection.getConnection();

			// 쿼리문!
			String sql = "DELETE FROM t_person_info"
						+" WHERE id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			
			result = psmt.executeUpdate();
			
			System.out.println("처리결과:" + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(rs, psmt, conn);
		}
		
		return result;
	}
}
