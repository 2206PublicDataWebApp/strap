package com.kh.strap.match.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.strap.match.service.MatchService;
import com.kh.strap.match.service.logic.MatchServiceImpl;



@Controller
public class MatchController {
	@Autowired
	private MatchService mService;
	
	@RequestMapping("/match/matchingView.strap")
	public String matchView() {
		return "/match/matchingView";
	}
	@RequestMapping("/match/matchingMember.strap")
	public String matchingMember() {
		return "/match/matchingMember";
	}
}
