package com.kh.strap.match.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kh.strap.match.service.MatchService;
import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;



@Controller
public class MatchController {
	@Autowired
	private MatchService mService;
	
	/**
	 * 
	 * @return 매칭 메인페이지
	 */
	@RequestMapping("/match/matchingView.strap")
	public String matchView() {
		return "/match/matchingView";
	}
	/**
	 * 
	 * @return 맞춤 추천 리스트
	 */
	@RequestMapping("/match/matchingFind.strap")
	public String matchingMember() {
		return "/match/matchingFind";
	}
	
	/**
	 * 새로고침 횟수 조회
	 * @return 
	 */
	@ResponseBody
	@RequestMapping("/match/countNumber.strap")
	public String countNumber(HttpServletRequest request) {
		String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		int count = mService.getCountNumber(memberId);
		return String.valueOf(count);
	}
	
	
	/**
	 * 
	 * @return 운동 정보가 비슷한 친구 리스트
	 */
	@RequestMapping("/match/sameMember.strap")
	public String sameMember(
			HttpServletRequest request
			,HttpSession session) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		mOne.setMemberSBD(member.getMemberSBD());
		mOne.setMemberCareer(member.getMemberCareer());
		//기존 회원이라면 현재 추천 중인 회원 가져오기
		List<Member> mList = mService.sameMember(mOne);
		if(!mList.isEmpty()) {
			request.setAttribute("mList", mList);
		}else {
		//신규 회원은 현재 추천받고있는 회원이 없으니 회원 새로고침하는 행동처럼 처리, 카운트 차감은없이
			mList = mService.sameRefresh(mOne);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mList", mList);
			map.put("user", mOne.getMemberId());
			//새로운 멤버를 현재 멤버와 추천 이력에 업데이트
			mService.updateSameRecord(map);
			mService.insertSameRecord(map);
			request.setAttribute("mList", mList);
		}
		return "/match/sameMember";
	}
	/**
	 * 
	 * @return 운동 정보가 비슷한 친구 새로고침
	 */
	@RequestMapping("/match/sameRefresh.strap")
	public String smaeRefresh(
			HttpServletRequest request
			) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		mOne.setMemberSBD(member.getMemberSBD());
		mOne.setMemberCareer(member.getMemberCareer());
		Map<String, Object> map = new HashMap<String, Object>();
		//중복되지 않는 새로운 멤버 5명을 가져온다
		List<Member> mList = mService.sameRefresh(mOne);
		//새로운 멤버리스트가 있다면 추천횟수를 차감하고 현재 멤버와 추천 이력에 업데이트
		if(!mList.isEmpty()) {
			System.out.println("추천 리스트 있음");
		} else {
		//새로운 멤버리스트가 더이상 없다면 추천 이력 초기화 후 진행
			System.out.println("추천 리스트 없음");
			String memberId = mOne.getMemberId();
			mService.resetSameRecord(memberId);
			mList = mService.sameRefresh(mOne);
		}
		mService.minusCount(mOne);
		map.put("mList", mList);
		map.put("user", mOne.getMemberId());
		mService.updateSameRecord(map);
		mService.insertSameRecord(map);
		//F5를 누르면 컨트롤러가 재동작되는것을 막기위해 redirect
		return "redirect:/match/sameMember.strap";
	}
	/**
	 * 
	 * @return 내 주변 친구 리스트
	 */
	@RequestMapping("/match/localMember.strap")
	public String localMember(
			HttpServletRequest request
			,HttpSession session) {
		//사용자 마이짐의 시/군으로 회원 찾기
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[1];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		//기존 회원은 현재 내 주변 추천 회원 목록을 가져오기
		List<Member> mList = mService.localMember(mOne);
		if(!mList.isEmpty()) {
			request.setAttribute("mList", mList);
		}else {
		//신규 회원은 현재 추천받고있는 회원이 없으니 회원 새로고침하는 행동처럼 처리, 카운트 차감은없이
			mList = mService.localRefresh(mOne);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mList", mList);
			map.put("user", mOne.getMemberId());
			//새로운 멤버를 현재 멤버와 추천 이력에 업데이트
			mService.updateLocalRecord(map);
			mService.inserLocalRecord(map);
			request.setAttribute("mList", mList);
		}
		return "/match/localMember";
	}
	/**
	 * 
	 * @return 내 주변 친구 새로고침
	 */
	@RequestMapping("/match/localRefresh.strap")
	public String localRefresh(
			HttpServletRequest request
			,HttpSession session
			) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[1];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		Map<String, Object> map = new HashMap<String, Object>();
		//중복되지 않는 새로운 멤버 5명을 가져온다
		List<Member> mList = mService.localRefresh(mOne);
		//새로운 멤버리스트가 있다면 추천횟수를 차감하고 현재 멤버와 추천 이력에 업데이트
		if(!mList.isEmpty()) {
			System.out.println("추천 리스트 있음");
		} else {
		//새로운 멤버리스트가 더이상 없다면 추천 이력 초기화 후 진행
			System.out.println("추천 리스트 없음");
			String memberId = mOne.getMemberId();
			mService.resetLocalRecord(memberId);
			mList = mService.localRefresh(mOne);
		}
		mService.minusCount(mOne);
		map.put("mList", mList);
		map.put("user", mOne.getMemberId());
		mService.updateLocalRecord(map);
		mService.inserLocalRecord(map);
		//F5를 누르면 컨트롤러가 재동작되는것을 막기위해 redirect
		return "redirect:/match/localMember.strap";
	}
	
	
	/**
	 * 
	 * @return 매너 점수가 높은 친구 리스트
	 */
	@RequestMapping("/match/mannerMember.strap")
	public String findMember3(
			HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		//기존 회원이라면 현재 추천 중인 회원 가져오기
		List<Member> mList = mService.mannerMember(mOne);
		if(!mList.isEmpty()) {
			request.setAttribute("mList", mList);
		}else {
		//신규 회원은 현재 추천받고있는 회원이 없으니 회원 새로고침하는 행동처럼 처리, 카운트 차감은없이
			mList = mService.mannerRefresh(mOne);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mList", mList);
			map.put("user", mOne.getMemberId());
			//새로운 멤버를 현재 멤버와 추천 이력에 업데이트
			int result1 = mService.updateMannerRecord(map);
			int result2 = mService.inserMannerRecord(map);
			System.out.println("result1 : " + result1);
			System.out.println("result2 : " + result2);
			request.setAttribute("mList", mList);
		}
		return "/match/mannerMember";
	}
	
	/**
	 * 
	 * @return 매너 친구 새로고침
	 */
	@RequestMapping("/match/mannerRefresh.strap")
	public String mannerRefresh(
			HttpServletRequest request
			,HttpSession session
			) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		//중복되지 않는 새로운 멤버 5명을 가져온다
		List<Member> mList = mService.mannerRefresh(mOne);
		Map<String, Object> map = new HashMap<String, Object>();
		//새로운 멤버리스트가 있다면 추천횟수를 차감하고 현재 멤버와 추천 이력에 업데이트
		if(!mList.isEmpty()) {
			System.out.println("추천 리스트 있음");
		} else {
		//새로운 멤버리스트가 더이상 없다면 추천 이력 초기화 후 진행
			System.out.println("추천 리스트 없음");
			String memberId = mOne.getMemberId();
			mService.resetMannerRecord(memberId);
			mList = mService.mannerRefresh(mOne);
		}
		mService.minusCount(mOne);
		map.put("mList", mList);
		map.put("user", mOne.getMemberId());
		mService.updateMannerRecord(map);
		mService.inserMannerRecord(map);
		//F5를 누르면 컨트롤러가 재동작되는것을 막기위해 redirect
		return "redirect:/match/mannerMember.strap";
	}
	
	/**
	 * 
	 * @return 운동경력이 높은 친구 리스트
	 */
	@RequestMapping("/match/careerMember.strap")
	public String findMember4(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		//기존 회원이라면 현재 추천 중인 회원 가져오기
		List<Member> mList = mService.careerMember(mOne);
		if(!mList.isEmpty()) {
			request.setAttribute("mList", mList);
		}else {
		//신규 회원은 현재 추천받고있는 회원이 없으니 회원 새로고침하는 행동처럼 처리, 카운트 차감은없이
			mList = mService.careerRefresh(mOne);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mList", mList);
			map.put("user", mOne.getMemberId());
			//새로운 멤버를 현재 멤버와 추천 이력에 업데이트
			int result1 = mService.updateCareerRecord(map);
			int result2 = mService.inserCareerRecord(map);
			request.setAttribute("mList", mList);
		}
		return "/match/careerMember";
	}
	/**
	 * 
	 * @return 운동 경력이 높은 회원 새로고침
	 */
	@RequestMapping("/match/careerRefresh.strap")
	public String careerRefresh(
			HttpServletRequest request
			,HttpSession session
			) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		//중복되지 않는 새로운 멤버 5명을 가져온다
		List<Member> mList = mService.careerRefresh(mOne);
		Map<String, Object> map = new HashMap<String, Object>();
		//새로운 멤버리스트가 있다면 추천횟수를 차감하고 현재 멤버와 추천 이력에 업데이트
		if(!mList.isEmpty()) {
			System.out.println("추천 리스트 있음");
		} else {
		//새로운 멤버리스트가 더이상 없다면 추천 이력 초기화 후 진행
			System.out.println("추천 리스트 없음");
			String memberId = mOne.getMemberId();
			mService.resetCareerRecord(memberId);
			mList = mService.careerRefresh(mOne);
		}
		mService.minusCount(mOne);
		map.put("mList", mList);
		map.put("user", mOne.getMemberId());
		mService.updateCareerRecord(map);
		mService.inserCareerRecord(map);
		//F5를 누르면 컨트롤러가 재동작되는것을 막기위해 redirect
		return "redirect:/match/careerMember.strap";
	}
	
	/**
	 * 
	 * @return 3대 500이상인 친구 리스트
	 */
	@RequestMapping("/match/SBDMember.strap")
	public String findMember5(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		//기존 회원이라면 현재 추천 중인 회원 가져오기
		List<Member> mList = mService.SBDMember(mOne);
		if(!mList.isEmpty()) {
			request.setAttribute("mList", mList);
		}else {
		//신규 회원은 현재 추천받고있는 회원이 없으니 회원 새로고침하는 행동처럼 처리, 카운트 차감은없이
			mList = mService.SBDRefresh(mOne);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mList", mList);
			map.put("user", mOne.getMemberId());
			//새로운 멤버를 현재 멤버와 추천 이력에 업데이트
			mService.updateSBDRecord(map);
			mService.insertSBDRecord(map);
			request.setAttribute("mList", mList);
		}
		return "/match/SBDMember";
	}
	/**
	 * 
	 * @return 3대 회원 새로고침
	 */
	@RequestMapping("/match/SBDRefresh.strap")
	public String SBDRefresh(
			HttpServletRequest request
			) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		//중복되지 않는 새로운 멤버 5명을 가져온다
		List<Member> mList = mService.SBDRefresh(mOne);
		Map<String, Object> map = new HashMap<String, Object>();
		//새로운 멤버리스트가 있다면 추천횟수를 차감하고 현재 멤버와 추천 이력에 업데이트
		if(!mList.isEmpty()) {
			System.out.println("추천 리스트 있음");
		} else {
		//새로운 멤버리스트가 더이상 없다면 추천 이력 초기화 후 진행
			System.out.println("추천 리스트 없음");
			String memberId = mOne.getMemberId();
			mService.resetSBDRecord(memberId);
			mList = mService.SBDRefresh(mOne);
		}
		mService.minusCount(mOne);
		map.put("mList", mList);
		map.put("user", mOne.getMemberId());
		mService.updateSBDRecord(map);
		mService.insertSBDRecord(map);
		//F5를 누르면 컨트롤러가 재동작되는것을 막기위해 redirect
		return "redirect:/match/SBDMember.strap";
	}
	
	/**
	 * 
	 * @return 동성 친구
	 */
	@RequestMapping("/match/genderMember.strap")
	public String findMember6(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		mOne.setMemberGender(member.getMemberGender());;
		//기존 회원이라면 현재 추천 중인 회원 가져오기
		List<Member> mList = mService.genderMember(mOne);
		if(!mList.isEmpty()) {
			request.setAttribute("mList", mList);
		}else {
		//신규 회원은 현재 추천받고있는 회원이 없으니 회원 새로고침하는 행동처럼 처리, 카운트 차감은없이
			mList = mService.genderRefresh(mOne);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mList", mList);
			map.put("user", mOne.getMemberId());
			//새로운 멤버를 현재 멤버와 추천 이력에 업데이트
			mService.updateGenderRecord(map);
			mService.insertGenderRecord(map);
			request.setAttribute("mList", mList);
		}
		return "/match/genderMember";
	}
	/**
	 * 
	 * @return 동성 회원 새로고침
	 */
	@RequestMapping("/match/genderRefresh.strap")
	public String genderRefresh(
			HttpServletRequest request
			) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		Member mOne = new Member();
		String local = member.getMemberJym().split(" ")[0];
		mOne.setMemberId(member.getMemberId());
		mOne.setMemberJym(local);
		mOne.setMemberGender(member.getMemberGender());;
		//중복되지 않는 새로운 멤버 5명을 가져온다
		List<Member> mList = mService.genderRefresh(mOne);
		Map<String, Object> map = new HashMap<String, Object>();
		//새로운 멤버리스트가 있다면 추천횟수를 차감하고 현재 멤버와 추천 이력에 업데이트
		if(!mList.isEmpty()) {
			System.out.println("추천 리스트 있음");
		} else {
		//새로운 멤버리스트가 더이상 없다면 추천 이력 초기화 후 진행
			System.out.println("추천 리스트 없음");
			String memberId = mOne.getMemberId();
			mService.resetGenderRecord(memberId);
			mList = mService.genderRefresh(mOne);
		}
		mService.minusCount(mOne);
		map.put("mList", mList);
		map.put("user", mOne.getMemberId());
		mService.updateGenderRecord(map);
		mService.insertGenderRecord(map);
		//F5를 누르면 컨트롤러가 재동작되는것을 막기위해 redirect
		return "redirect:/match/genderMember.strap";
	}
	/**
	 * 
	 * @return 쪽지 보내기
	 */
	@ResponseBody
	@RequestMapping(value="/match/sendNote.strap",method = RequestMethod.POST)
	public String sendNote(
			HttpServletRequest request,
			HttpSession session,
			String recipientNick,
			String noteTitle,
			String noteContents) {
		String senderId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		String senderNick = ((Member)request.getSession().getAttribute("loginUser")).getMemberNick();
		String recipientId = mService.findIdByNick(recipientNick);
		NoteBox nb = new NoteBox(recipientId,senderId,noteTitle,noteContents,recipientNick,senderNick);
		int result = mService.insertNoteBox(nb);
		if(result == 1) {
			return "ok";
		} else {
			return "no";
		}
	}
}
