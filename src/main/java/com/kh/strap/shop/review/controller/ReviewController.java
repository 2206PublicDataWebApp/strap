package com.kh.strap.shop.review.controller;

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

import com.google.gson.Gson;
import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.service.ProductService;
import com.kh.strap.shop.review.domain.Review;
import com.kh.strap.shop.review.service.ReviewService;

@Controller
public class ReviewController {

/*구매 후기(REIVEW_TBL)
 * 
 * C: -상품 상세 페이지
 * R: -상품 상세페이지
 *    -마이쇼핑-상품 후기
 * U: -상품후기는 수정이 불가하다.
 * D: -마이쇼핑-상품 후기
 * */
	
	@Autowired
	ReviewService rService;
	@Autowired
	ProductService pService;
	
	//상품후기리스트 이동
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView viewReviewList(ModelAndView mv) {
		
		mv.setViewName("/shop/reviewList");
		return mv;
	}
	
	/**
	 * 상품 상세페이지 내 상품리뷰 리스트 출력(정렬:점수순,최신순,페이징)
	 * @param currentPage
	 * @param search
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/review/detail/list.strap",produces="application/json;charset=utf-8",method=RequestMethod.GET)
	public String viewReviewListOnDetail(
			@RequestParam(value="page",required=false) Integer currentPage,
			@ModelAttribute Search search
			) {
		int page = (currentPage != null)? currentPage : 1;
		
		JSONObject jsonObject = new JSONObject();
		Paging paging = new Paging(rService.countReview(search), page, 5, 5);
		List<Review> rList = rService.printReview(paging, search);
		
		String rListJson = new Gson().toJson(rList);
		String searchJson = new Gson().toJson(search);
		String pagingJson = new Gson().toJson(paging);
		
		jsonObject.put("paging", pagingJson);
		jsonObject.put("search",searchJson);
		jsonObject.put("rList",rListJson);
		
		return jsonObject.toString();
	}
	
	//마이쇼핑 회원 후기 리스트 출력(필터: 날짜)
	@RequestMapping(value="/review/list.strap",method=RequestMethod.GET)
	public ModelAndView viewMemberReviewList(ModelAndView mv,
			@ModelAttribute Search search,
			@RequestParam(value="page",required=false) Integer currentPage,
			HttpSession session) {
		int page = (currentPage != null)? currentPage: 1;
		System.out.println(search.toString());
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		search.setMemberId(loginUser.getMemberId());
		Paging paging = new Paging(rService.countMemberReview(search), page, 10, 5);
		List<Review> rList = rService.printMemberReview(paging, search);
		//review에 product를 넣어야 한다.
		rList.stream().forEach(review->{
			review.setProduct(pService.printOneProduct(new Product(review.getProductNo())));
		});
		mv.addObject("rList",rList).
		addObject("search",search).
		addObject("paging",paging).
		setViewName("/shop/reviewList");
		return mv;
	}
	
	
	
	//후기작성ajax
	@ResponseBody
	@RequestMapping(value="/review/register.strap", method=RequestMethod.POST)
	public String registerReview(
			@ModelAttribute Review review,
			@RequestParam(value="reviewImg",required=false)MultipartFile multipartImg,
			HttpSession session) {
		//리뷰 작성 권한 체크
//		if(rService.checkReviewPossible(review) < 1) {
//			return "noneAuthority";
//		}
		
		MultipartFile rImg = (multipartImg != null) ? multipartImg : null;
		
		//경로, 파일리네임, 파일저장, review등록, update연쇄동작..
		String now = new SimpleDateFormat("yyyyMMddHHmmss").format(System.currentTimeMillis());
		String savePath = session.getServletContext().getRealPath("resources")+"\\image\\review";
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		try {
			if(!multipartImg.isEmpty()) {
				String reviewImgName = rImg.getOriginalFilename();
				String extension = reviewImgName.substring(reviewImgName.lastIndexOf(".")+1);
				String reviewImgRename = now + "_review."+ extension;
				
				review.setReviewImgName(reviewImgName);
				review.setReviewImgRename(reviewImgRename);
				review.setReviewImgRoot("/resources/image/review/"+reviewImgRename);
				rImg.transferTo(new File(savePath+"\\"+reviewImgRename));
			}
			if(rService.registerReview(review) > 0) {
				//리뷰 작성 성공 시 리뷰 작성권한을 N으로 바꾸어주어야 한다.
				//필요한 파라미터는 memberId, productNo, 여러개라면 더 오래된 작성권한을 N으로 갱신.
				//어떻게 구분하지? 고유 식별자를 반환 받아야할까 아니면 쿼리만으로 가능할까.
				//아 서브쿼리로 셀렉틀를 날짜 순으로 정렬하고 오래된거 하나를 지우는 것이다.
				if(rService.modifyReviewPossible(review)<1) {
					return "fail";
				}
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
	
	//상품후기 삭제
	@ResponseBody
	@RequestMapping(value="/review/remove.strap", method=RequestMethod.GET)
	public String removeReview(
			@RequestParam("reviewNo")Integer reviewNo) {
		if(rService.removeMemberReview(new Review(reviewNo)) >0) {
			return "success";
		}else {
			return "fail";
		}
	}
}
