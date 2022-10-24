package com.kh.strap.shop.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductImg;
import com.kh.strap.shop.product.domain.ProductLike;
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
	@RequestMapping(value="/product/listView.strap", method=RequestMethod.GET)
	public ModelAndView viewProductList(ModelAndView mv,
			Search search,
			@RequestParam(value="page",required=false)Integer currentPage) {
		int page = (currentPage != null)? currentPage : 1;
		
		Paging paging = new Paging(pService.countAllProduct(), page, 25, 5);
		List<Product>pList = pService.printAllProduct(paging, search);
		mv.addObject("pList",pList).
		addObject("paging",paging).
		addObject("search",search).
		addObject("url","listView").
		setViewName("/shop/productList");
		return mv;
	}
	
	//상품목록 페이지 보충제 검색 리스트 출력
	@RequestMapping(value="/product/search.strap", method=RequestMethod.GET)
	public ModelAndView searchProductList(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false)Integer currentPage) {
		int page = (currentPage != null)? currentPage : 1;
		
		Paging paging = new Paging(pService.countSearchProduct(search),page,25,5);
		List<Product>pList = pService.printAllProductSearch(paging, search);
		mv.addObject("pList",pList).
		addObject("paging",paging).
		addObject("search",search).
		addObject("url","search").
		setViewName("/shop/productList");
		return mv;
	}
	
	//상품 상세 페이지
	@RequestMapping(value="/product/detailView.strap", method=RequestMethod.GET)
	public ModelAndView viewProductDetail(ModelAndView mv,
			@ModelAttribute Product product) {
		
		Product productResult = pService.printOneProduct(product);
		List<ProductImg> infoList = pService.printInfoImgByNo(product);
		List<ProductImg> subList = pService.printSubImgByNo(product);
		
		
		mv.addObject("product",productResult).
		addObject("infoList",infoList).
		addObject("subList",subList).
		setViewName("/shop/productDetail");
		return mv;
	}
	
	//구매(주문페이지) 이동
	@RequestMapping(value="/orderView.strap", method=RequestMethod.GET)
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
	
	//마이쇼핑 주문내역 리스트 출력(필터: 날짜)
	@RequestMapping(value="/order/listView.strap",method=RequestMethod.GET)
	public ModelAndView viewMemberReviewList(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false) Integer currentPage,
			HttpSession session) {
		int page = (currentPage != null)? currentPage: 1;
		System.out.println(search.toString());
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		search.setMemberId(loginUser.getMemberId());
		Paging paging = new Paging(pService.countMemberOder(search), page, 10, 5);
		List<Order> oList = pService.printMemberOrder(paging, search);
		
		////주문에 상품리스트를 담아야한다..!
		oList.stream().forEach(order->{
					order.setBuyProducts(pService.printProductsOnOrder(order.getOrderNo()));
				});
		System.out.println(oList.toString());
		mv.addObject("oList",oList).
		addObject("search",search).
		addObject("paging",paging).
		setViewName("/shop/orderList");
		return mv;
	}
	
	
	//배송조회 
	@RequestMapping(value="/order/deliveryView.strap", method=RequestMethod.GET)
	public ModelAndView viewDelivery(ModelAndView mv) {
		mv.setViewName("/shop/deliveryDetail");
		return mv;
	}
	
	//구매취소
	@RequestMapping(value="/order/cancel.strap", method=RequestMethod.GET)
	public ModelAndView cancelOrder(ModelAndView mv) {
		return mv;
	}
	
	//마이쇼핑 취소반품 리스트 출력(필터: 날짜)
	@RequestMapping(value="/order/cancel/listView.strap",method=RequestMethod.GET)
	public ModelAndView viewMemberCancelList(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false) Integer currentPage,
			HttpSession session) {
		int page = (currentPage != null)? currentPage: 1;
		System.out.println(search.toString());
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		search.setMemberId(loginUser.getMemberId());
		Paging paging = new Paging(pService.countMemberCancelOrder(search), page, 10, 5);
		List<Order> cancelList = pService.printMemberCancelOrder(paging, search);
		
		mv.addObject("cancelList",cancelList).
		addObject("search",search).
		addObject("paging",paging).
		setViewName("/shop/cancelList");
		return mv;
	}
	
	//마이쇼핑:찜한상품리스트 이동
	@RequestMapping(value="/product/like/listView.strap", method=RequestMethod.GET)
	public ModelAndView viewLikeList(ModelAndView mv,
			Search search,
			@RequestParam(value="page",required=false)Integer currentPage,
			ProductLike like,
			HttpSession session) {
		int page = (currentPage != null)? currentPage : 1;
		like.setMemberId(((Member)session.getAttribute("loginUser")).getMemberId());
		Paging paging = new Paging(pService.countMemberProductLike(like), page, 5, 5);
		List<Product>pList = pService.printMemberProductLike(paging, like);
		mv.addObject("pList",pList).
		addObject("paging",paging).
		addObject("search",search).
		addObject("url","listView").
		setViewName("/shop/likeList");
		return mv;
	}
	//로그인 멤버의 찜한 상품들
	@ResponseBody
	@RequestMapping(value="/product/member/likeList.strap",produces="application/json;charset=utf-8", method=RequestMethod.POST)
	public String memberLikeList(
			@RequestParam("memberId")String memberId) {
		List<ProductLike> plList = pService.memberLikeList(memberId);
		return new Gson().toJson(plList);
	}
	
	//상품 찜하고삭제하기
	@ResponseBody
	@RequestMapping(value="/product/like.strap", method=RequestMethod.GET)
	public String controlProductLike(
			@ModelAttribute ProductLike like) {
		
		if(pService.registerdeleteProductLike(like) > 0) {
			return "register";
		}else {
			return "remove";
		}
	}
	
	//상품관리페이지 상품 목록
	@RequestMapping(value="/admin/productView.strap", method=RequestMethod.GET)
	public ModelAndView viewManageProduct(ModelAndView mv,
			Search search,
			@RequestParam(value= "page", required=false)Integer currentPage) {
		int page = (currentPage != null) ? currentPage : 1;
		Paging paging = new Paging(pService.countAllProduct(), page, 10, 5);
		List<Product> pList = pService.printAdminAllProduct(paging, search);
		mv.addObject("pList",pList).
		addObject("paging",paging).
		addObject("url","productView").
		setViewName("/shop/productManage");
		return mv;
	}
	
	//상품관리페이지 상품 검색결과 목록
	@RequestMapping(value="/admin/productSearchView.strap", method=RequestMethod.GET)
	public ModelAndView viewSearchManageProduct(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value= "page", required=false)Integer currentPage) {
		int page = (currentPage != null) ? currentPage : 1;
		Paging paging = new Paging(pService.countAdminProductSearch(search), page, 10, 5);
		List<Product> pList = pService.printAdminProductSearch(paging, search);
		mv.addObject("pList",pList).
		addObject("paging",paging).
		addObject("search",search).
		addObject("url","productSearchView").
		setViewName("/shop/productManage");
		return mv;
	}
	
	//상품등록페이지 이동
	/**
	 * 상품등록페이지 이동 메소드
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/admin/product/registerView.strap", method=RequestMethod.GET)
	public ModelAndView viewRegisterProduct(ModelAndView mv) {
		mv.setViewName("/shop/productRegister");
		return mv;
	}
	
	//상품등록
	/**
	 * 상품 등록 메소드
	 * @param mv
	 * @param product
	 * @param mainImg
	 * @param sub1Img
	 * @param sub2Img
	 * @param sub3Img
	 * @param sub4Img
	 * @param infoImg
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/admin/product/register.strap", method=RequestMethod.POST)
	public ModelAndView registerProduct(ModelAndView mv, 
			@ModelAttribute Product product,
			@RequestParam("mainImg") MultipartFile mainImg, 
			@RequestParam("infoFile") List<MultipartFile> infoList,
			@RequestParam(value="imgFile",required=false)List<MultipartFile> imgList,
			HttpSession session
			) {
		
		String thisTime = new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis());
		String savePath = session.getServletContext().getRealPath("resources") + "\\image\\product";
		File targetFile = new File(savePath);
		if (!targetFile.exists()) {
			targetFile.mkdir();
		}
		
		try {
			//메인이미지저장
			String mainImgName = mainImg.getOriginalFilename();
			String mainImgReName = thisTime+"_main"+mainImgName.substring(mainImgName.lastIndexOf("."));
			product.setMainImgName(mainImgName);
			product.setMainImgReName(mainImgReName);
			mainImg.transferTo(new File(savePath + "\\" + mainImgReName));
			product.setMainImgRoot("/resources/image/product/" + mainImgReName);
			
			int result = pService.registerProduct(product);
			if(result > 0) {
				//인포이미지 저장
				if(infoList.size() > 0) {
					int index = 1;
					for(MultipartFile imgFile : infoList) {
						String imgName = imgFile.getOriginalFilename();
						String imgReName = thisTime+"_info("+index+")"+"."+imgName.substring(imgName.lastIndexOf(".")+1);
						String imgRoot = "/resources/image/product/" + imgReName;
						imgFile.transferTo(new File(savePath + "\\" + imgReName));
						int regiSubResult = pService.registerInfoImg(new ProductImg(imgName, imgReName, imgRoot));
						index++;
						if(regiSubResult > 0 ) {
						}else {
						}
					}
				}
				//서브이미지 저장
				if(imgList.size() > 0) {
					int index = 1;
					for(MultipartFile imgFile : imgList) {
						String imgName = imgFile.getOriginalFilename();
						String imgReName = thisTime+"_sub("+index+")"+"."+imgName.substring(imgName.lastIndexOf(".")+1);
						String imgRoot = "/resources/image/product/" + imgReName;
						imgFile.transferTo(new File(savePath + "\\" + imgReName));
						int regiSubResult = pService.registerSubImg(new ProductImg(imgName, imgReName, imgRoot));
						index++;
						if(regiSubResult > 0 ) {
						}else {
						}
					}
				}
			}else {
			}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (NullPointerException e) {
			}
		mv.setViewName("redirect:/admin/productView.strap");
		return mv;
	}
	
	//상품수정페이지 이동
	@RequestMapping(value="/admin/product/modifyView.strap", method=RequestMethod.GET)
	public ModelAndView viewModifyProduct(ModelAndView mv,
			@ModelAttribute Product productParam) {
		
		Product product = pService.printOneProduct(productParam);
		List<ProductImg> infoList = pService.printInfoImgByNo(product);
		List<ProductImg> subList = pService.printSubImgByNo(product);
		
		
		mv.addObject("product",product).
		addObject("infoList",infoList).
		addObject("subList",subList).
		setViewName("/shop/productModify");
		return mv;
	}
	
	//상품 삭제ajax
	@ResponseBody
	@RequestMapping(value="/admin/product/remove.strap",produces="text/plain;charset=utf-8", method=RequestMethod.GET)
	public String removeProduct(
			@ModelAttribute Product product) {
		
		int result = pService.removeProduct(product);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
}
