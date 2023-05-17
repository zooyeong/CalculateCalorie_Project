package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import database.CalDto;
import database.TodayDto;
import park.oracle.DBConnectionManager;

public class CalDao {
	//select(식품명으로 정보 가져오기)
	public CalDto selectCalInfoByName(String name){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		CalDto calDto = null;
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "select *"
					+" from calorie_data2"
					+" where 식품명 = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, name); 
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {

				calDto = new CalDto();
				
				calDto.setNo(rs.getInt("no"));
				calDto.setCode(rs.getString("식품코드"));
				calDto.setName(rs.getString("식품명"));
				calDto.setAmount(rs.getInt("제공량"));
				calDto.setProtein(rs.getInt("단백질"));
				calDto.setFat(rs.getInt("지방"));
				calDto.setCarbohydrate(rs.getInt("탄수화물"));
				calDto.setCalorie(rs.getInt("칼로리"));

				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return calDto;
	}
	
	//select(식품명 특정 문자열로 정보 가져오기)
	public List<CalDto> selectCalInfoBySpecName(String name){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<CalDto> calDtoList = null;
		
		try {
			conn = DBConnectionManager.getConnection();
			
			String sql = "select *"
					+" from calorie_data2"
					+" where 식품명 like ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "%"+name+"%"); 
			
			rs = psmt.executeQuery();
			
			calDtoList = new ArrayList<CalDto>();
			while(rs.next()) {

				CalDto calDto = new CalDto();
				
				calDto.setNo(rs.getInt("no"));
				calDto.setCode(rs.getString("식품코드"));
				calDto.setName(rs.getString("식품명"));
				calDto.setAmount(rs.getInt("제공량"));
				calDto.setProtein(rs.getInt("단백질"));
				calDto.setFat(rs.getInt("지방"));
				calDto.setCarbohydrate(rs.getInt("탄수화물"));
				calDto.setCalorie(rs.getInt("칼로리"));

				calDtoList.add(calDto);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return calDtoList;
	}
	
	//select(오늘날짜로 조회하기)
	public List<TodayDto> selectCalInfoBySysdate(String id){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<TodayDto> todayDtoList = null;
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
		String formatedNow = now.format(formatter);
			
		try {
			conn = DBConnectionManager.getConnection();
					
			String sql = "select *"
					+" from today"
					+" where to_char(update_date, 'YY/MM/DD') = ? and id = ?";
					
			psmt = conn.prepareStatement(sql);
					
			psmt.setString(1, formatedNow); 
			psmt.setString(2, id); 
				
			rs = psmt.executeQuery();
					
			todayDtoList = new ArrayList<TodayDto>();
			while(rs.next()) {
	
				TodayDto todayDto = new TodayDto();
					
				todayDto.setId(rs.getString("id"));
				todayDto.setCode(rs.getString("code"));
				todayDto.setCarbohydrate(rs.getInt("carbohydrate"));
				todayDto.setProtein(rs.getInt("protein"));
				todayDto.setFat(rs.getInt("fat"));
				todayDto.setCalorie(rs.getInt("calorie"));
				todayDto.setUpdate_date(rs.getString("update_date"));
				todayDto.setEat_amount(rs.getInt("eat_amount"));
						
				todayDtoList.add(todayDto);
						
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
				
		return todayDtoList;
	}
	
	//insert(아침 등록)
	public int insertToday(String id, String code, double carbohydrate,
			double protein, double fat, double calorie, double eat_amount) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "insert into today (id, code, carbohydrate, protein, fat, calorie, eat_amount) "
					+ " values (?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			psmt.setString(2, code); 
			psmt.setDouble(3, carbohydrate); 
			psmt.setDouble(4, protein); 
			psmt.setDouble(5, fat); 
			psmt.setDouble(6, calorie); 
			psmt.setDouble(7, eat_amount); 
                                                               
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}

	
	//insert(아침 등록)
		public int deleteToday() {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				conn = DBConnectionManager.getConnection();

				//쿼리문!
				String sql = "delete FROM today";
						

				psmt = conn.prepareStatement(sql);
				
			
	                                                               
				result = psmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			
			return result;
		}
	
	/*
	//delete (삭제 기능)
	public int Delete(String id, String code, double carbohydrate,
			double protein, double fat, double calorie, double eat_amount) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "insert into today (id, code, carbohydrate, protein, fat, calorie, eat_amount) "
					+ " values (?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			psmt.setString(2, code); 
			psmt.setDouble(3, carbohydrate); 
			psmt.setDouble(4, protein); 
			psmt.setDouble(5, fat); 
			psmt.setDouble(6, calorie); 
			psmt.setDouble(7, eat_amount); 
                                                               
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	*/
	
	/*
	//delete(삭제버튼) 
	public int delete(String id, String code, double carbohydrate,
			double protein, double fat, double calorie, double eat_amount) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBConnectionManager.getConnection();

			//쿼리문!
			String sql = "insert into delete (id, code, carbohydrate, protein, fat, calorie, eat_amount) "
					+ " values (?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id); 
			psmt.setString(2, code); 
			psmt.setDouble(3, carbohydrate); 
			psmt.setDouble(4, protein); 
			psmt.setDouble(5, fat); 
			psmt.setDouble(6, calorie); 
			psmt.setDouble(7, eat_amount); 
                                                               
			result = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.close(rs, psmt, conn);
		}
		
		return result;
	}
	
	*/
	
	
	
	/*
	//insert(점심 등록)
		public int insertLunch(String id, String code, double carbohydrate,
				double protein, double fat, double calorie, double eat_amount) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				conn = DBConnectionManager.getConnection();

				//쿼리문!
				String sql = "insert into today (id, code, carbohydrate, protein, fat, calorie, eat_amount) "
						+ " values (?,?,?,?,?,?,?)";

				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, id); 
				psmt.setString(2, code); 
				psmt.setDouble(3, carbohydrate); 
				psmt.setDouble(4, protein); 
				psmt.setDouble(5, fat); 
				psmt.setDouble(6, calorie); 
				psmt.setDouble(7, eat_amount); 

				result = psmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			
			return result;
		}
		
		//insert(저녁 등록)
		public int insertDinner(String id, String code, double carbohydrate,
				double protein, double fat, double calorie, double eat_amount) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				conn = DBConnectionManager.getConnection();

				//쿼리문!
				String sql = "insert into today (id, code, carbohydrate, protein, fat, calorie, eat_amount) "
						+ " values (?,?,?,?,?,?,?)";

				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, id); 
				psmt.setString(2, code); 
				psmt.setDouble(3, carbohydrate); 
				psmt.setDouble(4, protein); 
				psmt.setDouble(5, fat); 
				psmt.setDouble(6, calorie); 
				psmt.setDouble(7, eat_amount); 

				result = psmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			
			return result;
		}
		
		//insert(간식 등록)
		public int insertsnack(String id, String code, double carbohydrate,
				double protein, double fat, double calorie, double eat_amount) {

			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				conn = DBConnectionManager.getConnection();

				//쿼리문!
				String sql = "insert into today (id, code, carbohydrate, protein, fat, calorie, eat_amount) "
						+ " values (?,?,?,?,?,?,?)";

				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, id); 
				psmt.setString(2, code); 
				psmt.setDouble(3, carbohydrate); 
				psmt.setDouble(4, protein); 
				psmt.setDouble(5, fat); 
				psmt.setDouble(6, calorie); 
				psmt.setDouble(7, eat_amount); 

				result = psmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBConnectionManager.close(rs, psmt, conn);
			}
			
			return result;
		}
		*/
	}
