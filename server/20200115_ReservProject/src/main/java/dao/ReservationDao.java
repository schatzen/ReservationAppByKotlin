package dao;

import java.util.List;
import java.util.Map;

import vo.BranchVo;
import vo.ReservationVo;
import vo.RoomVo;

public interface ReservationDao {

	// �ش� idx�� ���� ���� Ȯ��
	public List<ReservationVo> client_selectList(int m_idx);

	// 처리된 예약 호출
	public List<ReservationVo> admin_confirmed_list();

	// 처리되지 않은 예약 호출
	public List<ReservationVo> admin_not_confirmed_list();

	// ���� �߰�
	public int reserv_check(ReservationVo vo);

	// 관리자가 예약 승인
	public int check_confirmed(int r_idx);

	// 관리자가 예약 취소
	public int check_canceld(int r_idx);

	// 본인 예약 확인
	public List<ReservationVo> not_used_reserv_list(int member_idx);

	// 본인 이용내역 확인
	public List<ReservationVo> used_reserv_list(int member_idx);

	// 예약 승인 리스트
	public Map confirmed_list(int member_idx);

	// 정문 비밀번호 리스트
	public List<BranchVo> main_pwd_list();
	
	// 1층 비밀번호 리스트
	public List<BranchVo> first_floor_pwd_list();
	
	// 방 비밀번호 리스트
	public List<RoomVo> room_pwd_list();

	
}
