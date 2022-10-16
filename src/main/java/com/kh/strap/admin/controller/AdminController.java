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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.admin.domain.Admin;
import com.kh.strap.admin.domain.Notice;
import com.kh.strap.admin.service.logic.AdminServiceImpl;
import com.kh.strap.admin.service.logic.NoticeServiceImpl;


@Controller
public class AdminController {
	@Autowired
	private AdminServiceImpl aService;
	@Autowired
	private NoticeServiceImpl nService;
	/**
	 * 
	 * @param mv
	 * @return
	 */
	// 관리자 로그인 메인
	@RequestMapping(value="/admin/adminLoginView.strap", method=RequestMethod.GET)
	public ModelAndView showAdminLogin(ModelAndView mv) {
		mv.setViewName("admin/adminLogin");
		return mv;
	}
	
	/**
	 * 
	 * @param admin
	 * @return
	 */
	// 로그인 기능 >>>> ※※※※세션 추가해야 함※※※※※
	@ResponseBody
	@RequestMapping(value="/admin/login.strap", produces="text/plain;charset=utf-8", method=RequestMethod.POST)
	public String showAdminMain(@ModelAttribute Admin admin) {
		
		Admin loginAdmin = aService.loginAdmin(admin);
		System.out.println(loginAdmin);
		if(loginAdmin != null) {
			return "성공";
//			mv.addObject("adminId", admin.getAdminId());
//			mv.setViewName("admin/adminMain");
			
		} else {
			return "실패";
		}
	}
	
	/**
	 * 
	 * @param mv
	 * @return
	 */
	// 관리자 메인페이지 >>>> ※※※※디자인, 기능 추가 함※※※※※
	@RequestMapping(value="/admin/adminMainView.strap", method=RequestMethod.GET)
	public ModelAndView showAdminMain(ModelAndView mv) {
		mv.setViewName("admin/adminMain");
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @param page
	 * @return
	 */
	// 관리자 공지사항 리스트
	@RequestMapping(value="/admin/adminNoticeListView.strap", method=RequestMethod.GET)
	public ModelAndView showAdminNoticeList(ModelAndView mv
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
		List<Notice> nList = nService.printNoticeList(currentPage, noticeLimit);
		if(!nList.isEmpty()) {
			mv.addObject("urlVal", "adminNoticeListView");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("noticeLimit", noticeLimit);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("nList", nList);
		}
		mv.setViewName("admin/adminNoticeList");
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @return
	 */
	// 관리자 공지사항 작성페이지
	@RequestMapping(value="/admin/writeView.strap", method=RequestMethod.GET)
	public ModelAndView showAdminNoticeWrite(ModelAndView mv) {
		mv.setViewName("admin/adminNoticeWrite");
		return mv;
	}
	/**
	 * 
	 * @param mv
	 * @param notice
	 * @param uploadFile
	 * @param request
	 * @return
	 */
	// 관리자 공지사항 작성
	@RequestMapping(value="/admin/registerNotice.strap", method=RequestMethod.POST)
	public ModelAndView registNotice(ModelAndView mv
			, @ModelAttribute Notice notice
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request) {
		try {
			String noticeFilename = uploadFile.getOriginalFilename();
			if(!noticeFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\nuploadFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String noticeFileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+noticeFilename.substring(noticeFilename.lastIndexOf(".")+1);
				File file = new File(savePath);
				if(!file.exists()) { 
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath+"\\"+noticeFileRename));
				String noticeFilepath = savePath+"\\"+noticeFileRename;
				notice.setNoticeFilename(noticeFilename);
				notice.setNoticeFileRename(noticeFileRename);
				notice.setNoticeFilepath(noticeFilepath); 
			}
			int result = nService.registerNotice(notice);
			request.setAttribute("msg","(관리자) 공지사항이 등록되었습니다.");
			request.setAttribute("url","/admin/adminNoticeListView.strap");
			mv.setViewName("/common/alert");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @param noticeNo
	 * @param page
	 * @param session
	 * @return
	 */
	// 관리자 공지사항 조회
	@RequestMapping(value="/admin/noticeDetailView.strap", method=RequestMethod.GET)
	public ModelAndView noticeDetailView(ModelAndView mv
			, @RequestParam("noticeNo") Integer noticeNo
			, @RequestParam("page") Integer page
			, HttpSession session
			,HttpServletRequest request
			,HttpServletResponse response) {
		try {
			Notice notice = nService.printOneByNo(noticeNo);
			session.setAttribute("noticeNo", notice.getNoticeNo());
			mv.addObject("notice", notice);
			mv.addObject("page", page);
			
			Cookie [] cookies = request.getCookies();
			// 비교하기 위해 새로운 쿠키
	        Cookie viewCookie = null;
	        
	        // 쿠키가 있을 경우 
	        if (cookies != null && cookies.length > 0) {
	            for (int i = 0; i < cookies.length; i++) {
	                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
	                if (cookies[i].getName().equals("cookie" + noticeNo)) { 
	                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
	                    viewCookie = cookies[i];
	                }
	            }
	        }
	        if (notice != null) {
	            System.out.println("System - 해당 상세 리뷰페이지로 넘어감");	    
	            mv.addObject("page", page);
	        	mv.addObject("notice", notice);
	            // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
	            if (viewCookie == null) {    
	                System.out.println("cookie 없음");	                
	                // 쿠키 생성(이름, 값)
	                Cookie newCookie = new Cookie("cookie"+noticeNo, "|" + noticeNo + "|");
	                // 쿠키 추가
	                response.addCookie(newCookie);
	                int result = nService.viewUp(noticeNo);
	                if(result>0) {
	                    System.out.println("조회수 증가");
	                } else {
	                    System.out.println("조회수 증가 에러");
	                }
	            } else { // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
	                System.out.println("cookie 있음");
	                // 쿠키 값 받아옴.
	                String value = viewCookie.getValue();
	                System.out.println("cookie 값 : " + value);
	            }
	        }
			mv.setViewName("admin/adminNoticeDetailView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
		}
	
}
