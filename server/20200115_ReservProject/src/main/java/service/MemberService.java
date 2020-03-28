package service;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;
import vo.MemberVo;

@Service("member_service")
public class MemberService {

	@Autowired
	MemberDao member_dao;

	// 로그인
	public MemberVo login(MemberVo vo) {
		MemberVo member = member_dao.selectOne(vo.getMember_id());
	
		Map map = new HashedMap();

		if (member == null || member.getMember_pwd().equals(vo.getMember_pwd()) == false) {
			/* member = new MemberVo(); */
			member = new MemberVo();
			map.put("result", member);
			return member;

		} else {
			map.put("result", member);
		}
		
		// result가 fail_id로 리턴될 경우 : "존재하지 않는 아이디입니다." > 모두 리셋하여 로그인 폼
		// result가 fail_pwd로 리턴될 경우 : "비밀번호가 틀렸습니다." > 비밀번호만 리셋하여 로그인 폼
		// result가 fail이면 "로그인에 실패하였습니다"
		// result가 success이면 session에 member 데이터 저장 > 이전 화면

		return member;
		
	}

	// 회원가입
	public Map login_form(MemberVo vo) {
		
		Map test = check_id(vo.getMember_id());
		if(test.get("result")=="already_id")
			return test;
		else
			test.clear();

		int res = member_dao.insert(vo);
		// 정상처리 되면
		String result = "success";

		// 정상처리가 안되면
		if (res == 0)
			result = "fail";

		Map map = new HashMap();
		map.put("result", result);

		// success가 리턴될 경우 : "회원가입이 완료되었습니다."
		// fail가 리턴될 경우 : "회원가입에 실패하였습니다."

		return map;

	}

	// 아이디 중복 확인
	public Map check_id(String member_id) {
		MemberVo vo = member_dao.selectOne(member_id);

		String result = "already_id";

		if (vo == null)
			result = "possible_id";

		Map map = new HashMap();
		map.put("result", result);

		// already_id가 리턴될 경우 : "이미 존재하는 아이디입니다."
		// possible_id가 리턴될 경우 : "사용할 수 있는 id입니다"

		return map;

	}

}
