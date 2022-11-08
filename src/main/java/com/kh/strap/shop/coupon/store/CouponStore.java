package com.kh.strap.shop.coupon.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.coupon.domain.Coupon;

public interface CouponStore {
	//쿠폰관리
	public int insertCoupon(SqlSession session,Coupon coupon);
	public List<Coupon> selectCoupon(SqlSession session,Paging paging,Search search);
	public List<Coupon> selectMemberCoupon(SqlSession session,Coupon coupon,Paging paging);
	public Coupon selectCouponDetail(SqlSession session, int couponNo);
	
	public int selectTotalCouponCount(SqlSession session,Search search);
	public int selectMemberCouponCount(SqlSession session,Coupon coupon);
	
	public int deleteCoupon(SqlSession session,Coupon coupon);
	
	//회원쿠폰
	//sysdate + 유효기간
	public int insertMemberCoupon(SqlSession session,Coupon coupon);
	public int updateMemberCoupon(SqlSession session,Coupon coupon);
	
}
