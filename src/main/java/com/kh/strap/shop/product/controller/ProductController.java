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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Product;
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
	@RequestMapping(value="/product/detailView.strap\"", method=RequestMethod.GET)
	public ModelAndView viewProductDetail(ModelAndView mv) {
		mv.setViewName("/shop/productDetail");
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
	
	//주문내역리스트 이동
	@RequestMapping(value="/order/listView.strap", method=RequestMethod.GET)
	public ModelAndView viewOrderList(ModelAndView mv) {
		mv.setViewName("/shop/orderList");
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

	
	//취소반품리스트 이동
	@RequestMapping(value="/order/cancel/listView.strap", method=RequestMethod.GET)
	public ModelAndView viewCancelList(ModelAndView mv) {
		mv.setViewName("/shop/cancelList");
		return mv;
	}
	
	//찜한상품리스트 이동
	@RequestMapping(value="/product/like/listView.strap", method=RequestMethod.GET)
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
	@RequestMapping(value="/admin/productView.strap", method=RequestMethod.GET)
	public ModelAndView viewManageProduct(ModelAndView mv,
			Search search,
			@RequestParam(value= "page", required=false)Integer currentPage) {
		int page = (currentPage != null) ? currentPage : 1;
		Paging paging = new Paging(pService.countAllProduct(), page, 10, 5);
		List<Product> pList = pService.printAllProduct(paging, search);
		mv.addObject("pList",pList).setViewName("/shop/productManage");
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
			@RequestParam("sub1Img") MultipartFile sub1Img,
			@RequestParam("sub2Img") MultipartFile sub2Img,
			@RequestParam("sub3Img") MultipartFile sub3Img,
			@RequestParam("sub4Img") MultipartFile sub4Img,
			@RequestParam("infoImg") MultipartFile infoImg,
			HttpSession session
			) {
		
		try {
			//원본 파일명 셋팅
			String mainImgName = mainImg.getOriginalFilename();
			String sub1ImgName = sub1Img.getOriginalFilename();
			String sub2Imgname = sub2Img.getOriginalFilename();
			String sub3ImgName = sub3Img.getOriginalFilename();
			String sub4ImgName = sub4Img.getOriginalFilename();
			String infoImgName = infoImg.getOriginalFilename();
			
			//2.저장이름용 문자열을 만든다.
			String thisTime = new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis());
			
			//저장용 파일명 셋팅
			String mainImgReName = thisTime+mainImgName.substring(mainImgName.lastIndexOf("."));
			String sub1ImgReName = thisTime+sub1ImgName.substring(sub1ImgName.lastIndexOf("."));
			String sub2ImgReName = thisTime+sub2Imgname.substring(sub2Imgname.lastIndexOf("."));
			String sub3ImgReName = thisTime+sub3ImgName.substring(sub3ImgName.lastIndexOf("."));
			String sub4ImgReName = thisTime+sub4ImgName.substring(sub4ImgName.lastIndexOf("."));
			String infoImgReName = thisTime+infoImgName.substring(infoImgName.lastIndexOf("."));
			
			
			//1.원본 파일명을 product에 set 한다.
			product.setMainImgName(mainImgName);
			product.setFirstSubImgName(sub1ImgName);
			product.setSecondSubImgName(sub2Imgname);
			product.setThirdSubImgName(sub3ImgName);
			product.setFourthSubImgName(sub4ImgName);
			product.setInfoImgName(infoImgName);
			
			//3.저장이름을 product에 set 한다.
			product.setMainImgReName(mainImgReName);
			product.setFirstSubImgReName(sub1ImgReName);
			product.setSecondSubImgReName(sub2ImgReName);
			product.setThirdSubImgReName(sub3ImgReName);
			product.setFourthSubImgReName(sub4ImgReName);
			product.setInfoImgReName(infoImgReName);
			
			//4.저장 경로를 만든다.
			String savePath = session.getServletContext().getRealPath("resources") + "\\image\\product";
			
			//3.저장할 경로의 폴더(디렉토리)가 없으면 새로 만든다.
			File targetFile = new File(savePath);
			if (!targetFile.exists()) {
				targetFile.mkdir();
			}
		
			//4.설정한경로에 재정의한 이름으로 파일을 저장한다.
			mainImg.transferTo(new File(savePath + "\\" + mainImgReName));
			sub1Img.transferTo(new File(savePath + "\\" + sub1ImgReName));
			sub2Img.transferTo(new File(savePath + "\\" + sub2ImgReName));
			sub3Img.transferTo(new File(savePath + "\\" + sub3ImgReName));
			sub4Img.transferTo(new File(savePath + "\\" + sub4ImgReName));
			infoImg.transferTo(new File(savePath + "\\" + infoImgReName));
				
			//5.저장 경로를 product에 set 한다.
			product.setMainImgRoot(savePath + "\\" + mainImgReName);
			product.setFirstSubImgRoot(savePath + "\\" + sub1ImgReName);
			product.setSecondSubImgRoot(savePath + "\\" + sub2ImgReName);
			product.setThirdSubImgRoot(savePath + "\\" + sub3ImgReName);
			product.setFourthSubImgRoot(savePath + "\\" + sub4ImgReName);
			product.setInfoImgRoot(savePath + "\\" + infoImgReName);
			
			int result = pService.registerProduct(product);
			if(result > 0) {
				
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
