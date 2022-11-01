package com.kh.strap.qna.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.qna.domain.Qna;
import com.kh.strap.qna.service.logic.QnaServiceImpl;


@Controller("QnaController")
public class QnaController {
	@Autowired
	private QnaServiceImpl qService;
	
	/**
	 * 
	 * @return
	 */
	// 문의 리스트 이동
	@RequestMapping(value="/mypage/qnaView.strap", method=RequestMethod.GET)
	public String showMyQna() {
		return "mypage/qnaList";
	}
	
	/**
	 * 
	 * @param mv
	 * @param request
	 * @return
	 */
	// 문의 작성 이동
	@RequestMapping(value="/mypage/qnaWriteFormView.strap", method=RequestMethod.GET)
	public ModelAndView showQnaWriteForm(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		mv.addObject("member", member);
		mv.setViewName("mypage/qnaWriteForm");
		return mv;
	}
	
	// 문의글 등록
	@RequestMapping(value="/qna/registerQna.strap", method=RequestMethod.POST)
	public ModelAndView registQna(ModelAndView mv, @ModelAttribute Qna qna
			, HttpServletRequest request) {
		System.out.println(qna);
//		HttpSession session = request.getSession();
//		Admin admin = (Admin)session.getAttribute("loginUser");
//		String adminName = admin.getAdminName();
//		notice.setNoticeWriter(adminName);
		try {
			int result = qService.registerQna(qna);
			request.setAttribute("msg","문의가 등록되었습니다.");
			request.setAttribute("url","/mypage/qnaView.strap");
			mv.setViewName("/common/alert");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
}
