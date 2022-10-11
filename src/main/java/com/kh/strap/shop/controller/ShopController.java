package com.kh.strap.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.strap.shop.service.logic.ShopServiceImpl;


@Controller
public class ShopController {
	@Autowired
	private ShopServiceImpl sService;
}
