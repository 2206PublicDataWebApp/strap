package com.kh.strap.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.schedule.domain.Schedule;
import com.kh.strap.schedule.service.ScheduleService;


@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService scService;
	
	/**
	 * 
	 * @param mv
	 * @param request
	 * @return
	 */
	// 캘린더 페이지
	@RequestMapping(value="/mypage/scheduleView.strap", method=RequestMethod.GET)
	public ModelAndView showSchedule(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("mypage/schedule");
		return mv;
	}
	
	// 캘린더 일정 조회
	@ResponseBody
	@RequestMapping(value="/mypage/scheduleList.strap",produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String showScheduleList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String memberId = member.getMemberId();
		List<Schedule> scList = scService.printAllSchedule(memberId);
		System.out.println(scList);
		JSONArray jsonArr = new JSONArray();
		System.out.println(scList.size());
		for(int i = 0; i < scList.size(); i++) {
			JSONObject jsonObj = new JSONObject();
			if (memberId.equals(scList.get(i).getMatchMemberId())) {
				jsonObj.put("title",scList.get(i).getMemberNick() + " " + scList.get(i).getMatchDetail());
			} else {
				jsonObj.put("title",scList.get(i).getMatchMemberNick() + " " + scList.get(i).getMatchDetail());
			}
			jsonObj.put("start",scList.get(i).getMeetDate());
			jsonArr.add(jsonObj);
		}
		System.out.println(jsonArr);
		return jsonArr.toString();
	}
	
	
	/**
	 * 
	 * @param schedule
	 * @return
	 */
	// 일정 등록
	@ResponseBody
	@RequestMapping(value="/schedule/registerSchedule.strap", method=RequestMethod.POST)
	public String registSchedule(@ModelAttribute Schedule schedule) {
		int result = scService.registSchedule(schedule);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	// 일정 삭제
	@ResponseBody
	@RequestMapping(value="/schedule/removeSchedule.strap", method=RequestMethod.POST)
	public String removeSchedule(@ModelAttribute Schedule schedule) {
		return "ffjfjdsfdfsdf";
	}
	
	
}
