package com.kh.strap.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.admin.domain.Admin;
import com.kh.strap.admin.service.logic.AdminServiceImpl;


@Controller
public class AdminController {
	@Autowired
	private AdminServiceImpl aService;
	
	@RequestMapping(value="/admin/adminLoginView.strap", method=RequestMethod.GET)
	public ModelAndView showAdminLogin(ModelAndView mv) {
		mv.setViewName("admin/adminLogin");
		return mv;
	}
	
		
	@RequestMapping(value="/admin/login.strap", method=RequestMethod.POST)
	public ModelAndView showAdminMain(ModelAndView mv
			,@ModelAttribute Admin admin ) {
		
		Admin loginAdmin = aService.loginAdmin(admin);
		
		if(loginAdmin != null) {
			mv.addObject("adminId", admin.getAdminId());
			mv.setViewName("admin/adminLogin");
			
		}
		
		
		return mv;
	}
}
