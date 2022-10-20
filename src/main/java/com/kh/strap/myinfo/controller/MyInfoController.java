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
		System.out.println(memberId +","+pwd+","+newPwd);
		String encodePwd = mService.memberPwdById(memberId);
		System.out.println(passwordEncoder.matches(pwd, encodePwd));
		if(passwordEncoder.matches(pwd, encodePwd)) {
			Member member = new Member(memberId, passwordEncoder.encode(newPwd));
			System.out.println(member.toString());
			int result = mService.changePwd(member);
			if(result==1) {
				return "ok";
			}else {
				return "no";
			}
		};
		return "error";
	}
	
	
}
