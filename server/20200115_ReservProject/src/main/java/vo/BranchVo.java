package vo;

public class BranchVo {
	
	int branch_idx;
	String branch_name;
	String  branch_main_pwd;
	String  branch_1_floor_pwd;
	
	public BranchVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public BranchVo(int branch_idx, String branch_name) {
		super();
		this.branch_idx = branch_idx;
		this.branch_name = branch_name;
	}
	

	public BranchVo(int branch_idx, String branch_name, String branch_main_pwd) {
		super();
		this.branch_idx = branch_idx;
		this.branch_name = branch_name;
		this.branch_main_pwd = branch_main_pwd;
	}
	

	public BranchVo( String branch_name, String branch_1_floor_pwd,int branch_idx) {
		super();
		this.branch_name = branch_name;
		this.branch_1_floor_pwd = branch_1_floor_pwd;
		this.branch_idx = branch_idx;
	}



	public int getBranch_idx() {
		return branch_idx;
	}
	public void setBranch_idx(int branch_idx) {
		this.branch_idx = branch_idx;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_main_pwd() {
		return branch_main_pwd;
	}
	public void setBranch_main_pwd(String branch_main_pwd) {
		this.branch_main_pwd = branch_main_pwd;
	}
	public String getBranch_1_floor_pwd() {
		return branch_1_floor_pwd;
	}
	public void setBranch_1_floor_pwd(String branch_1_floor_pwd) {
		this.branch_1_floor_pwd = branch_1_floor_pwd;
	}
	
	
}
