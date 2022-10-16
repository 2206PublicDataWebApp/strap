package com.kh.strap.shop.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.shop.product.service.ProductService;

@Controller
public class ProductController {
/*상품(PRODUCT_TBL)
 * 
 * C: -관리자 상품 등록O
 * R: -상품 리스트
 *    -상품 상세조회
 *    -찜한 상품 조회
 * U: -관리자 상품 수정
 * D: -관리자 상품 삭제
 * */

/*주문(ORDER_TBL)
 * 
 * C: -결제페이지, 결제하기 버튼
 * R: -주문 완료 페이지
 *    -주문 내역 조회
 *    -취소/반품 조회
 * U: -결제API 완료 수신 시 PAY_COMPLETE 'Y'
 *    -배송 시작 시 DELIVERY_START 'Y' , DELEVERY_NO = 운송장번호
 *    -배송 완료 시 DELIVERY_COMPLETE 'Y'
 *    -취소 신청 시 ORDER_CANCEL 'Y'
 *    -반품 신청 시 ORDER_BACK 'Y'
 * D: -주문 내역은 삭제하지 않는다.
 * */

// 상품 찜CRD
/*상품 찜(PRODUCT_LIKE_TBL)
 * 
 * C: -상품 찜하기 버튼
 * R: -찜한 상품 PRODUCT_TBL과 조인
 * D: -상품 찜하기 버튼 해제
 * */	
	
	@Autowired
	ProductService pService;
	
	//보충제 리스트 출력
	@RequestMapping(value="/product/list.strap", method=RequestMethod.GET)
	public ModelAndView viewProductList(ModelAndView mv) {
		mv.setViewName("/shop/productList");
		return mv;
	}
	
	//보충제 검색 리스트 출력
	@RequestMapping(value="/product/search.strap\"", method=RequestMethod.GET)
	public ModelAndView searchProductList(ModelAndView mv) {
		mv.setViewName("/shop/productList");
		return mv;
	}
	
	//상품 상세 페이지
	@RequestMapping(value="/product/detail.strap\"", method=RequestMethod.GET)
	public ModelAndView viewProductDetail(ModelAndView mv) {
		mv.setViewName("/shop/productDetail");
		return mv;
	}
	
	//구매(주문페이지) 이동
	@RequestMapping(value="/order.strap", method=RequestMethod.GET)
	public ModelAndView viewOrderPage(ModelAndView mv) {
		mv.setViewName("/shop/order");
		return mv;
	}
	
	//주문페이지->결제
	@RequestMapping(value="/order/payment.strap", method=RequestMethod.GET)
	public ModelAndView orderProduct(ModelAndView mv) {
		mv.setViewName("/shop/orderComplete");
		return mv;
	}
	
	//주문내역리스트 이동
	@RequestMapping(value="/order/list.strap", method=RequestMethod.GET)
	public ModelAndView viewOrderList(ModelAndView mv) {
		mv.setViewName("/shop/orderList");
		return mv;
	}
	
	//배송조회 
	@RequestMapping(value="/order/delivery.strap", method=RequestMethod.GET)
	public ModelAndView viewDelivery(ModelAndView mv) {
		mv.setViewName("/shop/deliveryDetail");
		return mv;
	}
	
	//구매취소
	@RequestMapping(value="/order/cancel.strap", method=RequestMethod.GET)
	public ModelAndView cancelOrder(ModelAndView mv) {
		return mv;
	}

	
	//취소반품리스트 이동
	@RequestMapping(value="/order/cancel/list.strap", method=RequestMethod.GET)
	public ModelAndView viewCancelList(ModelAndView mv) {
		mv.setViewName("/shop/cancelList");
		return mv;
	}
	
	//찜한상품리스트 이동
	@RequestMapping(value="/product/like/list.strap", method=RequestMethod.GET)
	public ModelAndView viewLikeList(ModelAndView mv) {
		mv.setViewName("/shop/likeList");
		return mv;
	}
	
	//상품 찜하기
	@RequestMapping(value="/product/like.strap", method=RequestMethod.GET)
	public ModelAndView registerLike(ModelAndView mv) {
		return mv;
	}
	
	//상품 찜 취소
	@RequestMapping(value="/product/likeCancel.strap", method=RequestMethod.GET)
	public ModelAndView removeLike(ModelAndView mv) {
		return mv;
	}
	
	//상품관리페이지 이동
	@RequestMapping(value="/admin/product.strap", method=RequestMethod.GET)
	public ModelAndView viewManageProduct(ModelAndView mv) {
		mv.setViewName("/shop/productManage");
		return mv;
	}
	
	//상품등록페이지 이동
	@RequestMapping(value="/admin/product/register.strap", method=RequestMethod.GET)
	public ModelAndView viewRegisterProduct(ModelAndView mv) {
		mv.setViewName("/shop/productRegister");
		return mv;
	}
	
	//상품수정페이지 이동
	@RequestMapping(value="/admin/product/modify.strap", method=RequestMethod.GET)
	public ModelAndView viewModifyProduct(ModelAndView mv) {
		mv.setViewName("/shop/productModify");
		return mv;
	}
	
	//상품 삭제ajax
	@RequestMapping(value="/admin/product/remove.strap", method=RequestMethod.GET)
	public ModelAndView removeProduct(ModelAndView mv) {
		return mv;
	}
	
}
