package com.kh.strap.shop.cart.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.shop.cart.domain.Cart;
import com.kh.strap.shop.cart.store.CartStore;

@Repository
public class CartStoreLogic implements CartStore {

	@Override
	public int insertCart(SqlSession session, Cart cart) {
		return session.insert("CartMapper.insertCart", cart);
	}
	
	@Override
	public int selectCheckCart(SqlSession session,Cart cart) {
		return session.selectOne("CartMapper.selectCheckCart",cart);
	}

	@Override
	public List<Cart> selectCart(SqlSession session, Cart cart) {
		return session.selectList("CartMapper.selectCart", cart);
	}

	@Override
	public int updateQtyCart(SqlSession session, Cart cart) {
		return session.update("CartMapper.updateQtyCart", cart);
	}

	@Override
	public int deleteCart(SqlSession session, Cart cart) {
		return session.delete("CartMapper.deleteCart", cart);
	}

	@Override
	public int updateToQtyCart(SqlSession session, Cart cart) {
		return session.update("CartMapper.updateToQtyCart",cart);
	}

	@Override
	public int updateCheckCart(SqlSession session, Cart cart) {
		return session.update("CartMapper.updateCheckCart", cart);
	}

}
