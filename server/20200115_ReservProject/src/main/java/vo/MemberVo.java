package vo;

public class MemberVo {
	
	int member_idx;
	String member_name;
	String member_id;
	String member_pwd;
	String member_tel;
	String member_comment;
	String member_grade;
	String member_regdate;
	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberVo(String member_name, String member_id, String member_pwd, String member_tel) {
		super();
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_tel = member_tel;
	}
	
	
	
	public MemberVo(String member_id, String member_pwd) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
	}

	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(String member_regdate) {
		this.member_regdate = member_regdate;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_comment() {
		return member_comment;
	}

	public void setMember_comment(String member_comment) {
		this.member_comment = member_comment;
	}
	
	
	
	
	
	

	
}
