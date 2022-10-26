package com.kh.strap.shop.cart.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.shop.cart.domain.Cart;
import com.kh.strap.shop.cart.service.CartService;
import com.kh.strap.shop.cart.store.CartStore;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.store.ProductStore;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	SqlSession session;
	@Autowired
	CartStore cStore;
	@Autowired
	ProductStore pStore;

	@Override
	public int registerCart(Cart cart) {
		if(cStore.selectCheckCart(session, cart) > 0) {
			//기존에 장바구니에 상품이 있으면 수량을 업데이트 한다.
			//수량 업데이트 성공 시 2 반환 실패시 0 반환
			return cStore.updateQtyCart(session, cart);
		}else {
			//기존에 장바구니에 상품이 없으면 인서트한다.
			//인서트 성공 시 1 반환 실패시 0 반환
			return cStore.insertCart(session, cart);
		}
	}

	@Override
	public List<Cart> printCart(Cart cart) {
		//카트 안에 상품을 넣어야 하므로 selectOneProduct를 호출한다.
		List<Cart> cList = cStore.selectCart(session, cart);
		cList.stream().forEach(c->{
			Product product = new Product();
			product.setProductNo(c.getProductNo());
			c.setProduct(pStore.selectOneProduct(session,product));
		});
		
		return cList;
	}
	
	@Override
	public List<Cart> printCheckedCart(String memberId) {
		return cStore.selectCheckedCart(session, memberId);
	}

	@Override
	public int removeCart(Cart cart) {
		return cStore.deleteCart(session, cart);
	}

	@Override
	public int modifyToQtyCart(Cart cart) {
		return cStore.updateToQtyCart(session, cart);
	}

	@Override
	public int modifyCheckCart(Cart cart) {
		return cStore.updateCheckCart(session, cart);
	}


	
	

}
