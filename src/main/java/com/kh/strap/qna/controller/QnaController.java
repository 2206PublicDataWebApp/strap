package com.kh.strap.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.qna.service.logic.QnaServiceImpl;


@Controller
public class QnaController {
	@Autowired
	private QnaServiceImpl qService;
}
