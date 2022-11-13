package com.kh.strap.notebox.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.service.NoteBoxService;


@Controller
public class NoteBoxController {
	@Autowired
	private NoteBoxService nbService;
	
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
		int totalCount = nbService.getTotalCount("","", memberId);
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
		List<NoteBox> nList = nbService.printNoteBoxList(memberId, currentPage, noticeLimit);
		System.out.println(nList);
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
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		String memberId = member.getMemberId();
		int result = nbService.checkNote(noteBox);
		NoteBox nOne = nbService.printOneByNo(noteBox);
		Member mOne = nbService.printOneByName(nOne.getSenderNick());
		mv.addObject("member", mOne);
		mv.addObject("memberId", memberId);
		mv.addObject("noteBox", nOne);
		mv.setViewName("mypage/noteDetail");
		return mv;
	}
	
	
	// 쪽지 조건별 검색
	@RequestMapping(value="/mypage/noteBoxSearch.strap", method=RequestMethod.GET)
	public ModelAndView noteBoxSearchList(ModelAndView mv, HttpServletRequest request
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			int currentPage = (page != null) ? page : 1;
			int totalCount = nbService.getTotalCount(searchCondition, searchValue, memberId);
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
			List<NoteBox> nList = nbService.printAllByValue(searchCondition, searchValue, memberId, currentPage, noticeLimit);
			if(!nList.isEmpty()) {
				mv.addObject("nList", nList);
			}else {
				mv.addObject("nList", null);
			}
				mv.addObject("urlVal", "noteBoxSearch");
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchValue", searchValue);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.setViewName("mypage/noteBox");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 쪽지 삭제 ajax
	@ResponseBody
	@RequestMapping(value="/mypage/removeNote.strap",method=RequestMethod.POST)
	public String removeNote(@RequestParam("nbList[]") List<String> nbList) {
		System.out.println("N리스트 : " + nbList);
		System.out.println(nbList.size());
		for(int i = 0; i < nbList.size(); i++) {
			int noteNo = Integer.parseInt(nbList.get(i));
			System.out.println(noteNo);
			int result = nbService.removeNote(noteNo);
		}
		return "ok";
		
	}
	/**
	 * 
	 * @param session
	 * @return
	 */
	// 쪽지 뱃지
	@ResponseBody
	@RequestMapping(value="/mypage/mark.strap",method=RequestMethod.POST)
	public String markNoteBox(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser != null) {
			int countNoteBox = nbService.getCountNoteBox(loginUser.getMemberId());
			if(countNoteBox > 0) {
				return countNoteBox+"";
			}else {
				return "";
			}
		}else {
			return "";
		}
	}
	
	
}
