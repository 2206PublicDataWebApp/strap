package com.kh.strap.shop.review.service;

import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.review.domain.Review;

public interface ReviewService {
	
	public int registerReview(Review review);
	public List<Review> printReview(Paging paging,Review review);
	public List<Review> printMemberReview(Paging paging,Review review);
	public int removeMemberReview(Review review);

}
