package com.kh.strap.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.admin.service.AdminQnaService;


@Controller
public class AdminQnaController {
	@Autowired
	private AdminQnaService aqService;
}
