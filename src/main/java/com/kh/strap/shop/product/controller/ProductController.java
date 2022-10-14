package com.kh.strap.shop.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.product.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService pService;
}
