package com.kh.strap.shop.cart.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.cart.domain.Cart;
import com.kh.strap.shop.cart.store.CartStore;

@Repository
public class CartStoreLogic implements CartStore {

	@Override
	public int insertCart(SqlSession session, Cart cart) {
		return session.insert("", cart);
	}

	@Override
	public List<Cart> selectCart(SqlSession session,Paging paging, String memberId) {
		return session.selectList("",memberId,new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public int updateQtyCart(SqlSession session, Cart cart) {
		return session.update("", cart);
	}

	@Override
	public int deleteCart(SqlSession session, Cart cart) {
		return session.delete("", cart);
	}
	
}
