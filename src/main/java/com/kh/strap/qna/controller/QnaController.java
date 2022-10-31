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
//	@RequestMapping(value="/qna/registerQna.strap", method=RequestMethod.POST)
//	public ModelAndView registQna(ModelAndView mv
//			, @ModelAttribute Qna qna
//			, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		Admin admin = (Admin)session.getAttribute("loginUser");
//		String adminName = admin.getAdminName();
//		notice.setNoticeWriter(adminName);
//		try {
//			String noticeFilename = uploadFile.getOriginalFilename();
//			if(!noticeFilename.equals("")) {
//				String root = request.getSession().getServletContext().getRealPath("resources");
//				String savePath = root + "\\nuploadFiles";
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//				String noticeFileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+noticeFilename.substring(noticeFilename.lastIndexOf(".")+1);
//				File file = new File(savePath);
//				if(!file.exists()) { 
//					file.mkdir();
//				}
//				uploadFile.transferTo(new File(savePath+"\\"+noticeFileRename));
//				String noticeFilepath = savePath+"\\"+noticeFileRename;
//				notice.setNoticeFilename(noticeFilename);
//				notice.setNoticeFileRename(noticeFileRename);
//				notice.setNoticeFilepath(noticeFilepath); 
//			}
//			int result = nService.registerNotice(notice);
//			request.setAttribute("msg","(관리자) 공지사항이 등록되었습니다.");
//			request.setAttribute("url","/admin/noticeListView.strap");
//			mv.setViewName("/common/alert");
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("common/errorPage");
//		}
//		return mv;
//	}
	
	
}
