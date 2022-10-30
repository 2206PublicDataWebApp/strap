package com.kh.strap.admin.controller;

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

import com.kh.strap.admin.domain.Banner;
import com.kh.strap.admin.service.BannerService;


@Controller
public class BannerController {
	@Autowired
	private BannerService bnService;
	
	/**
	 * 
	 * @param mv
	 * @return
	 */
	// 관리자 배너 페이지 조회
	@RequestMapping(value="/admin/bannerListView.strap", method=RequestMethod.GET)
	public ModelAndView showBannerList(ModelAndView mv) {
		List<Banner> bnList = bnService.printAllBanner();
		mv.addObject("bnList", bnList);
		mv.setViewName("admin/adminBanner");
		return mv;
	}
	/**
	 * 
	 * @param mv
	 * @param bannerTitle
	 * @param uploadFile
	 * @param request
	 * @return
	 */
	// 관리자 배너 등록
	@RequestMapping(value="/admin/registerBanner.strap", method=RequestMethod.POST)
	public ModelAndView registBannerList(ModelAndView mv
			,@RequestParam("bannerTitle") String bannerTitle
			,@RequestParam(value="bannerFilename", required=false) MultipartFile uploadFile
			, HttpServletRequest request) {
			Banner banner = new Banner();
			banner.setBannerTitle(bannerTitle);
		try {
			String bannerFilename = uploadFile.getOriginalFilename();
			if(!bannerFilename.equals("")) {
				//////////////////////////////////////////////////////////////////////경로, 파일이름 설정
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\bnuploadFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String bannerFileRename = sdf.format(new Date(System.currentTimeMillis()))+ "." // 시간
						+ bannerFilename.substring(bannerFilename.lastIndexOf(".")+1); // 확장자명
				// 1.png, img.png
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}
				//////////////////////////////////////////////////////////////////////
				uploadFile.transferTo(new File(savePath+"\\"+bannerFileRename)); // 저장할때는 Rename으로 저장
				// 파일을 buploadFiles 경로에 저장하는 메소드
				String bannerFilepath = savePath + "\\" + bannerFileRename;
				banner.setBannerFilename(bannerFilename);
				banner.setBannerFileRename(bannerFileRename);
				banner.setBannerFilepath(bannerFilepath);
			}
			int result = bnService.registBanner(banner);
			mv.setViewName("redirect:/admin/bannerListView.strap");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 
	 * @param banner
	 * @param mv
	 * @param reloadFile
	 * @param request
	 * @return
	 */
	// 관리자 배너 수정
	@RequestMapping(value="/admin/modifyBanner.strap", method=RequestMethod.POST)
	public ModelAndView modifyBanner(@ModelAttribute Banner banner, ModelAndView mv
			, @RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
			, HttpServletRequest request) {
		System.out.println(banner);
		try {
			String bannerFilename = reloadFile.getOriginalFilename();
			if(reloadFile != null && !bannerFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\bnuploadFiles";
				File file = new File(savePath + "\\" + banner.getBannerFileRename());
				if(file.exists()) {
					file.delete();
				}
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String bannerFileRename = sdf.format(new Date(System.currentTimeMillis()))
						+ "." + bannerFilename.substring(bannerFilename.lastIndexOf(".")+1);
				String bannerFilepath = savePath + "\\" + bannerFileRename;
				reloadFile.transferTo(new File(bannerFilepath));
				banner.setBannerFilename(bannerFilename);
				banner.setBannerFileRename(bannerFileRename);
				banner.setBannerFilepath(bannerFilepath);
			}
			int result = bnService.modifyBanner(banner);
			mv.setViewName("redirect:/admin/bannerListView.strap");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 
	 * @param mv
	 * @param bnNoList
	 * @return
	 */
	// 관리자 배너 삭제
	@RequestMapping(value="/admin/deleteBanner.strap", method=RequestMethod.POST)
	public ModelAndView removeBanner(ModelAndView mv
			,@RequestParam("bnNoList") String bnNoList
			) {
		System.out.println(bnNoList);
		String[] bnNoListArr = bnNoList.split(",");
		for(int i = 0; i < bnNoListArr.length; i++) {
			int bannerNo = Integer.parseInt(bnNoListArr[i]);
			System.out.println(bannerNo);
			int result = bnService.removeBanner(bannerNo);
		}
		mv.setViewName("redirect:/admin/bannerListView.strap");
		return mv;
	}
}
