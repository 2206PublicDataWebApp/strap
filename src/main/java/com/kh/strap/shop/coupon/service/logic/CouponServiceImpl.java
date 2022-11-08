package com.kh.strap.shop.coupon.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
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
	public List<Coupon> printCoupon(Paging paging,Search search) {
		return couponStore.selectCoupon(session, paging,search );
	}
	@Override
	public List<Coupon> printMemberCoupon(Coupon coupon,Paging paging) {
		return couponStore.selectMemberCoupon(session, coupon,paging);
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
	@Override
	public Coupon printCouponDetail(int couponNo) {
		return couponStore.selectCouponDetail(session, couponNo);
	}
	@Override
	public int getTotalCouponCount(Search search) {
		return couponStore.selectTotalCouponCount(session, search);
	}
	@Override
	public int getMemberCouponCount(Coupon coupon) {
		return couponStore.selectMemberCouponCount(session, coupon);
	}
}
