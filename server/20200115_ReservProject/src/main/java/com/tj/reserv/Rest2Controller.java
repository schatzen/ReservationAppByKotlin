package com.tj.reserv;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BranchDao;
import dao.MemberDao;
import dao.ReservationDao;
import dao.RoomDao;
import service.MemberService;
import vo.MemberVo;

@Controller
public class Rest2Controller {

	@Autowired
	HttpSession session;

	@Autowired
	ReservationDao reserv_dao;

	@Autowired
	MemberDao member_dao;

	@Autowired
	BranchDao branch_dao;

	@Autowired
	RoomDao room_dao;

	@Autowired
	MemberService member_service;

	/*
	 * @RequestMapping(value = "/test", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public Map test(String member_id, String member_pwd) { Map map
	 * = member_service.login(member_id, member_pwd); //Map map = new HashMap();
	 * //map.put("test", "Test"); return map; }
	 */
	
	// 로그인
	@RequestMapping(value = "/member/signin", method = RequestMethod.POST)
	@ResponseBody
	public MemberVo login(@RequestBody MemberVo vo) {
		return member_service.login(vo);
	}

	// 회원가입
	@RequestMapping(value = "/member/signup", method = RequestMethod.POST)
	@ResponseBody
	public Map login_form(@RequestBody MemberVo vo) {
		return member_service.login_form(vo);
	}

	// 아이디 중복 확인
	@RequestMapping(value = "/member/check_id/{member_id}", method = RequestMethod.GET)
	@ResponseBody
	public Map check_id(@PathVariable("member_id") String member_id) {
		return member_service.check_id(member_id);
	}

}
