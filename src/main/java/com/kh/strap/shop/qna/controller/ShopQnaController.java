package com.kh.strap.shop.qna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.qna.domain.ShopQna;
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
	
	//마이쇼핑 회원 문의 리스트 출력(필터: 날짜)
	@RequestMapping(value="/shopQna/list.strap",method=RequestMethod.GET)
	public ModelAndView viewMemberReviewList(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false) Integer currentPage,
			HttpSession session) {
		int page = (currentPage != null)? currentPage: 1;
		System.out.println(search.toString());
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		search.setMemberId(loginUser.getMemberId());
		Paging paging = new Paging(qService.countMemberShopQna(search), page, 10, 5);
		List<ShopQna> sqList = qService.printShopQnaByMemberId(paging, search);
		
		mv.addObject("sqList",sqList).
		addObject("search",search).
		addObject("paging",paging).
		setViewName("/shop/shopQnaList");
		return mv;
	}
	
	
	
	
	
	
	
	
	//문의작성ajax
	@RequestMapping(value="/shopQna/register.strap", method=RequestMethod.GET)
	public ModelAndView registerShopQna(ModelAndView mv) {
		return mv;
	}
}
