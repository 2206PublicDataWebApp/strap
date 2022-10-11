package com.kh.strap.cart.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.cart.service.CartService;
import com.kh.strap.cart.store.logic.CartStoreLogic;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private CartStoreLogic cStore;
	
	
}
