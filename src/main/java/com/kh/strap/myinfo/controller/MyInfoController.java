package com.kh.strap.myinfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.service.MemberService;
import com.kh.strap.myinfo.service.logic.MyInfoServiceImpl;


@Controller
public class MyInfoController {
	@Autowired
	private MyInfoServiceImpl miService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value="/mypage/myinfoView.strap", method=RequestMethod.GET)
	public ModelAndView showMyInfo(
			ModelAndView mv, HttpServletRequest request, HttpSession session) {
		Member member = (Member)session.getAttribute("loginUser");
		//세션이 없는 경우 로그인 페이지로 이동
		if(member == null) {
			mv.setViewName("/member/loginView");
			return mv;
		}
		mv.addObject(member);
		mv.setViewName("/mypage/myinfo");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/member/myinfoPwd.strap", method =RequestMethod.POST)
	public String modifyPwd(
			HttpSession session
			,@RequestParam("memberId") String memberId
			,@RequestParam("pwd") String pwd
			,@RequestParam("newPwd") String newPwd
			) {
		String encodePwd = mService.memberPwdById(memberId);
		System.out.println(passwordEncoder.matches(pwd, encodePwd));
		if(passwordEncoder.matches(pwd, encodePwd)) {
			Member member = new Member(memberId, passwordEncoder.encode(newPwd));
			int result = mService.changePwd(member);
			if(result==1) {
				return "ok";
			}else {
				return "no";
			}
		};
		return "error";
	}
	
	@ResponseBody
	@RequestMapping(value="/member/myinfoNick.strap")
	public String modifyNick(
			HttpSession session
			,HttpServletRequest request
			,@RequestParam("memberId") String memberId
			,@RequestParam("memberNick") String memberNick
			) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberNick(memberNick);
		int result = mService.changeNick(member);
		if(result==1) {
			//바로 적용을 위해 변경된 닉네임으로 세션 다시 저장
			session = request.getSession();
			member = (Member)session.getAttribute("loginUser");
			member.setMemberNick(memberNick);
			session.setAttribute("loginUser", member);
			return "ok";
		} else {
			return "no";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/member/myinfoEmail.strap")
	public String modifyEmail(
			HttpSession session
			,HttpServletRequest request
			,@RequestParam("memberId") String memberId
			,@RequestParam("memberEmail") String memberEmail
			) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberEmail(memberEmail);
		System.out.println(member.toString());
		int result = mService.changeEmail(member);
		System.out.println("이메일 변경 결과 "+result);
		if(result==1) {
			//바로 적용을 위해 변경된 닉네임으로 세션 다시 저장
			session = request.getSession();
			member = (Member)session.getAttribute("loginUser");
			member.setMemberEmail(memberEmail);
			session.setAttribute("loginUser", member);
			return "ok";
		} else {
			return "no";
		}
	}
	@ResponseBody
	@RequestMapping(value="/member/myinfoCareer.strap")
	public String modifyCareer(
			HttpSession session
			,HttpServletRequest request
			,@RequestParam("memberId") String memberId
			,@RequestParam("memberCareer") String memberCareer
			) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberCareer(memberCareer);
		int result = mService.changeCareer(member);
//		System.out.println(result);
		if(result==1) {
			//바로 적용을 위해 변경된 닉네임으로 세션 다시 저장
			session = request.getSession();
			member = (Member)session.getAttribute("loginUser");
			member.setMemberCareer(memberCareer);
			session.setAttribute("loginUser", member);
			return "ok";
		} else {
			return "no";
		}
	}
	@ResponseBody
	@RequestMapping(value="/member/myinfoSBD.strap")
	public String modifySBD(
			HttpSession session
			,HttpServletRequest request
			,@RequestParam("memberId") String memberId
			,@RequestParam("memberSBD") String memberSBD
			) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberSBD(memberSBD);
		int result = mService.changeSBD(member);
		if(result==1) {
			//바로 적용을 위해 변경된 닉네임으로 세션 다시 저장
			session = request.getSession();
			member = (Member)session.getAttribute("loginUser");
			member.setMemberSBD(memberSBD);
			session.setAttribute("loginUser", member);
			return "ok";
		} else {
			return "no";
		}
	}
	@ResponseBody
	@RequestMapping(value="/member/myinfoIntroduce.strap")
	public String modifyIntroduce(
			HttpSession session
			,HttpServletRequest request
			,@RequestParam("memberId") String memberId
			,@RequestParam("memberIntroduce") String memberIntroduce
			) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberIntroduce(memberIntroduce);
		int result = mService.changeSBD(member);
		if(result==1) {
			//바로 적용을 위해 변경된 닉네임으로 세션 다시 저장
			session = request.getSession();
			member = (Member)session.getAttribute("loginUser");
			member.setMemberIntroduce(memberIntroduce);
			session.setAttribute("loginUser", member);
			return "ok";
		} else {
			return "no";
		}
	}
	@ResponseBody
	@RequestMapping(value="/member/myinfoJym.strap")
	public String modifyJym(
			HttpSession session
			,HttpServletRequest request
			,@RequestParam("memberId") String memberId
			,@RequestParam("memberJym") String memberJym
			) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberJym(memberJym);
		int result = mService.changeJym(member);
		if(result==1) {
			//바로 적용을 위해 변경된 닉네임으로 세션 다시 저장
			session = request.getSession();
			member = (Member)session.getAttribute("loginUser");
			member.setMemberJym(memberJym);
			session.setAttribute("loginUser", member);
			return "ok";
		} else {
			return "no";
		}
	}
}
