package com.kh.strap.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.admin.service.logic.AdminServiceImpl;


@Controller
public class AdminController {
	@Autowired
	private AdminServiceImpl aService;
}
