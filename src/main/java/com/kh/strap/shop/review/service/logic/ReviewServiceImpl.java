package com.kh.strap.shop.review.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.review.domain.Review;
import com.kh.strap.shop.review.service.ReviewService;
import com.kh.strap.shop.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewStore rStore;
	@Autowired
	SqlSession session;
	@Override
	public int registerReview(Review review) {
		return rStore.insertReview(session, review);
	}
	@Override
	public List<Review> printReview(Paging paging, Review review) {
		return rStore.selectReview(session, paging, review);
	}
	@Override
	public List<Review> printMemberReview(Paging paging, Review review) {
		return rStore.selectMemberReview(session, paging, review);
	}
	@Override
	public int removeMemberReview(Review review) {
		return rStore.deleteMemberReview(session, review);
	}
}
