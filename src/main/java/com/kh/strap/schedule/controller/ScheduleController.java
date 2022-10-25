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
	@RequestMapping(value="/mypage/scheduleListView.strap", method=RequestMethod.GET)
	public ModelAndView showSchedule(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String memberId = member.getMemberId();
		List<Schedule> scList = scService.printAllSchedule(memberId);
		System.out.println(scList);
		
//		JSONArray jsonArr = new JSONArray();
//		for(int i = 0; i < scList.size(); i++) {
//			JSONObject jsonObj = new JSONObject();
//			if(memberId.equals(scList.get(i).getMemberId())) {
//				jsonObj.put("memberId", scList.get(i).getMemberId());
//				jsonObj.put("memberNick", scList.get(i).getMemberNick());
//			} else {
//				jsonObj.put("matchMemberId", scList.get(i).getMatchMemberId());
//				jsonObj.put("matchMemberNick", scList.get(i).getMatchMemberNick());
//			}
//			jsonObj.put("title", scList.get(i).getMatchDetail());
//			jsonObj.put("start", scList.get(i).getMeetDate());
//			jsonArr.add(jsonObj);
//		}
//		System.out.println(jsonArr);
//		mv.addObject("jsonArr", jsonArr.toJSONString());
		mv.addObject("scList",scList);
		mv.setViewName("mypage/schedule");
		return mv;
	}
	
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
	
	
}
