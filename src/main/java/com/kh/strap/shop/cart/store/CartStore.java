package com.kh.strap.shop.cart.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.cart.domain.Cart;

public interface CartStore {
	
	public int insertCart(SqlSession session, Cart cart);
	public int selectCheckCart(SqlSession session,Cart cart);
	public List<Cart> selectCart(SqlSession session,Cart cart);
	public List<Cart> selectCheckedCart(SqlSession session, String memberId);
	public int selectGetCountCart(SqlSession session,String memberId);
	public int updateQtyCart(SqlSession session,Cart cart);
	public int updateToQtyCart(SqlSession session,Cart cart);
	public int updateCheckCart(SqlSession session,Cart cart);
	public int deleteCart(SqlSession session,Cart cart);

}
