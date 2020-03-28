package com.tj.reserv;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BranchDao;
import dao.MemberDao;
import dao.ReservationDao;
import dao.RoomDao;
import vo.BranchVo;
import vo.MemberVo;
import vo.ReservationVo;
import vo.RoomVo;

@Controller
public class ReservController {

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

	@RequestMapping("/reserv/main.do")
	public String main() {

		return "reserv/main";
	}

	@RequestMapping("/reserv/search.do")
	public String search() {

		return "reserv/search";
	}

	@RequestMapping("/reserv/information.do")
	public String information(HttpServletRequest request, Model model) {

		String loc_name = request.getParameter("loc_name");
		String loc_tel = request.getParameter("loc_tel");
		String loc_addr = request.getParameter("loc_addr");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");

		System.out.println(lng);
		model.addAttribute("loc_name", loc_name);
		model.addAttribute("loc_tel", loc_tel);
		model.addAttribute("loc_addr", loc_addr);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);

		return "reserv/information";
	}

	@RequestMapping("/reserv/reservation.do")
	public String reservation(Model model) {

		// Branch Dropdown 가져오기
		List<BranchVo> list = branch_dao.branch_name_list();
		model.addAttribute("list", list);

		return "reserv/reservation";
	}

	// 예약페이지에서 branch_idx를 통한 room 출력하기
	@RequestMapping(value = { "/reserv/room_search.do" })
	@ResponseBody
	public Map room_search(String branch_name) {

		List<RoomVo> list = room_dao.room_name_list(branch_name);
		Map map = new HashMap();
		map.put("list", list);

		return map;

	}

	@RequestMapping("/reserv/myPage.do")
	public String mypage(HttpServletRequest request, Model model) {

		int member_idx = Integer.parseInt(request.getParameter("member_idx"));
		System.out.println(member_idx);

		Map map = new HashMap();

		// 개인정보 출력
		MemberVo member_vo = member_dao.selectOne_idx(member_idx);
		model.addAttribute("member_vo", member_vo);

		// 확인받지 않은 예약 리스트
		List<ReservationVo> reserv_vo = reserv_dao.not_used_reserv_list(member_idx);
		model.addAttribute("reserv_vo", reserv_vo);

		// 확인 받은 예약 리스트
		/*
		 * map = reserv_dao.confirmed_list(member_idx); System.out.println(map);
		 */

		// 이용내역에 들어갈 리스트 List<ReservationVo> reserv_used_list =
		List<ReservationVo> reserv_used_list = reserv_dao.used_reserv_list(member_idx);
		model.addAttribute("reserv_used_list", reserv_used_list);

		return "reserv/myPage";
	}

	@RequestMapping("/reserv/kakao")
	public String login(@RequestParam("code") String code) {
		System.out.println("code : " + code);
		return "reserv/login";
	}

	@RequestMapping("/reserv/administration.do")
	public String administraition(Model model) {

		List<ReservationVo> not_confirmed_list = reserv_dao.admin_not_confirmed_list();
		List<ReservationVo> confirmed_list = reserv_dao.admin_confirmed_list();

		List<BranchVo> main_pwd_list = branch_dao.main_pwd_list();
		List<BranchVo> first_floor_pwd_list = branch_dao.first_floor_pwd_list();
		List<RoomVo> room_pwd_list = room_dao.room_pwd_list();

		Map map = new HashedMap();
		map.put("not_confirmed_list", not_confirmed_list);
		map.put("confirmed_list", confirmed_list);

		map.put("main_pwd_list", main_pwd_list);
		map.put("first_floor_pwd_list", first_floor_pwd_list);
		map.put("room_pwd_list", room_pwd_list);

		model.addAttribute("map", map);

		return "reserv/administration";
	}

	// 룸 예약하기
	@RequestMapping(value = "/reserv/check_reserv.do", produces = "text/json;charset=utf-8;")
	@ResponseBody
	public String check_reserv(ReservationVo vo) {

		int res = reserv_dao.reserv_check(vo);

		// 정상처리 되면
		boolean result = true;

		// 정상처리가 안되면
		if (res == 0)
			result = false;

		String jsonStr = String.format("{\"result\":%b}", result);

		return jsonStr;

	}

	// 관리자가 예약 허용하기
	@RequestMapping(value = "/reserv/check_confirmed.do", produces = "text/json;charset=utf-8;")
	@ResponseBody
	public String check_confirmed(int reserv_idx) {

		int res = reserv_dao.check_confirmed(reserv_idx);

		// 정상처리 되면
		boolean result = true;

		// 정상처리가 안되면
		if (res == 0)
			result = false;

		String jsonStr = String.format("{\"result\":%b}", result);

		return jsonStr;
	}

	// 관리자가 예약 취소하기
	@RequestMapping(value = "/reserv/check_canceld.do", produces = "text/json;charset=utf-8;")
	@ResponseBody
	public String check_canceld(int reserv_idx, Model model) {

		int res = reserv_dao.check_canceld(reserv_idx);

		// 정상처리 되면
		boolean result = true;

		// 정상처리가 안되면
		if (res == 0)
			result = false;

		String jsonStr = String.format("{\"result\":%b}", result);

		return jsonStr;
	}

	// 정문 비밀번호 변경하기
	@RequestMapping(value = "/reserv/main_pwd_update.do", produces = "text/json;charset=utf-8;")
	@ResponseBody
	public String main_pwd_update(int branch_idx, String branch_main_pwd, Model model) {

		Map map = new HashMap();
		map.put("branch_idx", branch_idx);
		map.put("branch_main_pwd", branch_main_pwd);

		int res = branch_dao.main_pwd_update(map);

		// 정상처리 되면
		boolean result = true;

		// 정상처리가 안되면
		if (res == 0)
			result = false;

		String jsonStr = String.format("{\"result\":%b}", result);

		return jsonStr;
	}

	// 1층 비밀번호 변경하기
	@RequestMapping(value = "/reserv/floor_pwd_update.do", produces = "text/json;charset=utf-8;")
	@ResponseBody
	public String floor_pwd_update(int branch_idx, String branch_1_floor_pwd, Model model) {

		Map map = new HashMap();
		map.put("branch_idx", branch_idx);
		map.put("branch_1_floor_pwd", branch_1_floor_pwd);

		int res = branch_dao.floor_pwd_update(map);

		// 정상처리 되면
		boolean result = true;

		// 정상처리가 안되면
		if (res == 0)
			result = false;

		String jsonStr = String.format("{\"result\":%b}", result);

		return jsonStr;
	}

	// 방 비밀번호 변경하기
	@RequestMapping(value = "/reserv/room_pwd_update.do", produces = "text/json;charset=utf-8;")
	@ResponseBody
	public String room_pwd_update(int room_idx, String room_pwd, Model model) {

		Map map = new HashMap();
		map.put("room_idx", room_idx);
		map.put("room_pwd", room_pwd);

		int res = room_dao.room_pwd_update(map);

		// 정상처리 되면
		boolean result = true;

		// 정상처리가 안되면
		if (res == 0)
			result = false;

		String jsonStr = String.format("{\"result\":%b}", result);

		return jsonStr;
	}

}
