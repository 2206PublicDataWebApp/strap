package com.kh.strap.shop.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.cart.domain.Cart;
import com.kh.strap.shop.cart.service.CartService;
import com.kh.strap.shop.coupon.domain.Coupon;
import com.kh.strap.shop.coupon.service.CouponService;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.OrderProduct;
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
	@Autowired
	CartService cService;
	@Autowired
	CouponService couponService;
	
	//쇼핑몰:보충제 리스트 출력
	@RequestMapping(value="/product/listView.strap", method=RequestMethod.GET)
	public ModelAndView viewProductList(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false)Integer currentPage
			) {
		int page = (currentPage != null)? currentPage : 1;
		Paging paging = new Paging(pService.countAllProduct(search), page, 10, 5);
		List<Product>pList = pService.printAllProduct(paging, search);
		mv.addObject("pList",pList).
		addObject("paging",paging).
		addObject("search",search).
		addObject("url","listView").
		setViewName("/shop/productList");
		return mv;
	}
	
	//상품 상세 페이지
	@RequestMapping(value="/product/detailView.strap", method=RequestMethod.GET)
	public ModelAndView viewProductDetail(ModelAndView mv,
			@ModelAttribute Product product,
			HttpSession session) {
		
		Product productResult = pService.printOneProduct(product);
		List<ProductImg> infoList = pService.printInfoImgByNo(product);
		List<ProductImg> subList = pService.printSubImgByNo(product);
		
		session.setAttribute("forOrderProduct", productResult);
		
		mv.addObject("product",productResult).
		addObject("infoList",infoList).
		addObject("subList",subList).
		setViewName("/shop/productDetail");
		return mv;
	}
	
	//상세페이지 -> 주문페이지 이동
	@RequestMapping(value="/detail/orderView.strap", method=RequestMethod.GET)
	public ModelAndView viewOrderPageFromDetail(ModelAndView mv,
			@RequestParam("qty")Integer qty,
			HttpSession session
			) {
		//상세페이지에서 세션에 저장된 product값을 Cart List에 담아서 주문페이지로 전달
		Product product = (Product)session.getAttribute("forOrderProduct");
		List<Cart> cList = new ArrayList<>();
		Cart cart = new Cart(product,qty);
		cList.add(cart);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		List<Coupon>couponList = couponService.printMemberCoupon(new Coupon(loginUser.getMemberId()));
		
		mv.addObject("cList",cList).
		addObject("couponList",couponList).
		setViewName("/shop/order");
		return mv;
	}
	//장바구니 -> 주문페이지 이동
	@RequestMapping(value="/cart/orderView.strap", method=RequestMethod.GET)
	public ModelAndView viewOrderPageFromCart(ModelAndView mv,
			HttpSession session) {
		//로그인한 회원의 장바구니 체크가 되어있는 상품들을 List로 가져와 주문페이지로 전달
		//카트에 product를 담아주어야함.
		Member loginUser = (Member)session.getAttribute("loginUser");
		List<Cart> cList = cService.printCheckedCart(loginUser.getMemberId());
		cList.stream().forEach(cart->{
			cart.setProduct((pService.printOneProduct(new Product(cart.getProductNo()))));
		});
		
		List<Coupon>couponList = couponService.printMemberCoupon(new Coupon(loginUser.getMemberId()));
		
		mv.addObject("cList",cList).
		addObject("couponList",couponList).
		setViewName("/shop/order");
		return mv;
	}
	
	//주문페이지->결제검증
	@ResponseBody
	@RequestMapping(value="/order/payment/completeCheck.strap",method=RequestMethod.POST)
	public String orderProduct(
			@RequestParam("imp_uid")String imp_uid, //결제번호
			@RequestParam("merchant_uid")String merchant_uid, //주문번호
			@RequestParam("paid_amount")Integer paid_amount, //결제금액
			@RequestParam("status")String status, //주문상태
			@ModelAttribute Order order){
		
		//1.결제된 금액과 주문했던 금액을 비교한다.
		if(paid_amount == pService.getTobePaidFinalCost(merchant_uid)) {
				//결제 검증 성공 시 결제 정보를 update한다.
				
				if(status.equals("paid")) {
					//2-1. 결제상태가 'paid'라면 결제 성공처리
					//ORDER_STATUS = paid , PAY_COMPLETE = Y , 결제 번호도 넣어야 하는데..
					Map<String,String> paidMap = new HashMap<>();
					paidMap.put("merchant_uid", merchant_uid);
					paidMap.put("imp_uid",imp_uid);
					pService.modifyPayCompleteOrder(paidMap);
					return "success";
					
				}else if(status.equals("ready")) {
					//2-2. 결제상태가 'ready'라면 주문테이블에 가상계좌 입금정보 UPDATE
					order.setOrderNo(merchant_uid);
					pService.modifyVBankInfo(order);
					return "vbankIssued";
					
				}else {
					//아임포트 응답값 rsp.status의 그 외 응답값 확인 필요.
					return "";
				}
			}else {
			//결제금액과 결제되어야 할 금액이 다른경우. 결제금액 불일치, 위변조 결제
				//화면단에서 결제 취소 처리한다.
				
				
				return "forgery";
		}
	}
	
	//주문 레코드 INSERT AJAX
	@ResponseBody
	@RequestMapping(value="/order/record.strap",method=RequestMethod.POST)
	public String registerOrderRecord(
			@ModelAttribute Order order,
			@RequestParam("jsonArr") String jsonArr,
			@RequestParam("orderNo") String orderNo) {
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			//1.주문레코드를 INSERT한다.
			order.setOrderNo(orderNo);
			if(pService.registerOrder(order)>0) {
				//2.json배열을 자바의 List로 변경하고 이를 이용하여 DB에 INSERT한다.
				//여기서 판매량을 집계하고 싶으나 결제 완료와는 동떨어져있다.
				List<OrderProduct> opList =objectMapper.readValue(jsonArr, objectMapper.getTypeFactory().constructCollectionType(List.class, OrderProduct.class));
				opList.stream().forEach(orderProduct ->{
					pService.registerOrderProducts(orderProduct);
				});
				return "success";
				
			}else {
				return "fail";
				
			}
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} 
		return "fail";
	}
	
	//결제 및 가상계좌 발급 완료 -> 주문 완료 페이지
	@RequestMapping(value="/order/completeView.strap",method=RequestMethod.GET)
	public ModelAndView viewOrderCompletePage(ModelAndView mv,
			@RequestParam("merchant_uid")String merchant_uid) {
		
		Order completeOrder = pService.printOneOrder(merchant_uid);
		//OrderProduct를 담아야한다.
		completeOrder.setOrderProducts(pService.printOrderProductsOnOrder(merchant_uid));
		//Product를 담아야한다.//여기서 qty를 같이 담자.
		completeOrder.setBuyProducts(pService.printProductsOnOrder(merchant_uid));
		mv.addObject("completeOrder",completeOrder).
		setViewName("/shop/orderComplete");
		return mv;
	}
	
	
	//주문페이지에서 주소 저장 (,_)로 구분
	@ResponseBody
	@RequestMapping(value="/member/modifyAddr.strap",method=RequestMethod.POST)
	public String modifyMemberAddr(
			@ModelAttribute Member member) {
		//없으면 저장, 있으면 변경
		if(pService.modifyMemberAddr(member) > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//마이쇼핑: 주문내역 리스트 출력(필터: 날짜)
	@RequestMapping(value="/order/listView.strap",method=RequestMethod.GET)
	public ModelAndView viewMemberReviewList(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false) Integer currentPage,
			HttpSession session) {
		int page = (currentPage != null)? currentPage: 1;
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		search.setMemberId(loginUser.getMemberId());
		Paging paging = new Paging(pService.countMemberOder(search), page, 5, 5);
		List<Order> oList = pService.printMemberOrder(paging, search);
		
		////주문에 상품리스트를 담아야한다..!
		oList.stream().forEach(order->{
					order.setBuyProducts(pService.printProductsOnOrder(order.getOrderNo()));
				});
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
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		search.setMemberId(loginUser.getMemberId());
		Paging paging = new Paging(pService.countMemberCancelOrder(search), page, 5, 5);
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
	
	//관리자:상품관리페이지 이동
	@RequestMapping(value="/admin/productView.strap", method=RequestMethod.GET)
	public ModelAndView viewManageProduct(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value= "page", required=false)Integer currentPage) {
		int page = (currentPage != null) ? currentPage : 1;
		Paging paging = new Paging(pService.countAllProduct(search), page, 30, 5);
		List<Product> pList = pService.printAdminAllProduct(paging, search);
		if(!pList.isEmpty()) {
			mv.addObject("pList",pList).
			addObject("search",search).
			addObject("paging",paging).
			setViewName("/shop/productManage");
		}
		return mv;
	}
	
	//관리자:상품등록페이지 이동
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
	
	//관리자:상품등록
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
						if(!imgFile.isEmpty()) {
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
				}
				//서브이미지 저장
				if(imgList.size() > 0) {
					int index = 1;
					for(MultipartFile imgFile : imgList) {
						if(!imgFile.isEmpty()) {
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
	
	//관리자:상품수정페이지 이동
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
	
	//관리자:상품수정: 상품정보
	@ResponseBody
	@RequestMapping(value="/admin/product/modify/info.strap",method=RequestMethod.POST)
	public String  modifyProductInfo(
			@ModelAttribute Product product,
			@RequestParam(value="mainImg",required=false)MultipartFile mainImg,
			@RequestParam(value="infoFile",required=false)List<MultipartFile> infoList,
			@RequestParam(value="imgFile",required=false)List<MultipartFile> imgList,
			HttpSession session) {
		
		if(pService.modifyProductInfo(product) > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	//관리자:상품수정: 메인이미지
	@ResponseBody
	@RequestMapping(value="/admin/product/modify/mainImg.strap",method=RequestMethod.POST)
	public String  modifyProductMainImg(
			@ModelAttribute Product product,
			@RequestParam(value="mainImg",required=false)MultipartFile mainImgParam,
			HttpSession session) {
		MultipartFile mainImg = (mainImgParam != null)?mainImgParam: null;
		String thisTime = new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis());
		String savePath = session.getServletContext().getRealPath("resources") + "\\image\\product";
		File targetFile = new File(savePath);
		if (!targetFile.exists()) {
			targetFile.mkdir();
		}
		
		try {
			if(mainImg!=null) {
				String mainImgName = mainImg.getOriginalFilename();
				String mainImgReName = thisTime+"_main"+mainImgName.substring(mainImgName.lastIndexOf("."));
				product.setMainImgName(mainImgName);
				product.setMainImgReName(mainImgReName);
				mainImg.transferTo(new File(savePath + "\\" + mainImgReName));
				product.setMainImgRoot("/resources/image/product/" + mainImgReName);
			}
			if(pService.modifyProductMainImg(product) > 0) {
				return "success";
			}else {
				return "fail";
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "fail";
	}
	//관리자:상품수정: 서브이미지
	@ResponseBody
	@RequestMapping(value="/admin/product/modify/subImg.strap",method=RequestMethod.POST)
	public String  modifyProductSubImg(
			@RequestParam("productNo")int productNo,
			@RequestParam(value="imgFile",required=false)List<MultipartFile> imgList,
			HttpSession session) {
		String thisTime = new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis());
		String savePath = session.getServletContext().getRealPath("resources") + "\\image\\product";
		File targetFile = new File(savePath);
		if (!targetFile.exists()) {
			targetFile.mkdir();
		}
			if(imgList.size() > 0) {
				pService.removeSubImgOnProduct(productNo);
				int index = 1;
				for(MultipartFile imgFile : imgList) {
					if(!imgFile.isEmpty()) {
						String imgName = imgFile.getOriginalFilename();
						String imgReName = thisTime+"_info("+index+")"+"."+imgName.substring(imgName.lastIndexOf(".")+1);
						String imgRoot = "/resources/image/product/" + imgReName;
						try {
							imgFile.transferTo(new File(savePath + "\\" + imgReName));
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						int modiSubResult = pService.registerSubImg(new ProductImg(productNo, imgName, imgReName, imgRoot));
						index++;
						if(modiSubResult > 0 ) {
						}else {
							return "fail";
						}
					}
				}
			}
		
		return "success";
	}
	//관리자:상품수정: 상품정보이미지
	@ResponseBody
	@RequestMapping(value="/admin/product/modify/infoImg.strap",method=RequestMethod.POST)
	public String  modifyProductInfoImg(
			@RequestParam("productNo")int productNo,
			@RequestParam(value="infoFile",required=false)List<MultipartFile> infoList,
			HttpSession session) {
		String thisTime = new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis());
		String savePath = session.getServletContext().getRealPath("resources") + "\\image\\product";
		File targetFile = new File(savePath);
		if (!targetFile.exists()) {
			targetFile.mkdir();
		}
			if(infoList.size() > 0) {
				pService.removeInfoImgOnProduct(productNo);
				int index = 1;
				for(MultipartFile imgFile : infoList) {
					if(!imgFile.isEmpty()) {
						String imgName = imgFile.getOriginalFilename();
						String imgReName = thisTime+"_info("+index+")"+"."+imgName.substring(imgName.lastIndexOf(".")+1);
						String imgRoot = "/resources/image/product/" + imgReName;
						try {
							imgFile.transferTo(new File(savePath + "\\" + imgReName));
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						int modiInfoResult = pService.registerInfoImg(new ProductImg(productNo, imgName, imgReName, imgRoot));
						index++;
						if(modiInfoResult > 0 ) {
						}else {
							return "fail";
						}
					}
				}
			}
		return "success";
	}
	
	
	//관리자:미리보기용 이미지 임시저장 ajax
	@ResponseBody
	@RequestMapping(value="/admin/product/temp.strap",produces="application/json;charset=utf-8", method=RequestMethod.POST)
	public String saveTempImg(
			@RequestParam("tempImg")MultipartFile tempImg,
			@RequestParam("tempFolderName")String tempFolderName,
			@RequestParam("tempName")String tempName,
			HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		try {
			//1.클라이언트단에서 전달받은 이름으로 임시파일 저장용 폴더 생성한다.
			//2.파일 저장 로직 시 해당 폴더는 삭제 예정.
			String savePath = session.getServletContext().getRealPath("resources") + "\\image\\shop\\temp\\"+tempFolderName;
			File targetFile = new File(savePath);
			if (!targetFile.exists()) {
				targetFile.mkdir();
			}
			//2.DB저장 없이 임시 폴더에 저장한다.
			tempImg.transferTo(new File(savePath+"\\"+tempName));
			String tempImgPath = "/resources/image/shop/temp/"+tempFolderName+"/"+tempName;
			jsonObject.put("tempImgPath", tempImgPath);
			return jsonObject.toString();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	
	//관리자:상품 삭제ajax
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
	
	//관리자:상품 판매량 집계, 
	@ResponseBody
	@RequestMapping(value="/admin/product/sales.strap",method=RequestMethod.POST)
	public String countSalesAllProducts() {
		
		if(pService.renewSales()>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//관리자:주문관리 페이지 이동
	@RequestMapping(value="/admin/orderView.strap",method=RequestMethod.GET)
	public ModelAndView viewManageOrder(ModelAndView mv,
			@RequestParam(value="page",required=false)Integer currentPage,
			@ModelAttribute Search search) {
		int page = (currentPage != null)? currentPage : 1;
		
		Paging paging = new Paging(pService.countManageOrder(search), page, 30, 5);
		List<Order> oList = pService.printManageOrder(paging, search);
		if(!oList.isEmpty()) {
			mv.addObject("paging",paging).
			addObject("search",search).
			addObject("oList",oList).
			setViewName("/shop/orderManage");
		}else {
			
		}
		return mv;
	}
	
	//결제취소: 새끼창 이동
	@RequestMapping(value="/order/cancel/window.strap",method=RequestMethod.GET)
	public ModelAndView viewCancelWindow(ModelAndView mv) {
		mv.setViewName("/shop/orderCancel");
		return mv;
	}
	
	
}
