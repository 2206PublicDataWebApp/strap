package com.kh.strap.shop.coupon.service;

import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.coupon.domain.Coupon;

public interface CouponService {
	//쿠폰관리
	//1.관리자 메뉴에서 신규 쿠폰을 INSERT한다.
	public int registerCoupon(Coupon coupon);
	//2.메인 배너 및 쿠폰 관리페이지에서 쿠폰을 SELECT한다. WHERE 조건에 COUPON_RUN_YN으로 구분한다.
	public List<Coupon> printCoupon(Paging paging,Search search);
	//3.결제페이지에서 회원의 쿠폰목록을 SELECT한다. 사용가능한 쿠폰 여부를 체크해야한다.
	public List<Coupon> printMemberCoupon(Coupon coupon,Paging paging);
	// 쿠폰 상세 조회
	public Coupon printCouponDetail(int couponNo);
	//4.관리자 메뉴에서 쿠폰을 삭제하면 update로 COUPON_RUN_YN 을 N으로 변경한다.
	
	//
	public int getTotalCouponCount(Search search);
	public int getMemberCouponCount(Coupon coupon);
	
	public int removeCoupon(Coupon coupon);
	
	//회원쿠폰
	//sysdate + 유효기간
	//1.회원이 메인배너에서 쿠폰 발급 시 회원쿠폰에 INSERT한다.
	public int registerMemberCoupon(Coupon coupon);
	//2.회원이 쿠폰 사용 시 쿠폰사용여부를 Y로 변경한다.
	public int modifyMemberCoupon(Coupon coupon);
}
