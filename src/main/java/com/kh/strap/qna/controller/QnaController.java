package com.kh.strap.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.strap.qna.service.logic.QnaServiceImpl;


@Controller("QnaController")
public class QnaController {
	@Autowired
	private QnaServiceImpl qService;
	
	//문의 리스트 이동
	@RequestMapping(value="/mypage/qnaView.strap", method=RequestMethod.GET)
	public String showMyPage() {
		return "mypage/qnaList";
	}
}
