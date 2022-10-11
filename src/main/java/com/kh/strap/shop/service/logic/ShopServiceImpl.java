package com.kh.strap.shop.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.shop.service.ShopService;
import com.kh.strap.shop.store.logic.ShopStoreLogic;


@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private ShopStoreLogic sStore;
	
	
}
