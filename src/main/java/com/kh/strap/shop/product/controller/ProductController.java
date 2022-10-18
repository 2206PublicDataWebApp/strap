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

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductImg;
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
	
	//상품관리페이지 상품 목록
	@RequestMapping(value="/admin/productView.strap", method=RequestMethod.GET)
	public ModelAndView viewManageProduct(ModelAndView mv,
			Search search,
			@RequestParam(value= "page", required=false)Integer currentPage) {
		int page = (currentPage != null) ? currentPage : 1;
		Paging paging = new Paging(pService.countAllProduct(), page, 10, 5);
		List<Product> pList = pService.printAllProduct(paging, search);
		mv.addObject("pList",pList).
		addObject("paging",paging).
		addObject("url","productView").
		setViewName("/shop/productManage");
		return mv;
	}
	
	//상품관리페이지 상품검색결과 목록
	@RequestMapping(value="/admin/productSearchView.strap", method=RequestMethod.GET)
	public ModelAndView viewSearchManageProduct(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value= "page", required=false)Integer currentPage) {
		int page = (currentPage != null) ? currentPage : 1;
		Paging paging = new Paging(pService.countAdminProductSearch(search), page, 10, 5);
		List<Product> pList = pService.printAllProductSearch(paging, search);
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
			//1.원본 파일명 셋팅
			String mainImgName = mainImg.getOriginalFilename();
			
			//2.저장용 파일명 셋팅
			String mainImgReName = thisTime+"_main"+mainImgName.substring(mainImgName.lastIndexOf("."));
			
			//3.원본 파일명을 product에 set 한다.
			product.setMainImgName(mainImgName);
			
			//4.저장이름을 product에 set 한다.
			product.setMainImgReName(mainImgReName);
		
			//5.설정한경로에 재정의한 이름으로 파일을 저장한다.
			mainImg.transferTo(new File(savePath + "\\" + mainImgReName));
				
			//6.저장 경로를 product에 set 한다.
			product.setMainImgRoot(savePath + "\\" + mainImgReName);
			
			int result = pService.registerProduct(product);
			if(result > 0) {
				//인포이미지 저장
				if(infoList.size() > 0) {
					int index = 1;
					for(MultipartFile imgFile : infoList) {
						String imgName = imgFile.getOriginalFilename();
						String imgReName = thisTime+"_info("+index+")"+"."+imgName.substring(imgName.lastIndexOf(".")+1);
						String imgRoot = savePath + "\\" + imgReName;
						imgFile.transferTo(new File(imgRoot));
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
						String imgRoot = savePath + "\\" + imgReName;
						imgFile.transferTo(new File(imgRoot));
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
	public ModelAndView viewModifyProduct(ModelAndView mv) {
		mv.setViewName("/shop/productModify");
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
