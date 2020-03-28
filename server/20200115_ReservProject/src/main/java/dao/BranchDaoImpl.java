package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BranchVo;
import vo.RoomVo;

@Repository("branch_dao")
public class BranchDaoImpl implements BranchDao {

	@Autowired
	SqlSession sqlSession;

	// 지점 저네 조회하기
	public List<BranchVo> branch_name_list() {
		return sqlSession.selectList("branch.branch_name_list");
	}

	@Override
	public List<BranchVo> main_pwd_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("branch.main_pwd_list");
	}

	@Override
	public List<BranchVo> first_floor_pwd_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("branch.first_floor_pwd_list");
	}

	@Override
	public int main_pwd_update(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("branch.main_pwd_update",map);
	}

	@Override
	public int floor_pwd_update(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("branch.floor_pwd_update",map);
	}
	
}
