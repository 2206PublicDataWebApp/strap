package com.kh.strap.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.schedule.service.logic.ScheduleServiceImpl;


@Controller
public class ScheduleController {
	@Autowired
	private ScheduleServiceImpl scService;
	
	// 마이페이지 캘린더 페이지
	@RequestMapping(value="/mypage/scheduleListView.strap", method=RequestMethod.GET)
	public ModelAndView showSchedule(ModelAndView mv) {
		mv.setViewName("mypage/schedule");
		return mv;
	}
	
}
