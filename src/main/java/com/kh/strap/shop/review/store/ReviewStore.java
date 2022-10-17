package com.kh.strap.shop.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.review.domain.Review;

public interface ReviewStore {
	
	public int insertReview(SqlSession session,Review review);
	public List<Review> selectReview(SqlSession session,Paging paging,Search search);
	public List<Review>selectMemberReview(SqlSession session,Paging paging,Search search);
	public int selectCountReview(SqlSession session, Review review);
	public int selectCountMemberReview(SqlSession session,Review review);
	public int deleteMemberReview(SqlSession session,Review review);

}
