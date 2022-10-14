package com.kh.strap.shop.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService rService;
}
