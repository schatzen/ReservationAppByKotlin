package com.tj.reserv;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BranchDao;
import dao.MemberDao;
import dao.ReservationDao;
import dao.RoomDao;
import vo.MemberVo;

@Controller
public class MemberController {

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


	// 로그인 폼
	@RequestMapping("/member/login_form.do")
	public String login() {
		return "reserv/login_form";
	}

	// 회원가입 폼
	@RequestMapping("/member/member_insert_form.do")
	public String login_form() {

		return "reserv/member_insert_form";
	}

	// 로그인
	@RequestMapping("/member/login.do")
	public String login(String member_id, String member_pwd, Model model) {

		MemberVo member = member_dao.selectOne(member_id);

		if (member == null) {
			model.addAttribute("reason", "fail_id");

			return "redirect:login_form.do";
		}

		if (member.getMember_pwd().equals(member_pwd) == false) {
			model.addAttribute("reason", "fail_pwd");

			return "redirect:login_form.do";
		}

		session.setAttribute("member", member);

		/*
		 * if(!url.isEmpty()) return "redirect:" + url;
		 */

		return "redirect:main.do";
	}

	// 회원가입
	@RequestMapping(value = "/member/member_insert.do", produces = "text/json;charset=utf-8;")
	@ResponseBody
	public String login_form(MemberVo vo) {

		int res = member_dao.insert(vo);

		// 정상처리 되면
		boolean result = true;

		// 정상처리가 안되면
		if (res == 0)
			result = false;

		String jsonStr = String.format("{\"result\":%b}", result);

		return jsonStr;
	}

	// 아이디 중복 확인
	@RequestMapping(value = "/member/check_id.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String check_id(String member_id) {

		MemberVo vo = member_dao.selectOne(member_id);

		boolean result = false;
		if (vo == null)
			result = true;

		String jsonStr = String.format("{\"result\":%b}", result);

		return jsonStr;
	}

}
