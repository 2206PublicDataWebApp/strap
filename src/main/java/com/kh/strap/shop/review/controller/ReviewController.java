package com.kh.strap.shop.review.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.review.domain.Review;
import com.kh.strap.shop.review.service.ReviewService;

@Controller
public class ReviewController {

/*구매 후기(REIVEW_TBL)
 * 
 * C: -상품 상세 페이지
 * R: -상품 상세페이지
 *    -마이쇼핑-상품 후기
 * U: -상품후기는 수정이 불가하다.
 * D: -마이쇼핑-상품 후기
 * */
	
	@Autowired
	ReviewService rService;
	
	//상품후기리스트 이동
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView viewReviewList(ModelAndView mv) {
		
		mv.setViewName("/shop/reviewList");
		return mv;
	}
	
	//상품상세페이지 내 상품후기 리스트 출력(정렬:최신순,평점순,내 후기)
	@ResponseBody
	@RequestMapping(value="/review/detail/list.strap",produces="application/json;charset=utf-8",method=RequestMethod.POST)
	public String viewReviewListOnDetail(
			@RequestParam(value="page",required=false) Integer currentPage,
			@ModelAttribute Search search
			) {
		int page = (currentPage != null)? currentPage : 1;
		Paging paging = new Paging(rService.countReview(search), page, 5, 5);
		List<Review> rList = rService.printReview(paging, search);
		return new Gson().toJson(rList);
	}
	
	//마이쇼핑 회원 후기 리스트 출력(필터: 날짜)
	@RequestMapping(value="/review/list.strap",method=RequestMethod.GET)
	public ModelAndView viewMemberReviewList(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false) Integer currentPage,
			HttpSession session) {
		int page = (currentPage != null)? currentPage: 1;
		System.out.println(search.toString());
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		search.setMemberId(loginUser.getMemberId());
		Paging paging = new Paging(rService.countMemberReview(search), page, 10, 5);
		List<Review> rList = rService.printMemberReview(paging, search);
		
		mv.addObject("rList",rList).
		addObject("search",search).
		addObject("paging",paging).
		setViewName("/shop/reviewList");
		return mv;
	}
	
	
	
	//후기작성ajax
	@ResponseBody
	@RequestMapping(value="/review/register.strap", method=RequestMethod.POST)
	public String registerReview(
			@ModelAttribute Review review,
			@RequestParam(value="reviewImg",required=false)MultipartFile multipartImg,
			HttpSession session) {
		MultipartFile rImg = (multipartImg != null) ? multipartImg : null;
		
		//경로, 파일리네임, 파일저장, review등록, update연쇄동작..
		String now = new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis());
		String savePath = session.getServletContext().getRealPath("resources")+"\\image\\review";
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		try {
			String reviewImgName = rImg.getOriginalFilename();
			String extension = reviewImgName.substring(reviewImgName.lastIndexOf(".")+1);
			String reviewImgRename = now + "_review"+ extension;
			
			review.setReviewImgName(reviewImgName);
			review.setReviewImgRename(reviewImgRename);
			review.setReviewImgRoot("/resources/image/review/"+reviewImgRename);
			rImg.transferTo(new File(savePath+"\\"+reviewImgRename));
			
			if(rService.registerReview(review) > 0) {
				return "sucess";
			}else {
				return "fail";
			}
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	//상품후기 삭제
	@RequestMapping(value="/review/remove.strap", method=RequestMethod.GET)
	public ModelAndView removeReview(ModelAndView mv) {
		return mv;
	}
}
