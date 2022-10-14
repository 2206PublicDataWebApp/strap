package com.kh.strap.shop.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService rService;
	
/*구매 후기(REIVEW_TBL)
 * 
 * C: -상품 상세 페이지
 * R: -상품 상세페이지
 *    -마이쇼핑-상품 후기
 * U: -상품후기는 수정이 불가하다.
 * D: -마이쇼핑-상품 후기
 * */
}
