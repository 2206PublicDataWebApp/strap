package com.kh.strap.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.mypage.service.logic.MyPageServiceImpl;


@Controller
public class MyPageController {
	@Autowired
	private MyPageServiceImpl mpService;
}
