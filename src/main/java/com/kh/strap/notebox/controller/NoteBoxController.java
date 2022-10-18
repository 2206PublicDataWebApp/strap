package com.kh.strap.notebox.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.service.logic.NoteBoxServiceImpl;


@Controller
public class NoteBoxController {
	@Autowired
	private NoteBoxServiceImpl nService;
	
	
	// 쪽지함 리스트
	@RequestMapping(value="/mypage/noteBoxListView.strap", method=RequestMethod.GET)
	public ModelAndView showNoteBoxList(ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
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
		List<NoteBox> nList = nService.printNoteBoxList(currentPage, noticeLimit);
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
}
