package com.kh.strap.match.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.match.service.logic.MatchServiceImpl;



@Controller
public class MatchController {
	@Autowired
	private MatchServiceImpl mService;
}
