package com.kh.strap.shop.review.service;

import java.util.List;
import java.util.Map;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
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
	public int countReview(Search search);
	//회원REVIEW건수 카운트
	public int countMemberReview(Search search);
	//4.회원 페이지 리뷰 delete
	public int removeMemberReview(Review review);

	
	//5.구매 시 리뷰 작성권한 등록/ 7일이내 1회 / memberId와 productNo가 필요하다.
	//이는 반복문 속에서 상품 종류마다 insert가 되어야 한다.
	public int registerReviewPossible(Integer ProductNo, String memberId);
	//6.리뷰 작성권한 확인
	public int checkReviewPossible(Review review);
//	//7.리뷰 작성권한 N 변경
	public int modifyReviewPossible(Review review);
	
//탑3 상품별 베스트 후기 상품번호로 평점이 가장 높은 최근 후기 1개를 select
	public Review getBestReviewByProductNo(int productNo);
	
}
