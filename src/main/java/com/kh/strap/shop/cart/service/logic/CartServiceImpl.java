package com.kh.strap.shop.cart.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.cart.domain.Cart;
import com.kh.strap.shop.cart.service.CartService;
import com.kh.strap.shop.cart.store.CartStore;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	SqlSession session;
	@Autowired
	CartStore cStore;
	
	
	@Override
	public int registerCart(Cart cart) {
		return cStore.insertCart(session, cart);
	}
	@Override
	public List<Cart> printCart(Paging paging,String memberId) {
		return cStore.selectCart(session,paging, memberId);
	}
	@Override
	public int modifyQtyCart(Cart cart) {
		return cStore.updateQtyCart(session, cart);
	}
	@Override
	public int removeCart(Cart cart) {
		return cStore.deleteCart(session, cart);
	}
	
}
