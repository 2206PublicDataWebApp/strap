package com.kh.strap.shop.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.cart.domain.Cart;
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
	@ResponseBody
	@RequestMapping(value="/cart/register.strap", method=RequestMethod.POST)
	public String registerCart(
			@ModelAttribute Cart cart) {
		if(cService.registerCart(cart)>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	//장바구니로 이동
	@RequestMapping(value="/cart/cartView.strap",method=RequestMethod.GET)
	public ModelAndView viewCart(ModelAndView mv,
			Cart cart,
			HttpSession session){
		cart.setMemberId(((Member)session.getAttribute("loginUser")).getMemberId());
		List<Cart> cList = cService.printCart(cart);
		if(!cList.isEmpty()) {
			mv.addObject("cList",cList).
			setViewName("/shop/cart");
		}else {
			mv.addObject("cList",null).
			setViewName("/shop/cart");
		}
		return mv;
	}
	
	//장바구니->기존 페이지 이동
	@RequestMapping(value="/cart/before.strap", method=RequestMethod.GET)
	public ModelAndView viewPageBeforeCart(ModelAndView mv) {
		return mv;
	}
	
	//장바구니 수량 변경 ajax
	@ResponseBody
	@RequestMapping(value="/cart/modify.strap", method=RequestMethod.GET)
	public String modifyQtyCart(
			@ModelAttribute Cart cart) {
		if(cService.modifyToQtyCart(cart)>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//장바구니 삭제 ajax
	@ResponseBody
	@RequestMapping(value="/cart/remove.strap", method=RequestMethod.GET)
	public String removeCart(
			@ModelAttribute Cart cart) {
		return "";
	}
	
	
}
