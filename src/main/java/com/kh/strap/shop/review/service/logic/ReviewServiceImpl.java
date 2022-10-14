package com.kh.strap.shop.review.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.shop.review.service.ReviewService;
import com.kh.strap.shop.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	ReviewStore rStore;
	@Autowired
	SqlSession session;
}
