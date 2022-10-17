package com.kh.strap.shop.coupon.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.shop.coupon.domain.Coupon;
import com.kh.strap.shop.coupon.service.CouponService;
import com.kh.strap.shop.coupon.store.CouponStore;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	CouponStore couponStore;
	@Autowired
	SqlSession session;
	@Override
	public int registerCoupon(Coupon coupon) {
		return couponStore.insertCoupon(session, coupon);
	}
	@Override
	public List<Coupon> printCoupon(Coupon coupon) {
		return couponStore.selectCoupon(session, coupon);
	}
	@Override
	public List<Coupon> printMemberCoupon(Coupon coupon) {
		return couponStore.selectMemberCoupon(session, coupon);
	}
	@Override
	public int removeCoupon(Coupon coupon) {
		return couponStore.deleteCoupon(session, coupon);
	}
	@Override
	public int registerMemberCoupon(Coupon coupon) {
		return couponStore.insertMemberCoupon(session, coupon);
	}
	@Override
	public int modifyMemberCoupon(Coupon coupon) {
		return couponStore.updateMemberCoupon(session, coupon);
	}
	
}
