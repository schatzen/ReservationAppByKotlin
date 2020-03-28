package dao;

import java.util.List;
import java.util.Map;

import vo.RoomVo;

public interface RoomDao {
	
	//방 이름 조회하기
	public List<RoomVo> room_name_list(String branch_idx);
	
	// 지점 이름과 방 비밀번호 구하기
	public List<RoomVo> room_pwd_list();
	
	// 방 비밀번호 변경
	public int room_pwd_update(Map map);

}
