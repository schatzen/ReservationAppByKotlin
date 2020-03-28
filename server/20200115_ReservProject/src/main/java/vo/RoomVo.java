package vo;

public class RoomVo {

	int room_idx;
	String room_name;
	String room_pwd;
	String room_branch;

	public RoomVo() {
		// TODO Auto-generated constructor stub
	}
	
	public RoomVo(String room_name) {
		super();
		this.room_name = room_name;
	}
	
	
	public RoomVo(String room_name, String room_pwd, String room_branch) {
		super();
		this.room_name = room_name;
		this.room_pwd = room_pwd;
		this.room_branch = room_branch;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_pwd() {
		return room_pwd;
	}

	public void setRoom_pwd(String room_pwd) {
		this.room_pwd = room_pwd;
	}

	public String getRoom_branch_idx() {
		return room_branch;
	}

	public void setRoom_branch_idx(String room_branch_idx) {
		this.room_branch = room_branch_idx;
	}

	public String getRoom_branch() {
		return room_branch;
	}

	public void setRoom_branch(String room_branch) {
		this.room_branch = room_branch;
	}
	
	



}
