package com.kh.strap.shop.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.cart.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService cService;
	
/*장바구니(CART_TBL)
 * 
 * C: -장바구니 담기
 * R: -장바구니 목록 조회
 * U: -장바구니 상품 수량 변경
 * D: -장바구니 상품 삭제
 * */
	
	
	
}
