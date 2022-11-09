package com.kh.strap.shop.review.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Product;
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
		if(rStore.insertReview(session, review) > 0) {
			return rStore.updateProductAfterReview(session, review);
		}else {
			return 0;
		}
	}
	@Override
	public List<Review> printReview(Paging paging, Search search) {
		return rStore.selectReview(session, paging, search);
	}
	@Override
	public List<Review> printMemberReview(Paging paging, Search search) {
		return rStore.selectMemberReview(session, paging, search);
	}
	@Override
	public int removeMemberReview(Review review) {
		return rStore.deleteMemberReview(session, review);
	}
	@Override
	public int countReview(Search search) {
		return rStore.selectCountReview(session, search);
	}
	@Override
	public int countMemberReview(Search search) {
		return rStore.selectCountMemberReview(session, search);
	}
	@Override
	public int registerReviewPossible(Integer ProductNo, String memberId) {
		return rStore.insertReviewPossible(session, ProductNo, memberId);
	}
}
