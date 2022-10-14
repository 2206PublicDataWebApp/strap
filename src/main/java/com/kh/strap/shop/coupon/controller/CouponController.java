package com.kh.strap.shop.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.coupon.service.CouponService;

@Controller
public class CouponController {
	@Autowired
	CouponService couponService;
	
	
/*쿠폰등록(COUPON_TBL)
 * 
 * C: -관리자 쿠폰 등록
 * R: -메인배너 노출
 * 	  -관리자 쿠폰 관리페이지
 * 	  -상품 상세페이지
 *    -상품 결제 페이지
 * U: -쿠폰은 수정할 수 없다. 지우고 재등록.
 * D: -관리자 쿠폰 삭제
 * */

	
/*회원 쿠폰 발급(MEMBER_COUPON_TBL)
 * 
 * C: -메인 베너를 통한 쿠폰 발급
 * R: -상품 결제 페이지
 * U: -쿠폰 사용 시 USE_YN 'Y'
 * */
	
}
