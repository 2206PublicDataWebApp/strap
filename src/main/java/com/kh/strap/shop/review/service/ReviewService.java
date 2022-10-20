package com.kh.strap.shop.review.service;

import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.review.domain.Review;

public interface ReviewService {

	
	//1.상품리뷰 insert
	public int registerReview(Review review);
	//상품 리뷰 등록 시 PRODUCT_TBL 의 GRADE_SUM 테이블을 update해야 한다. (product-mapper에서 처리)
	
	
	//2.상품 페이지 리뷰 select
	public List<Review> printReview(Paging paging,Search search);
	//3.회원 페이지 리뷰 select
	public List<Review> printMemberReview(Paging paging,Search search);
	//상품REVIEW건수 카운트
	public int countReview(Review review);
	//회원REVIEW건수 카운트
	public int countMemberReview(Review reivew);
	//4.회원 페이지 리뷰 delete
	public int removeMemberReview(Review review);

}
