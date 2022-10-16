package com.kh.strap.shop.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value="/review/list.strap", method=RequestMethod.GET)
	public ModelAndView viewReviewList(ModelAndView mv) {
		return mv;
	}
	
	//후기작성ajax
	@RequestMapping(value="/review/register.strap", method=RequestMethod.GET)
	public ModelAndView registerReview(ModelAndView mv) {
		return mv;
	}
	
	//상품후기 삭제
	@RequestMapping(value="/review/remove.strap", method=RequestMethod.GET)
	public ModelAndView removeReview(ModelAndView mv) {
		return mv;
	}
}
