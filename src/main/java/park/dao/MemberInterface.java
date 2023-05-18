package park.dao;

import park.dto.ManageDto;
import park.dto.MemberDto;

public interface MemberInterface {
	public int insertMemberInfo(String id, String password, String passwordcheck,
			String name, String birth, String gender,
			String email, String phone);
	public int insertJoinDate(String id);
	public int insertAgreeCheck(String id, String f0001, String f0002, String f0003);
	public MemberDto selectMemberInfoById(String id);
	public boolean loginCheck(String id);
	public boolean pwCheck(String id, String pw);
	public ManageDto selectManageInfo(String id);
	public MemberDto selectId(String name, String phone);
	public MemberDto selectPw(String id, String name, String phone);
	public int updatePassword(String id, String pw);
	public int updateAccessedDate(String id, String date);
	public int updateDate(String id, String date);
	public int updateStatus1(String id);
	public int updateStatus2(String id);
	public int updateStatus3(String id);
}
