package com.kh.strap.shop.product.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.shop.product.service.ProductService;
import com.kh.strap.shop.product.store.ProductStore;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductStore pStore;
	@Autowired
	SqlSession session;
	
}
