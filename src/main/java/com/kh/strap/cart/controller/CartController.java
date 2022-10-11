package com.kh.strap.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.cart.service.logic.CartServiceImpl;


@Controller
public class CartController {
	@Autowired
	private CartServiceImpl cService;
}
