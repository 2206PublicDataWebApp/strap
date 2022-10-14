package com.kh.strap.shop.cart.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.shop.cart.service.CartService;
import com.kh.strap.shop.cart.store.CartStore;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	SqlSession session;
	@Autowired
	CartStore cStore;
	
}
