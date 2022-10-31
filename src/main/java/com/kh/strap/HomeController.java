package com.kh.strap;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.admin.domain.Banner;
import com.kh.strap.admin.service.BannerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private BannerService bnService;
	
	@RequestMapping("/home.strap")
	public ModelAndView home(ModelAndView mv) {
		List<Banner> bnList = bnService.printAllBanner();
		mv.addObject("bnList", bnList);
		mv.setViewName("/home");
		return mv;
	}
	
}
