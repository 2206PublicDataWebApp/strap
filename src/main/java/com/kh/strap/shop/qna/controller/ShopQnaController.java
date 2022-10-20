package com.kh.strap.shop.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.shop.qna.service.ShopQnaService;

@Controller("ShopQnaController")
public class ShopQnaController {
	
/*상품문의(QNA_TBL)
 * 
 * C: -상품 상세 페이지
 * R: -상품 상세페이지
 *    -마이쇼핑-상품 문의
 * U: -상품문의는 수정이 불가하다.
 * D: -마이쇼핑-상품 문의
 * */
	
	@Autowired
	ShopQnaService qService;
	
	//상품문의리스트 이동
	@RequestMapping(value="/shopQna/list.strap", method=RequestMethod.GET)
	public ModelAndView viewShopQnaList(ModelAndView mv) {
		mv.setViewName("/shop/qnaList");
		return mv;
	}
	
	//문의작성ajax
	@RequestMapping(value="/shopQna/register.strap", method=RequestMethod.GET)
	public ModelAndView registerShopQna(ModelAndView mv) {
		return mv;
	}
}
