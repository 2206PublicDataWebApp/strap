package com.kh.strap.shop.coupon.service;

import java.util.List;

import com.kh.strap.shop.coupon.domain.Coupon;

public interface CouponService {
	//쿠폰관리
	public int registerCoupon(Coupon coupon);
	public List<Coupon> printCoupon(Coupon coupon);
	public List<Coupon> printMemberCoupon(Coupon coupon);
	public int removeCoupon(Coupon coupon);
	
	//회원쿠폰
	//sysdate + 유효기간
	public int registerMemberCoupon(Coupon coupon);
	public int modifyMemberCoupon(Coupon coupon);
	


	
	
}
