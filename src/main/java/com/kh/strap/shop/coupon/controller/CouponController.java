package com.kh.strap.shop.coupon.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.coupon.domain.Coupon;
import com.kh.strap.shop.coupon.service.CouponService;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.service.ProductService;

@Controller
public class CouponController {
	
/*쿠폰등록(COUPON_TBL)
 * 
 * C: -관리자 쿠폰 등록
 * R: -메인배너 노출
 * 	  -관리자 쿠폰 관리페이지
 * 	  -상품 상세페이지
 *    -상품 결제 페이지
 * U: -쿠폰은 수정할 수 없다. 지우고 재등록.
 * D: -관리자 쿠폰 삭제
 * */

	
/*회원 쿠폰 발급(MEMBER_COUPON_TBL)
 * 
 * C: -메인 베너를 통한 쿠폰 발급, 회원 가입 시 웰컴 쿠폰, 멤버 쿠폰 테이블의 기록은 지워지지 않는다. 
 * R: -상품 결제 페이지
 * U: -쿠폰 사용 시 USE_YN 'Y'
 * */
	
	@Autowired
	CouponService couponService;
	@Autowired
	ProductService pService;
	
	//메인베너 쿠폰 리스트
	@RequestMapping(value="/coupon/banner.strap", method=RequestMethod.GET)
	public ModelAndView printCouponBanner(ModelAndView mv) {
		
		return mv;
	}
	
	//쿠폰관리페이지 이동
	@RequestMapping(value="/admin/couponView.strap", method=RequestMethod.GET)
	public ModelAndView viewManageCoupon(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false) Integer currentPage) {
		int page = (currentPage != null)? currentPage: 1;

		Paging paging = new Paging(couponService.getTotalCouponCount(search), page, 10, 5);
		List<Coupon> couponList = couponService.printCoupon(paging,search);
		if(!couponList.isEmpty()){
			mv.addObject("couponList",couponList).
			addObject("paging",paging).
			addObject("search",search).
			setViewName("/shop/couponManage");
		}else {
			mv.addObject("couponList",null).
			addObject("paging",paging).
			addObject("search",search).
			setViewName("/shop/couponManage");
		}
		return mv;
	}
	
	//쿠폰등록페이지 이동
	@RequestMapping(value="/admin/coupon/registerView.strap", method=RequestMethod.GET)
	public ModelAndView viewRegisterCoupon(ModelAndView mv) {
		
		List<Product> productBrands = pService.getProductBrandList();
		List<Product> productNames = pService.getProductNameList();
				
		
		mv.addObject("productBrands",productBrands).
		addObject("productNames",productNames).
		setViewName("/shop/couponRegister");
		return mv;
	}
	
	//쿠폰 등록
	@RequestMapping(value="/admin/coupon.register.strap",method=RequestMethod.POST)
	public ModelAndView registerCoupon(ModelAndView mv,
			@ModelAttribute Coupon coupon,
			@RequestParam(value="couponImg", required=false)MultipartFile couponImg,
			HttpSession session) {
		
		try {
			
			if(!couponImg.isEmpty()) {
				String thisTime = new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis());
				String savePath = session.getServletContext().getRealPath("resources") + "\\image\\coupon";
				File targetFile = new File(savePath);
				if (!targetFile.exists()) {
					targetFile.mkdir();
				}
				String couponImgName = couponImg.getOriginalFilename();
				String couponImgReName = thisTime+"_main"+couponImgName.substring(couponImgName.lastIndexOf("."));
				coupon.setCouponImgName(couponImgName);
				coupon.setCouponImgRename(couponImgReName);
				couponImg.transferTo(new File(savePath + "\\" + couponImgReName));
				coupon.setCouponImgRoot("/resources/image/coupon/" + couponImgReName);
			}
			
			if(couponService.registerCoupon(coupon) > 0) {
				mv.setViewName("redirect:/admin/couponView.strap");
			}else {
				mv.setViewName("redirect:/admin/couponView.strap");
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//쿠폰 삭제
	@RequestMapping(value="/admin/coupon/remove.strap", method=RequestMethod.GET)
	public ModelAndView removeCoupon(ModelAndView mv,
			@ModelAttribute Coupon coupon) {
		if(couponService.removeCoupon(coupon) > 0) {
			mv.setViewName("");
		}else {
			mv.setViewName("");
		}
		
		return mv;
	}
	
	//회원쿠폰발급ajax
	@ResponseBody
	@RequestMapping(value="/member/coupon/register.strap", method=RequestMethod.POST)
	public String registerMemberCoupon(
			@ModelAttribute Coupon coupon,
			HttpSession session) {
		System.out.println("!");
		//로그인이 되어있지 않은 경우 처리
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser == null) {
			return "needLogin";
		}
		
		//쿠폰객체에 쿠폰 유효기간을 추가해야 한다.
		Coupon paramCoupon = couponService.printCouponDetail(coupon.getCouponNo());
		if(paramCoupon != null) {
			coupon.setCouponPeriod(paramCoupon.getCouponPeriod());
		}else {
			return"fail";
		}
		if(couponService.registerMemberCoupon(coupon)>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//관리자:미리보기용 이미지 임시저장 ajax
		@ResponseBody
		@RequestMapping(value="/admin/coupon/temp.strap",produces="application/json;charset=utf-8", method=RequestMethod.POST)
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
		
	
}
