package choi.dto;

public class LikeDto {
	
	String sentuser_id;
	int post_no;
	String senduser_id;
	int like_have;
	
	public String getSentuser_id() {
		return sentuser_id;
	}
	public void setSentuser_id(String sentuser_id) {
		this.sentuser_id = sentuser_id;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getSenduser_id() {
		return senduser_id;
	}
	public void setSenduser_id(String senduser_id) {
		this.senduser_id = senduser_id;
	}
	public int getLike_have() {
		return like_have;
	}
	public void setLike_have(int like_have) {
		this.like_have = like_have;
	}

}