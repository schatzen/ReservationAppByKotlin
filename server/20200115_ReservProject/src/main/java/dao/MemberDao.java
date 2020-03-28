package dao;

import java.util.List;
import java.util.Map;

import vo.MemberVo;


public interface MemberDao {
	
	// id로 회원정보 출력
	public MemberVo selectOne(String member_id);
	
	// idx로 회원정보 출력
	public MemberVo selectOne_idx(int member_idx);
	
	// 회원가입
	public int insert(MemberVo vo);
	
	// 회원탈퇴
	public int delete(int member_idx);
	
	// 회원목록 조회
	public List<MemberVo> selectList();
	



}
