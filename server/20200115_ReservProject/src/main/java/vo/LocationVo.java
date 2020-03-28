package vo;

public class LocationVo {

	int loc_idx;
	String loc_name;
	String loc_pwd;

	public LocationVo() {
		// TODO Auto-generated constructor stub
	}

	public LocationVo(String loc_name, String loc_pwd) {
		super();
		this.loc_name = loc_name;
		this.loc_pwd = loc_pwd;
	}

	public int getLoc_idx() {
		return loc_idx;
	}

	public void setLoc_idx(int loc_idx) {
		this.loc_idx = loc_idx;
	}

	public String getLoc_name() {
		return loc_name;
	}

	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}

	public String getLoc_pwd() {
		return loc_pwd;
	}

	public void setLoc_pwd(String loc_pwd) {
		this.loc_pwd = loc_pwd;
	}

}
