package com.kh.strap.shop.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.qna.service.QnaService;

@Controller("ShopQnaController")
public class QnaController {
	@Autowired
	QnaService qService;
	
}
