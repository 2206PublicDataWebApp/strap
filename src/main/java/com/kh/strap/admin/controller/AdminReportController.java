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

import com.kh.strap.admin.domain.AdminReport;
import com.kh.strap.admin.service.AdminReportService;

@Controller
public class AdminReportController {
	@Autowired
	private AdminReportService arService;
	
	/**
	 * 
	 * @param mv
	 * @param page
	 * @return
	 */
	// 관리자 신고 리스트 조회
	@RequestMapping(value="/admin/adminReportListView.strap", method=RequestMethod.GET)
	public ModelAndView showAdminReportList(ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = arService.getTotalCount("","", null);
		int adminReportLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/adminReportLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<AdminReport> arList = arService.printAllAdminReportList(currentPage, adminReportLimit);
		System.out.println(arList);
		if(!arList.isEmpty()) {
			mv.addObject("urlVal", "adminReportListView");
			mv.addObject("totalCount", totalCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("arList", arList);
		}
		mv.setViewName("admin/adminReportList");
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @param searchCondition
	 * @param searchValue
	 * @param page
	 * @return
	 */
	// 관리자 신고 조건별 검색
	@RequestMapping(value="/admin/adminReportSearch.strap", method=RequestMethod.GET)
	public ModelAndView adminReportSearchList(ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam("contentsCode") String contentsCode
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = arService.getTotalCount(searchCondition, searchValue, null);
			int reportLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)totalCount/reportLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<AdminReport> arList = arService.printAllByValue(
					searchCondition, searchValue, currentPage, reportLimit);
			if(!arList.isEmpty()) {
				mv.addObject("arList", arList);
			}else {
				mv.addObject("arList", null);
			}
				mv.addObject("urlVal", "adminReportSearch");
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchValue", searchValue);
				mv.addObject("totalCount", totalCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.setViewName("admin/adminReportList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @param searchCondition
	 * @param searchValue
	 * @param ReportCode
	 * @param page
	 * @return
	 */
	// 관리자 신고 조건별 조회
	@RequestMapping(value="/admin/adminReportSort.strap", method=RequestMethod.GET)
	public ModelAndView adminReportSortList(ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam("contentsCode") String contentsCode
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int sortTotalCount = arService.getTotalCount(searchCondition, searchValue, contentsCode);
			System.out.println("조건별 조회 : " + sortTotalCount);
			int reportSortLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)sortTotalCount/reportSortLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<AdminReport> arList = arService.printAllBySort(
					searchCondition, searchValue, contentsCode, currentPage, reportSortLimit);
			if(!arList.isEmpty()) {
				mv.addObject("arList", arList);
			}else {
				mv.addObject("arList", null);
			}
				mv.addObject("urlVal", "adminReportSort");
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchValue", searchValue);
				mv.addObject("totalCount", sortTotalCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startNavi", startNavi);
				mv.addObject("endNavi", endNavi);
				mv.addObject("contentsCode", contentsCode);
				mv.setViewName("admin/adminReportList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
		/**
	 * 
	 * @param mv
	 * @param ReportNo
	 * @param page
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	// 관리자 신고 페이지 조회
	@RequestMapping(value="/admin/adminReportDetailView.strap", method=RequestMethod.GET)
	public ModelAndView adminReportDetailView(ModelAndView mv
			, @RequestParam("reportNo") Integer reportNo
			, @RequestParam("page") Integer page
			, HttpSession session
			,HttpServletRequest request
			,HttpServletResponse response) {
		try {
			AdminReport adminReport = arService.printOneByNo(reportNo);
			mv.addObject("adminReport", adminReport);
			mv.addObject("page", page);
			mv.setViewName("admin/adminReportDetailView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관리자 신고 처리
		@RequestMapping(value="/admin/processAdminReport.strap", method=RequestMethod.POST)
		public ModelAndView processAdminReport(ModelAndView mv
				, @ModelAttribute AdminReport adminReport
				, @RequestParam("reportNo") Integer reportNo
				, @RequestParam("page") Integer page
				, HttpSession session
				,HttpServletRequest request
				,HttpServletResponse response) {
			try {
				int result = arService.registReportProcess(adminReport);
				mv.addObject("adminReport", adminReport);
				mv.addObject("page", page);
				mv.setViewName("redirect:/admin/adminReportDetailView.strap");
			} catch (Exception e) {
				mv.addObject("msg", e.toString());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
	
}
