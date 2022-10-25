package com.kh.strap.notebox.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.service.NoteBoxService;


@Controller
public class NoteBoxController {
	@Autowired
	private NoteBoxService nService;
	
	/**
	 * 
	 * @param mv
	 * @param page
	 * @return
	 */
	// 쪽지함 리스트
	@RequestMapping(value="/mypage/noteBoxListView.strap", method=RequestMethod.GET)
	public ModelAndView showNoteBoxList(ModelAndView mv, HttpServletRequest request
			,@RequestParam(value="page", required=false) Integer page) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String memberId = member.getMemberId();
		
		int currentPage = (page != null) ? page : 1;
		int totalCount = nService.getTotalCount("","");
		int noticeLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/noticeLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<NoteBox> nList = nService.printNoteBoxList(memberId, currentPage, noticeLimit);
		if(!nList.isEmpty()) {
			mv.addObject("urlVal", "noteBoxListView");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("noticeLimit", noticeLimit);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("nList", nList);
		}
		mv.setViewName("mypage/noteBox");
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @param noteNo
	 * @return
	 */
	// 쪽지 상세페이지
	@RequestMapping(value="/mypage/noteDetailView.strap", method=RequestMethod.GET)
	public ModelAndView showNoteDetail(ModelAndView mv, HttpServletRequest request
			,@ModelAttribute NoteBox noteBox) {
		NoteBox nOne = nService.printOneByNo(noteBox);
		mv.addObject("noteBox", nOne);
		mv.setViewName("mypage/noteDetail");
		return mv;
	}
	
}
