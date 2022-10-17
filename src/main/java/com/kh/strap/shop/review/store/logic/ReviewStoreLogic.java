package com.kh.strap.shop.review.store.logic;

import java.util.List;

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

	@Override
	public List<Review> selectReview(SqlSession session, Paging paging, Search search) {
		return session.selectList("ReviewMapper.selectReview", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public List<Review> selectMemberReview(SqlSession session, Paging paging, Search search) {
		return session.selectList("ReviewMapper.selectMemberReview", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public int selectCountReview(SqlSession session, Review review) {
		return session.selectOne("ReviewMapper.selectCountReview", review);
	}

	@Override
	public int selectCountMemberReview(SqlSession session, Review review) {
		return session.selectOne("ReviewMapper.selectCountMemberReview", review);
	}
	
	@Override
	public int deleteMemberReview(SqlSession session, Review review) {
		return session.delete("ReviewMapper.deleteMemberReview", review);
	}



}
