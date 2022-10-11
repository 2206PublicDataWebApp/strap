package com.kh.strap.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.strap.member.service.logic.MemberServiceImpl;


@Controller
public class MemberController {
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("/strap/loginView.kh")
	public String loginView() {
		return "/user/loginView";
	}
	
	@RequestMapping("/strap/enroll.kh")
	public String insertMember() {
		return "/user/enroll";
	}
	
	
	@RequestMapping("/strap/memberIdCheck.kh")
	public String memberIdCheck(
			@RequestParam("memberId") String memberId) {
		return "/user/enroll";
	}
}
