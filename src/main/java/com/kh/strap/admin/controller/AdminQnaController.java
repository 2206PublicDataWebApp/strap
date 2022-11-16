package com.kh.strap.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.admin.domain.AdminQna;
import com.kh.strap.admin.service.AdminQnaService;
import com.kh.strap.admin.service.AdminService;
import com.kh.strap.member.domain.Member;


@Controller
public class AdminQnaController {
	@Autowired
	private AdminQnaService aqService;
	@Autowired
	private AdminService aService;
	
	/**
	 * 
	 * @param mv
	 * @param page
	 * @return
	 */
	// 관리자 문의 리스트 조회
	@RequestMapping(value="/admin/adminQnaListView.strap", method=RequestMethod.GET)
	public String showAdminQnaList(
			@RequestParam(value="page", required=false) Integer page
			,HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		if(member != null) {
			int currentPage = (page != null) ? page : 1;
			int totalCount = aqService.getTotalCount("","", null);
			int adminqnaLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)totalCount/adminqnaLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<AdminQna> aqList = aqService.printAllAdminQnaList(currentPage, adminqnaLimit);
			if(!aqList.isEmpty()) {
				request.setAttribute("urlVal", "adminQnaListView");
				request.setAttribute("totalCount", totalCount);
				request.setAttribute("maxPage", maxPage);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startNavi", startNavi);
				request.setAttribute("endNavi", endNavi);
				request.setAttribute("aqList", aqList);
			}
			return("admin/adminQnaList");
		} else {
			request.setAttribute("msg", "로그인후 이용 가능한 서비스입니다.");
			request.setAttribute("url", "/admin/loginView.strap");
			return("common/alert");
		}
	}
	
	/**
	 * 
	 * @param mv
	 * @param searchCondition
	 * @param searchValue
	 * @param page
	 * @return
	 */
	// 관리자 문의 조건별 검색
	@RequestMapping(value="/admin/adminQnaSearch.strap", method=RequestMethod.GET)
	public ModelAndView adminQnaSearchList(ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = aqService.getTotalCount(searchCondition, searchValue, null);
			int qnaLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)totalCount/qnaLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<AdminQna> aqList = aqService.printAllByValue(
					searchCondition, searchValue, currentPage, qnaLimit);
			if(!aqList.isEmpty()) {
				mv.addObject("aqList", aqList);
			}else {
				mv.addObject("aqList", null);
			}
				mv.addObject("urlVal", "adminQnaSearch");
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchValue", searchValue);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.setViewName("admin/adminQnaList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 문의 조건별 조회
	@RequestMapping(value="/admin/adminQnaSort.strap", method=RequestMethod.GET)
	public ModelAndView adminQnaSortList(ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam("qnaCode") String qnaCode
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int sortTotalCount = aqService.getTotalCount(searchCondition, searchValue, qnaCode);
			int qnaSortLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)sortTotalCount/qnaSortLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<AdminQna> aqList = aqService.printAllBySort(
					searchCondition, searchValue, qnaCode, currentPage, qnaSortLimit);
			if(!aqList.isEmpty()) {
				mv.addObject("aqList", aqList);
			}else {
				mv.addObject("aqList", null);
			}
				mv.addObject("urlVal", "adminQnaSort");
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchValue", searchValue);
				mv.addObject("totalCount", sortTotalCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("qnaCode", qnaCode);
				mv.setViewName("admin/adminQnaList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
		/**
	 * 
	 * @param mv
	 * @param qnaNo
	 * @param page
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	// 관리자 문의 페이지 조회
	@RequestMapping(value="/admin/adminQnaDetailView.strap", method=RequestMethod.GET)
	public ModelAndView adminQnaDetailView(ModelAndView mv
			, @RequestParam("qnaNo") Integer qnaNo
			, @RequestParam("page") Integer page
			, HttpSession session
			,HttpServletRequest request
			,HttpServletResponse response) {
		try {
			AdminQna adminQna = aqService.printOneByNo(qnaNo);
			mv.addObject("adminQna", adminQna);
			mv.addObject("page", page);
			mv.setViewName("admin/adminQnaDetailView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @param adminQna
	 * @param page
	 * @return
	 */
	// 관리자 답변 등록 & 수정
	@RequestMapping(value="/admin/registerAdminQna.strap", method=RequestMethod.POST)
	public ModelAndView registAdminQna(ModelAndView mv
			, @ModelAttribute AdminQna adminQna
			, @RequestParam("page") Integer page) {
		int result = aqService.registAdminQna(adminQna);
		if(result > 0) {
			mv.addObject("page", page);
			mv.setViewName("redirect:/admin/adminQnaListView.strap");
		} else {
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @param page
	 * @return
	 */
	// 남은 문의 갯수
	@RequestMapping(value="/admin/adminUnsolvedQna.strap", method=RequestMethod.GET)
	public ModelAndView adminUnsolvedQna(ModelAndView mv
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int unsolvedQnaCount = aqService.printAllqnaCount("","");
			int unsolvedQnaLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)unsolvedQnaCount/unsolvedQnaLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<AdminQna> aqList = aqService.printAllByUnsolvedQna(currentPage, unsolvedQnaLimit);
			if(!aqList.isEmpty()) {
				mv.addObject("aqList", aqList);
			}else {
				mv.addObject("aqList", null);
			}
				mv.addObject("urlVal", "adminUnsolvedQna");
				mv.addObject("totalCount", unsolvedQnaCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.setViewName("admin/adminQnaList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
}
