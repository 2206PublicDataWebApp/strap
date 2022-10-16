package com.kh.strap.shop.coupon.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.shop.coupon.domain.Coupon;
import com.kh.strap.shop.coupon.store.CouponStore;

@Repository
public class CouponStoreLogic implements CouponStore{

	@Override
	public int insertCoupon(SqlSession session, Coupon coupon) {
		return session.insert("CouponMapper.insertCoupon", coupon);
	}

	@Override
	public List<Coupon> selectCoupon(SqlSession session, Coupon coupon) {
		return session.selectList("CouponMapper.selectCoupon", coupon);
	}

	@Override
	public List<Coupon> selectMemberCoupon(SqlSession session, Coupon coupon) {
		//coupon값 활용할지 결정.조건문으로 return을 달리?
		return session.selectList("CouponMapper.selectMemberCoupon",coupon);
	}

	@Override
	public int deleteCoupon(SqlSession session, Coupon coupon) {
		return session.update("CouponMapper.deleteCoupon", coupon);
	}

	@Override
	public int insertMemberCoupon(SqlSession session, Coupon coupon) {
		return session.insert("CouponMapper.insertMemberCoupon", coupon);
	}

	@Override
	public int updateMemberCoupon(SqlSession session, Coupon coupon) {
		return session.update("CouponMapper.updateMemberCoupon", coupon);
	}


}
