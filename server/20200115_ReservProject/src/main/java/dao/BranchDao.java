package dao;

import java.util.List;
import java.util.Map;

import vo.BranchVo;
import vo.RoomVo;

public interface BranchDao {
	
	// branch name & idx 조회하기
	public List<BranchVo> branch_name_list();
	
	// 지점 정문 비밀번호 구하기
	public List<BranchVo> main_pwd_list();
	
	// 지점 1층 비밀번호 구하기
	public List<BranchVo> first_floor_pwd_list();
	
	// 정문 비밀번호 변경
	public int main_pwd_update(Map map);
	
	// 1층 비밀번호 변경
	public int floor_pwd_update(Map map);	
	

}
