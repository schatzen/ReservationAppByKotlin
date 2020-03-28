package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVo;

@Repository("member_dao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberVo selectOne(String member_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_selectOne", member_id);
	}

	@Override
	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.member_insert", vo);
	}

	@Override
	public int delete(int member_idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("member.member_delete", member_idx);
	}

	@Override
	public List<MemberVo> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.member_selectList");
	}

	@Override
	public MemberVo selectOne_idx(int member_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.member_selectOne_idx", member_idx);
	}

}
