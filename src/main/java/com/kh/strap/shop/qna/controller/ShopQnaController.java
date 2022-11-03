package com.kh.strap.shop.qna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.service.ProductService;
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
	@Autowired
	ProductService pService;
	
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
		//문의에 상품을 담아야 한다.
		sqList.stream().forEach(sQna->{
			sQna.setProduct(pService.printOneProduct(new Product(sQna.getProductNo())));
		});
		mv.addObject("sqList",sqList).
		addObject("search",search).
		addObject("paging",paging).
		setViewName("/shop/shopQnaList");
		return mv;
	}
	

	//문의작성ajax
	@ResponseBody
	@RequestMapping(value="/shopQna/register.strap", method=RequestMethod.POST)
	public String registerShopQna(
			@ModelAttribute ShopQna sQna) {
		
		System.out.println(sQna.toString());
		if(qService.registerShopQna(sQna) > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//상품 상세페이지 내 문의 리스트 출력(정렬:최신순,비밀글 여부)ajax
	@ResponseBody
	@RequestMapping(value="/shopQna/detail/list.strap",produces="application/json;charset=utf-8",method=RequestMethod.GET)
	public String viewReviewListOnDetail(
			@RequestParam(value="page",required=false) Integer currentPage,
			@ModelAttribute Search search
			) {
		int page = (currentPage != null)? currentPage : 1;
		
		JSONObject jsonObject = new JSONObject();
		Paging paging = new Paging(qService.countShopQna(search), page, 5, 5);
		List<ShopQna> qList = qService.printShopQnaByProductNo(paging, search);
		
		String qListJson = new Gson().toJson(qList);
		String searchJson = new Gson().toJson(search);
		String pagingJson = new Gson().toJson(paging);
		
		System.out.println(paging.toString());
		
		jsonObject.put("paging", pagingJson);
		jsonObject.put("search",searchJson);
		jsonObject.put("qList",qListJson);
		
		return jsonObject.toString();
	}
}
