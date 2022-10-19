package com.kh.strap.myinfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.strap.myinfo.service.logic.MyInfoServiceImpl;


@Controller
public class MyInfoController {
	@Autowired
	private MyInfoServiceImpl miService;
	
	@RequestMapping(value="/mypage/myinfoView.strap", method=RequestMethod.GET)
	public String showMyInfo(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		Member member = (Member)session.getAttribute("loginUser");
//		if(member != null) {
//			String userId = member.getMemberId();
//			Member mOne = uService.printOneUser(userId);
//		} else {
//			request.setAttribute("msg", "로그인후 이용 가능한 서비스입니다.");
//			request.setAttribute("url", "/user/loginView.kh");
//			mv.setViewName("common/alert");
//		}
		return "mypage/myinfo";
	}
	
	
}
