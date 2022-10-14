package com.kh.strap.shop.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.qna.service.ShopQnaService;

@Controller("ShopQnaController")
public class ShopQnaController {
	@Autowired
	ShopQnaService qService;
	
/*상품문의(QNA_TBL)
 * 
 * C: -상품 상세 페이지
 * R: -상품 상세페이지
 *    -마이쇼핑-상품 문의
 * U: -상품문의는 수정이 불가하다.
 * D: -마이쇼핑-상품 문의
 * */
}
