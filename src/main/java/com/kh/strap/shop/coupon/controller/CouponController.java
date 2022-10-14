package com.kh.strap.shop.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.coupon.service.CouponService;

@Controller
public class CouponController {
	@Autowired
	CouponService couponService;
	
}
