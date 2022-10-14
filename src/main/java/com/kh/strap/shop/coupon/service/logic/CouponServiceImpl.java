package com.kh.strap.shop.coupon.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.shop.coupon.service.CouponService;
import com.kh.strap.shop.coupon.store.CouponStore;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	CouponStore couponStore;
	@Autowired
	SqlSession session;
	
}
