package com.kh.strap.shop.review.store.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.review.domain.Review;
import com.kh.strap.shop.review.store.ReviewStore;

@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Override
	public int insertReview(SqlSession session, Review review) {
		return session.insert("ReviewMapper.insertReview", review);
	}
	
	//상품리뷰 추가 시 동작	
	@Override
	public int updateProductAfterReview(SqlSession session, Review review) {
		return session.update("ProductMapper.updateProductAfterReview",review);
	}
	
	//상세페이지 상품 리뷰
	@Override
	public List<Review> selectReview(SqlSession session, Paging paging, Search search) {
		return session.selectList("ReviewMapper.selectReview", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	
	@Override
	public int selectCountReview(SqlSession session, Search search) {
		return session.selectOne("ReviewMapper.selectCountReview", search);
	}

	@Override
	public List<Review> selectMemberReview(SqlSession session, Paging paging, Search search) {
		return session.selectList("ReviewMapper.selectMemberReview", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public int selectCountMemberReview(SqlSession session, Search search) {
		return session.selectOne("ReviewMapper.selectCountMemberReview", search);
	}
	
	@Override
	public int deleteMemberReview(SqlSession session, Review review) {
		return session.delete("ReviewMapper.deleteMemberReview", review);
	}

	@Override
	public int insertReviewPossible(SqlSession session, Integer ProductNo, String memberId) {
		Map<String,Object> buyParam = new HashMap<>();
		buyParam.put("productNo", ProductNo);
		buyParam.put("memberId",memberId);
		return session.insert("ReviewMapper.insertReviewPossible", buyParam);
	}



}
