package com.kh.strap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.admin.domain.Banner;
import com.kh.strap.admin.service.BannerService;
import com.kh.strap.board.domain.Board;
import com.kh.strap.board.service.logic.BoardServiceImpl;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.service.ProductService;
import com.kh.strap.shop.review.service.ReviewService;

/**
 * Handles requests for the application home page.r
 */
@Controller
public class HomeController {
	@Autowired
	private BannerService bnService;
	@Autowired
	private ProductService pService;
	@Autowired
	private ReviewService rService;
	@Autowired
	private BoardServiceImpl bService;
	
	@RequestMapping("/home.strap")
	public ModelAndView home(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		//배너 리스트
		List<Banner> bnList = bnService.printAllBanner();
		
		//베스트 후기 리스트
		int currentPage = (page != null) ? page : 1;
		List<Board> bList = bService.printBestRankBoard();
		
		//베스트 상품 리스트
		//1.(평점 높은순,리뷰개수 많은순) top3 상품 리스트
		List<Product> pList = pService.getTopProducts();
		//2.각 상품의 베스트 후기 1개를 가져와서set해준다.(평점 높은순, 최신순)
		pList.stream().forEach(product->{
			product.setReview(rService.getBestReviewByProductNo(product.getProductNo()));
		});
		
		mv.addObject("bnList", bnList);
		mv.addObject("bList", bList);
		mv.addObject("pList", pList);
		mv.addObject("page", page);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("/home");
		return mv;
	}
	
}
