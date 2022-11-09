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
import org.springframework.security.crypto.password.PasswordEncoder;

import com.kh.strap.admin.domain.Admin;
import com.kh.strap.admin.domain.Notice;
import com.kh.strap.admin.service.AdminService;
import com.kh.strap.admin.service.NoticeService;
import com.kh.strap.board.domain.Board;
import com.kh.strap.member.domain.Member;
import com.kh.strap.member.service.MemberService;


@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private MemberService mService;
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
	public String showAdminMain(@ModelAttribute Member member, HttpServletRequest request) {
		String encodePwd = aService.adminPwdById(member.getMemberId());
		if(passwordEncoder.matches(member.getMemberPwd(), encodePwd)) {
			//로그인 시 세션등록
			Member mOne = aService.adminById(member.getMemberId());
			mOne.setMemberPwd(null);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", member);
			return "성공";
		} else {
			return "실패";
		}
//		if(loginAdmin != null) {
//			loginAdmin.setMemberPwd(null);
//			HttpSession session = request.getSession();
//			session.setAttribute("loginUser", loginAdmin);
//			return "성공";
//		} else {
//			return "실패";
//		}
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
}
