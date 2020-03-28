package vo;

public class ReservationVo {

	int reserv_idx;
	String reserv_branch;
	String reserv_room;
	String reserv_start;
	String reserv_end;
	String reserv_doc;
	String reserv_regdate;
	String reserv_state;
	int reserv_member_idx;

	public ReservationVo(String reserv_branch, String reserv_room, String reserv_start, String reserv_end, String reserv_doc,
			String reserv_state, int reserv_member_idx) {
		super();
		this.reserv_branch = reserv_branch;
		this.reserv_room = reserv_room;
		this.reserv_start = reserv_start;
		this.reserv_end = reserv_end;
		this.reserv_doc = reserv_doc;
		this.reserv_state = reserv_state;
		this.reserv_member_idx = reserv_member_idx;
	}
	
	

	public ReservationVo(String reserv_branch, String reserv_room, String reserv_start, String reserv_end,
			String reserv_regdate, String reserv_state) {
		super();
		this.reserv_branch = reserv_branch;
		this.reserv_room = reserv_room;
		this.reserv_start = reserv_start;
		this.reserv_end = reserv_end;
		this.reserv_regdate = reserv_regdate;
		this.reserv_state = reserv_state;
	}



	public ReservationVo() {
		// TODO Auto-generated constructor stub
	}

	public int getReserv_idx() {
		return reserv_idx;
	}

	public void setReserv_idx(int reserv_idx) {
		this.reserv_idx = reserv_idx;
	}

	public String getReserv_branch() {
		return reserv_branch;
	}

	public void setReserv_branch(String reserv_branch) {
		this.reserv_branch = reserv_branch;
	}

	public String getReserv_room() {
		return reserv_room;
	}

	public void setReserv_room(String reserv_room) {
		this.reserv_room = reserv_room;
	}

	public String getReserv_start() {
		return reserv_start;
	}

	public void setReserv_start(String reserv_start) {
		this.reserv_start = reserv_start;
	}

	public String getReserv_end() {
		return reserv_end;
	}

	public void setReserv_end(String reserv_end) {
		this.reserv_end = reserv_end;
	}

	public String getDoc() {
		return reserv_doc;
	}

	public void setDoc(String doc) {
		this.reserv_doc = doc;
	}

	public String getReserv_regdate() {
		return reserv_regdate;
	}

	public void setReserv_regdate(String reserv_regdate) {
		this.reserv_regdate = reserv_regdate;
	}

	public String getReserv_state() {
		return reserv_state;
	}

	public void setReserv_state(String reserv_state) {
		this.reserv_state = reserv_state;
	}

	public int getReserv_member_idx() {
		return reserv_member_idx;
	}

	public void setReserv_member_idx(int reserv_member_idx) {
		this.reserv_member_idx = reserv_member_idx;
	}

}