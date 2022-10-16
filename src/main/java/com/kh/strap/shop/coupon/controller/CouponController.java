package com.kh.strap.shop.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.shop.coupon.service.CouponService;

@Controller
public class CouponController {
	
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
	
	@Autowired
	CouponService couponService;
	
	//메인베너 쿠폰 리스트
	@RequestMapping(value="/coupon/banner.strap", method=RequestMethod.GET)
	public ModelAndView printCouponBanner(ModelAndView mv) {
		return mv;
	}
	
	//쿠폰관리페이지 이동
	@RequestMapping(value="/admin/coupon.strap", method=RequestMethod.GET)
	public ModelAndView viewManageCoupon(ModelAndView mv) {
		return mv;
	}
	
	//쿠폰등록페이지 이동
	@RequestMapping(value="/admin/coupon/register.strap", method=RequestMethod.GET)
	public ModelAndView viewRegisterCoupon(ModelAndView mv) {
		return mv;
	}
	
	//쿠폰 삭제ajax
	@RequestMapping(value="/admin/coupon/remove.strap", method=RequestMethod.GET)
	public ModelAndView removeCoupon(ModelAndView mv) {
		return mv;
	}
	
	//회원쿠폰발급
	@RequestMapping(value="/member/coupon/register.strap", method=RequestMethod.GET)
	public ModelAndView registerMemberCoupon(ModelAndView mv) {
		return mv;
	}
	
}
