package com.kh.strap.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.admin.domain.Admin;
import com.kh.strap.admin.domain.Notice;
import com.kh.strap.admin.service.AdminService;
import com.kh.strap.admin.service.NoticeService;
import com.kh.strap.board.domain.Board;
import com.kh.strap.member.domain.Member;


@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	
	/**
	 * 
	 * @param mv
	 * @return
	 */
	// 관리자 로그인 메인
	@RequestMapping(value="/admin/loginView.strap", method=RequestMethod.GET)
	public ModelAndView showAdminLogin(ModelAndView mv) {
		mv.setViewName("admin/adminLogin");
		return mv;
	}
	
	/**
	 * 
	 * @param admin
	 * @return
	 */
	// 로그인 기능 
	@ResponseBody
	@RequestMapping(value="/admin/login.strap", produces="text/plain;charset=utf-8", method=RequestMethod.POST)
	public String showAdminMain(@ModelAttribute Admin admin, HttpServletRequest request) {
		Admin loginAdmin = aService.loginAdmin(admin);
		if(loginAdmin != null) {
			loginAdmin.setAdminPwd(null);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginAdmin);
			return "성공";
		} else {
			return "실패";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/admin/logout.strap")
	public ModelAndView adminLogout(ModelAndView mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		mv.setViewName("admin/adminLogin");
		return mv;
	}
	
	
	
	/**
	 * 
	 * @param mv
	 * @return
	 */
	// 관리자 메인페이지 >>>> ※※※※디자인, 기능 추가 함※※※※※
	@RequestMapping(value="/admin/mainView.strap", method=RequestMethod.GET)
	public ModelAndView showAdminMain(ModelAndView mv) {
		mv.setViewName("admin/adminMain");
		return mv;
	}
	
	
	
	
//	// 문의 조회
//	@RequestMapping(value="/admin/adminQnaList.strap", method=RequestMethod.GET)
//	public ModelAndView adminQnaListView(ModelAndView mv
//			,@RequestParam(value="page", required=false) Integer page) {
//		int currentPage = (page != null) ? page : 1;
//		int totalCount = aqService.getTotalCount("","");
//		int boardLimit = 10;
//		int noticeLimit = 5;
//		int naviLimit = 5;
//		int maxPage;
//		int startNavi;
//		int endNavi;
//		maxPage = (int)((double)totalCount/boardLimit + 0.9);
//		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
//		endNavi = startNavi + naviLimit - 1;
//		if(maxPage < endNavi) {
//			endNavi = maxPage;
//		}
//		List<Board> bList = bService.printAllBoard(currentPage, boardLimit);
//		List<Notice> nList = nService.printNoticeList(currentPage, noticeLimit);
//		
//		if(!bList.isEmpty()) {
//			mv.addObject("urlVal", "list");
//			mv.addObject("maxPage", maxPage);
//			mv.addObject("currentPage", currentPage);
//			mv.addObject("startNavi", startNavi);
//			mv.addObject("endNavi", endNavi);
//			mv.addObject("bList", bList);
//			mv.addObject("nList", nList);
//		}
//		mv.setViewName("board/boardListView");
//		return mv;
//	}
	
	
	
	
	
	
	
}
