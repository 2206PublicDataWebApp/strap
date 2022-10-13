package com.kh.strap.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.strap.mypage.service.logic.MyPageServiceImpl;


@Controller
public class MyPageController {
	@Autowired
	private MyPageServiceImpl mpService;
	
	@RequestMapping(value="/mypage/mypageView.strap", method=RequestMethod.GET)
	public String showMyPage() {
		return "mypage/myPage";
	}
	
	
}
