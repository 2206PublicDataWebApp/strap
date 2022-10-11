package com.kh.strap.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.board.service.logic.BoardServiceImpl;


@Controller
public class BoardController {
	@Autowired
	private BoardServiceImpl bService;
}
