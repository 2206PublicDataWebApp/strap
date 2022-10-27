package com.kh.strap.shop.cart.service;


import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.cart.domain.Cart;

public interface CartService {

	//1.장바구니추가: 장바구니에 해당 상품이 없을 경우 insert 있을 경우 수량 update
	public int registerCart(Cart cart);
	//2.장바구니목록: 해당 회원의 장바구니 List를 반환한다.
	public List<Cart> printCart(Cart cart);
	//3.체크된 장바구니 상품 목록 반환
	public List<Cart> printCheckedCart(String memberId);
	//4.장바구니에서 수량 변경 시 수량값으로 업데이트
	public int modifyToQtyCart(Cart cart);
	//5.장바구니 상품 체크 상태 변경
	public int modifyCheckCart(Cart cart);
	//6.장바구니상품제거:
	public int removeCart(Cart cart);
	
	
}
