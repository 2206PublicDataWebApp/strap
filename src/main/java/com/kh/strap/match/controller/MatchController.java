package com.kh.strap.match.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 
	 * @return 운동 실력이 비슷한 친구 리스트
	 */
	@RequestMapping("/match/sameMember.strap")
	public String sameMember(
			HttpServletRequest request
			,HttpSession session) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		List<Member> mList = mService.sameMember(member);
		return "/match/matchingMember";
	}
	/**
	 * 
	 * @return 내 주변 친구 리스트
	 */
	@RequestMapping("/match/localMember.strap")
	public String localMember(
			HttpServletRequest request
			,HttpSession session) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String local = member.getMemberJym().split(" ")[1];
		System.out.println(local);
		member.setMemberJym(local);
		List<Member> mList = mService.localMember(member);
		request.setAttribute("mList", mList);
		return "/match/matchingMember";
	}
	/**
	 * 
	 * @return 매너 점수가 높은 친구 리스트
	 */
	@RequestMapping("/match/mannerMember.strap")
	public String findMember3(
			) {
		return "/match/matchingMember";
	}
	/**
	 * 
	 * @return 운동경력이 높은 친구 리스트
	 */
	@RequestMapping("/match/careerMember.strap")
	public String findMember4() {
		return "/match/matchingMember";
	}
	/**
	 * 
	 * @return 3대 500이상인 친구 리스트
	 */
	@RequestMapping("/match/SBDMember.strap")
	public String findMember5() {
		return "/match/matchingMember";
	}
	/**
	 * 
	 * @return 동성 친구
	 */
	@RequestMapping("/match/genderMember.strap")
	public String findMember6() {
		return "/match/matchingMember";
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
