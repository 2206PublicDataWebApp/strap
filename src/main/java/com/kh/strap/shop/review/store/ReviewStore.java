package com.kh.strap.shop.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.review.domain.Review;

public interface ReviewStore {

//상품리뷰 추가
	public int insertReview(SqlSession session,Review review);
//상품리뷰 추가 시 동작
	//상품 리뷰가 등록 또는 삭제되면 PRODUCT테이블을 업데이트 한다.
	public int updateProductAfterReview(SqlSession session,Review review);
	
	public List<Review> selectReview(SqlSession session,Paging paging,Search search);
	public List<Review>selectMemberReview(SqlSession session,Paging paging,Search search);
	public int selectCountReview(SqlSession session, Search search);
	public int selectCountMemberReview(SqlSession session,Search search);
	public int deleteMemberReview(SqlSession session,Review review);
	
	//5.구매 시 리뷰 작성권한 등록/ 7일이내 1회 / memberId와 productNo가 필요하다.
	//이는 반복문 속에서 상품 종류마다 insert가 되어야 한다.
	public int insertReviewPossible(SqlSession session,Integer ProductNo, String memberId);
	//6.리뷰 작성권한 확인
	public int selectCheckReviewPossible(SqlSession session,Review review);
	//7.리뷰 작성권한 N 변경
	public int updateReviewPossible(SqlSession session,Review review);

}
