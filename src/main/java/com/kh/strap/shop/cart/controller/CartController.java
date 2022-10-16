package com.kh.strap.shop.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.shop.cart.service.CartService;

@Controller
public class CartController {
	
/*장바구니(CART_TBL)
 * 
 * C: -장바구니 담기
 * R: -장바구니 목록 조회
 * U: -장바구니 상품 수량 변경
 * D: -장바구니 상품 삭제
 * */

	@Autowired
	CartService cService;
	
	//장바구니 담기
	@RequestMapping(value="/cart/register.strap", method=RequestMethod.GET)
	public ModelAndView registerCart(ModelAndView mv) {
		return mv;
	}
	
	//장바구니->기존 페이지 이동
	@RequestMapping(value="/cart/before.strap", method=RequestMethod.GET)
	public ModelAndView viewPageBeforeCart(ModelAndView mv) {
		return mv;
	}
	
	//장바구니 수량 변경 ajax
	@RequestMapping(value="cart/modify.strap", method=RequestMethod.GET)
	public ModelAndView modifyQtyCart(ModelAndView mv) {
		return mv;
	}
	
	//장바구니 삭제 ajax
	@RequestMapping(value="cart/remove.strap", method=RequestMethod.GET)
	public ModelAndView removeCart(ModelAndView mv) {
		return mv;
	}
	
	
}
