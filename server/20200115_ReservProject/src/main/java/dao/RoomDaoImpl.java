package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.RoomVo;

@Repository("room_dao")
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<RoomVo> room_name_list(String branch_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.room_name_list",branch_name);
	}
	
	@Override
	public List<RoomVo> room_pwd_list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.room_pwd_list");
	}

	@Override
	public int room_pwd_update(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.room_pwd_update",map);
	}
	
	
	

}
