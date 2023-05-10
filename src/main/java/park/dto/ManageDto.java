package park.dto;

import java.sql.Timestamp;

public class ManageDto {
	String id;
	String regdate;
	Timestamp pw_change_date;
	Timestamp last_accessed_time;
	int status;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public Timestamp getPw_change_date() {
		return pw_change_date;
	}
	public void setPw_change_date(Timestamp pw_change_date) {
		this.pw_change_date = pw_change_date;
	}
	public Timestamp getLast_accessed_time() {
		return last_accessed_time;
	}
	public void setLast_accessed_time(Timestamp last_accessed_time) {
		this.last_accessed_time = last_accessed_time;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
