package com.kh.strap.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.report.domain.Report;
import com.kh.strap.report.service.logic.ReportServiceImpl;


@Controller("ReportController")
public class ReportController {
	@Autowired
	private ReportServiceImpl rService;
	
	/**
	 * 
	 * @param mv
	 * @param report
	 * @return
	 */
	// 쪽지 신고 등록
	@ResponseBody
	@RequestMapping(value="/report/registerReport.strap", method=RequestMethod.POST)
	public ModelAndView registReport(ModelAndView mv
			,@ModelAttribute Report report) {
		int result = rService.registReport(report);
		if(result > 0) {
			int noteNo = report.getContentsNo();
			mv.addObject("noteNo", noteNo);
			mv.setViewName("mypage/noteBox");
		}
		return mv;
	}
}
