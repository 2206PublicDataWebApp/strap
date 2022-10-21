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


}
