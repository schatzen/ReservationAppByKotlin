package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BranchVo;
import vo.LocationVo;
import vo.MemberVo;
import vo.ReservationVo;
import vo.RoomVo;

@Repository("reserv_dao")
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ReservationVo> client_selectList(int m_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReservationVo> admin_confirmed_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reserv.admin_confirmed_list");
	}

	@Override
	public List<ReservationVo> admin_not_confirmed_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reserv.admin_not_confirmed_list");
	}

	@Override
	public int reserv_check(ReservationVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("reserv.reserv_check", vo);
	}

	@Override
	public int check_confirmed(int reserv_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("reserv.check_confirmed", reserv_idx);
	}

	@Override
	public int check_canceld(int reserv_idx) {
		// TODO Auto-generated method stub
		return sqlSession.update("reserv.check_canceld", reserv_idx);
	}


	@Override
	public List<ReservationVo> not_used_reserv_list(int member_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reserv.not_used_reserv_list", member_idx);
	}

	@Override
	public List<ReservationVo> used_reserv_list(int member_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reserv.used_reserv_list", member_idx);
	}

	@Override
	public Map confirmed_list(int member_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectMap("reserv.confirmed_list", member_idx,"confirmed_list");
	}

	@Override
	public List<BranchVo> main_pwd_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reserv.main_pwd_list");
	}

	@Override
	public List<BranchVo> first_floor_pwd_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reserv.first_floor_pwd_list");
	}

	@Override
	public List<RoomVo> room_pwd_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room_pwd_list");
	}
	
	
	
	

}
