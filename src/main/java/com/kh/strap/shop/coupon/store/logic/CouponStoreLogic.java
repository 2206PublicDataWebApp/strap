package com.kh.strap.shop.coupon.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.coupon.domain.Coupon;
import com.kh.strap.shop.coupon.domain.MemberCoupon;
import com.kh.strap.shop.coupon.store.CouponStore;
import com.kh.strap.shop.product.domain.Order;

@Repository
public class CouponStoreLogic implements CouponStore{

	@Override
	public int insertCoupon(SqlSession session, Coupon coupon) {
		return session.insert("CouponMapper.insertCoupon", coupon);
	}

	@Override
	public List<Coupon> selectCoupon(SqlSession session, Paging paging, Search search) {
		return session.selectList("CouponMapper.selectCoupon", search,new RowBounds(paging.getOffset(), paging.getPageLimit()));
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
	public int updateMemberCoupon(SqlSession session, Order order) {
		return session.update("CouponMapper.updateMemberCoupon", order);
	}

	@Override
	public int selectTotalCouponCount(SqlSession session, Search search) {
		return session.selectOne("CouponMapper.selectCouponCount",search);
	}

	@Override
	public int selectMemberCouponCount(SqlSession session, Coupon coupon) {
		return session.selectOne("CouponMapper.selectMemberCouponCount",coupon);
	}

	@Override
	public Coupon selectCouponDetail(SqlSession session, int couponNo) {
		return session.selectOne("CouponMapper.selectCouponDetail",couponNo);
	}

	@Override
	public int selectAlreadyCouponCheck(SqlSession session, Coupon Coupon) {
		return session.selectOne("CouponMapper.selectAlreadyCouponCheck",Coupon);
	}



}
