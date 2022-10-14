package com.kh.strap.shop.cart.service;


import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.cart.domain.Cart;

public interface CartService {

	public int registerCart(Cart cart);
	public List<Cart> printCart(Paging paging, String memberId);
	public int modifyQtyCart(Cart cart);
	public int removeCart(Cart cart);
	
	
}
