package com.kh.strap.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.strap.member.domain.Member;
import com.kh.strap.member.domain.SimpleQnA;
import com.kh.strap.member.service.MemberService;
import com.kh.strap.mypage.service.logic.MyPageServiceImpl;
import com.kh.strap.schedule.domain.Schedule;
import com.kh.strap.schedule.service.ScheduleService;


@Controller
public class MyPageController {
	@Autowired
	private MemberService mService;
	@Autowired
	private ScheduleService sService;
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	// 마이페이지 메인
	@RequestMapping(value="/mypage/mypageView.strap", method=RequestMethod.GET)
	public String showMyPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		if(member != null) {
			//매너점수 퍼센트 구하기
			int percent = mService.mannerPercent(member.getMemberId());
			//마이짐 나누기
			String myJym = member.getMemberJym();
			String jymAddress = myJym.split(",")[0];
			String jymTitle = myJym.split(",")[1];
			//일주일 내의 최근 매칭정보 가져오기
//			String currentDate = sdf.format(cal.getTime());
//			cal.add(Calendar.DATE, -7);
//			String weekAgoDate = sdf.format(cal.getTime());
//			Map<String, String> map = new HashMap<String, String>();
//			map.put("weekAgoDate", weekAgoDate);
//			map.put("currentDate", currentDate);
//			Schedule schedule = sService.endSchedule(map); 
			request.setAttribute("percent", percent);
			request.setAttribute("jymAddress", jymAddress);
			request.setAttribute("jymTitle", jymTitle);
			
		} else {
			request.setAttribute("msg", "로그인후 이용 가능한 서비스입니다.");
			request.setAttribute("url", "/member/loginView.strap");
			return("common/alert");
		}
		return "mypage/myPage";
	}
	
	@RequestMapping("/mypage/matchingView.strap")
	public String matchingView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		if(member == null) {
			request.setAttribute("msg", "로그인후 이용 가능한 서비스입니다.");
			request.setAttribute("url", "/member/loginView.strap");
			return("common/alert");
		}
		return "/mypage/matchingHistory";
	}
	
	/**
	 * 유저의 간단 Q&A 가져오기
	 * @param question 질문
	 * @param answer 답변
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/mypage/qna.strap",produces = "application/json;charset=utf-8")
	public String QnA(
			HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String memberId = member.getMemberId();
		SimpleQnA qna = mService.qnaOne(memberId);
		Gson gson = new Gson();
		return gson.toJson(qna);
	}
	
	/**
	 * 유저의 간단 Q&A 답변 insert
	 * @param question 질문
	 * @param answer 답변
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/mypage/qnaAnswer.strap", method = RequestMethod.POST)
	public String qnaAswer(
			HttpServletRequest request
			,int qnaNo
			,String answer) {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		String memberId = member.getMemberId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("qnaNo", qnaNo);
		map.put("qnaAnswer", answer);
		int result = mService.inserAnswer(map);
		System.out.println("결과 : " + result);
		return "ok";
	}
}
