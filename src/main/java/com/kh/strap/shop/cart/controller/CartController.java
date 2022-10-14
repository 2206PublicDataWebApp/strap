package com.kh.strap.shop.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.cart.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService cService;
	
}
