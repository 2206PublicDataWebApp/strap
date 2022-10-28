package com.kh.strap.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.admin.service.BannerService;


@Controller
public class BannerController {
	@Autowired
	private BannerService bnService;
	
	@RequestMapping(value="/admin/bannerListView.strap", method=RequestMethod.GET)
	public ModelAndView showBannerList(ModelAndView mv) {
		mv.setViewName("admin/adminBanner");
		return mv;
	}
	
}
